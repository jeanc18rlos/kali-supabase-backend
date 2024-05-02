CREATE OR REPLACE FUNCTION update_streak(_user_id UUID, _today DATE)
RETURNS VOID AS $$
DECLARE
    _last_streak_date DATE;
BEGIN
    -- GET THE user streak and last step date
    SELECT last_update INTO _last_streak_date FROM streaks WHERE user_id = _user_id;
    
    -- Do not update if streak was already updated today
    IF _last_streak_date = _today THEN 
        RETURN;
    ELSIF _last_streak_date = _today - INTERVAL '1 day' THEN
        -- Update streak if the last update was yesterday
        UPDATE streaks
        SET current_streak = current_streak + 1,
            best_streak = GREATEST(best_streak, current_streak + 1),
            last_update = _today
        WHERE user_id = _user_id;
    ELSE
        -- Reset streak if the last update was more than one day ago
        UPDATE streaks
        SET current_streak = 1,
            best_streak = GREATEST(best_streak, current_streak),
            last_update = _today
        WHERE user_id = _user_id;
    END IF;
END;
$$ LANGUAGE plpgsql;