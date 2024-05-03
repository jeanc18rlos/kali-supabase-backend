CREATE OR REPLACE FUNCTION public.get_leaderboard(_user_id uuid, _timezone text, _period text, _limit int DEFAULT 10)
RETURNS TABLE (
    user_position int,
    user_profile_image text,
    name text,
    steps int,
    is_current_user boolean
)
AS $$
DECLARE
    start_date DATE;
    user_steps INT;
    user_exists BOOLEAN;
    user_position INT;
BEGIN 
    -- Determine the start date based on the period 
    CASE _period
        WHEN 'daily' THEN
            start_date := (CURRENT_DATE AT TIME ZONE _timezone);
        WHEN 'weekly' THEN
            start_date := (DATE_TRUNC('week', (NOW() AT TIME ZONE _timezone))::DATE);
        WHEN 'monthly' THEN
            start_date := (DATE_TRUNC('month', (NOW() AT TIME ZONE _timezone))::DATE);
        ELSE
            RAISE EXCEPTION 'Invalid period specified. Please choose daily, weekly, or monthly.';
    END CASE;

    -- Collect leaderboard data
    CREATE TEMP TABLE temp_leaderboard AS
    SELECT
        up.user_id AS tbl_user_id,
        up.profile_image_url as tbl_user_profile_image,
        up.name AS tbl_name,
        SUM(s.step_count) as tbl_steps
    FROM
        steps s
        JOIN user_profiles up ON s.user_id = up.user_id
    WHERE
        s.last_update >= start_date
    GROUP BY
        up.user_id, up.profile_image_url, up.name;

    -- Determine current user's step count
    SELECT SUM(step_count) INTO user_steps FROM steps
    WHERE user_id = _user_id AND last_update >= start_date;

    -- Modified leaderboard with positions
    CREATE TEMP TABLE temp_leaderboard_modified AS
    SELECT
        tbl_user_id,
        tbl_user_profile_image,
        tbl_name,
        tbl_steps,
        ROW_NUMBER() OVER (ORDER BY tbl_steps DESC)::int AS tbl_user_position,
        (tbl_user_id = _user_id) AS tbl_is_current_user
    FROM
        temp_leaderboard
    ORDER BY tbl_steps DESC;




    -- Check if there is a row with tbl_is_current_user = TRUE
     SELECT tbl_user_position INTO user_position FROM temp_leaderboard_modified
    WHERE tbl_is_current_user = TRUE
    LIMIT 1;

    -- Determine if user exists and the position is beyond the limit
    user_exists := (user_position IS NOT NULL );

   IF user_exists AND user_position > _limit THEN
        -- Delete the entry at position _limit
        DELETE FROM temp_leaderboard_modified
        WHERE tbl_user_position = _limit;

        -- Update the current user's position to _limit
        UPDATE temp_leaderboard_modified
        SET tbl_user_position = _limit
        WHERE tbl_user_position = user_position;
    END IF;
        RETURN QUERY
        SELECT
            tbl_user_position AS user_position,
            tbl_user_profile_image AS user_profile_image,
            tbl_name::TEXT AS name,
            tbl_steps::INT AS steps,
            tbl_is_current_user AS is_current_user
        FROM
            temp_leaderboard_modified
        ORDER BY
            tbl_user_position
        LIMIT _limit; -- Adjust limit to include the newly added user


    -- Cleanup temporary tables
    DROP TABLE temp_leaderboard;
    DROP TABLE temp_leaderboard_modified;
END;
$$ LANGUAGE plpgsql;