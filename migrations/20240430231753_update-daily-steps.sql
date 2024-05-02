CREATE OR REPLACE FUNCTION update_steps(_user_id uuid, _steps INT, _user_timezone TEXT)
RETURNS VOID
AS $$
DECLARE
    _today DATE;
    _start_of_week DATE;
    _total_weekly_steps INT;
    _max_weekly_steps INT;
    _new_points INT;
    _next_level_reward INT;
    _next_level_points_to_next_level INT;
    _add_points BOOLEAN := TRUE;
    _current_step_count INT;
    _step_diff INT;
    _points_to_next_level INT;
    _current_level INT;
    _current_level_reward INT;
BEGIN

    _today := (NOW() AT TIME ZONE _user_timezone)::DATE;
    _start_of_week := DATE_TRUNC('week', _today)::DATE;

-- Check the current step count for today and save it into _current_step_count
    SELECT step_count INTO _current_step_count
    FROM steps
    WHERE user_id = _user_id
      AND last_update = _today;

IF _current_step_count IS NULL THEN
    _current_step_count := 0;
END IF;


-- Throw error if steps is less than _current_step_count
    IF _steps < _current_step_count THEN
        RAISE EXCEPTION 'Steps cannot be less than the current step count';
    END IF;
    
    _step_diff := _steps - _current_step_count;

    RAISE NOTICE 'Step diff: %', _step_diff;

-- Calculate the total steps this week
    SELECT COALESCE(SUM(step_count), 0) INTO _total_weekly_steps
    FROM steps
    WHERE user_id = _user_id
      AND last_update >= _start_of_week;

IF _total_weekly_steps IS NULL THEN
    _total_weekly_steps := 0;
END IF;

-- Get weekly steps limit from subscription
    SELECT max_daily_steps * 7 INTO _max_weekly_steps
    FROM subscriptions
    WHERE user_id = _user_id;

-- Calculate if adding current steps exceeds weekly limit
    IF _total_weekly_steps + _step_diff >= _max_weekly_steps THEN
        _add_points := FALSE;
    END IF;

-- Insert or update steps for today based on the existing count
    INSERT INTO steps(user_id, last_update, step_count, created_at)
    VALUES (_user_id, _today, _steps, NOW())
    ON CONFLICT (user_id, last_update)
    DO UPDATE SET step_count = EXCLUDED.step_count;
    
-- Only update points and check for level up if weekly limit is not reached
    IF _add_points THEN
        -- Retrieve next level requirements

--       Retrieve current level and points to next level

        SELECT points_to_next_level, current_level INTO _points_to_next_level, _current_level
        FROM user_levels
        WHERE user_id = _user_id;


        SELECT reward, step_count_to_next_level INTO _next_level_reward, _next_level_points_to_next_level
        FROM kali_levels
        WHERE id = _current_level + 1;

        SELECT reward INTO _current_level_reward
        FROM kali_levels
        WHERE id = _current_level;


        -- Update current points
        UPDATE user_levels
        SET current_points = COALESCE(current_points, 0) + _step_diff
        WHERE user_id = _user_id
        RETURNING current_points INTO _new_points;

        -- Level Up condition: check if the new points are enough for the next level
        IF _new_points >= _points_to_next_level THEN
            UPDATE user_levels
            SET current_level = current_level + 1,
                current_points = _new_points + _current_level_reward,
                points_to_next_level = _next_level_points_to_next_level
            WHERE user_id = _user_id;
        END IF;
    END IF;

-- Update streaks logic based on today's entry

    PERFORM update_streak(_user_id, _today);
    RETURN;
END;
$$
LANGUAGE plpgsql;

