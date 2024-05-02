
CREATE OR REPLACE FUNCTION get_user_dashboard(dashboard_user_id UUID, dashboard_user_timezone TEXT DEFAULT NULL)
RETURNS TABLE (
    user_id UUID,
    name TEXT,
    profile_image_url TEXT,
    steps_today INT,
    goal_today INT,
    current_level INT,
    current_points INT,
    points_to_next_level INT,
    current_streak INT,
    weekly_streak TEXT[],
    last_update DATE
) AS $$
DECLARE
    _timezone TEXT;
BEGIN
    -- Determining the effective timezone: parameter or user's default
    SELECT dashboard_user_timezone INTO _timezone FROM users WHERE users.user_id = dashboard_user_id;

    RETURN QUERY
    SELECT
        u.user_id,
        u.name::TEXT,
        u.profile_image_url::TEXT,
        COALESCE(s.step_count, 0) AS steps_today,
        COALESCE((SELECT g.steps_goal
                 FROM goals g
                 WHERE g.user_id = u.user_id
                 ORDER BY g.effective_date DESC
                 LIMIT 1), 0) AS goal_today,
        COALESCE(ul.current_level, 1) AS current_level,
        COALESCE(ul.current_points, 0) AS current_points,
        COALESCE(ul.points_to_next_level, 100) AS points_to_next_level,
        COALESCE(st.current_streak, 0) AS current_streak,
        -- logic to determine the weekly streak
        (SELECT COALESCE(ARRAY_AGG(DISTINCT TO_CHAR(d.day, 'Day')), '{}') AS weekly_streak
            FROM generate_series(
                    date_trunc('week', (now() AT TIME ZONE _timezone))::DATE,
                    (date_trunc('week', (now() AT TIME ZONE _timezone)) + '6 days'::interval)::DATE,
                    '1 day'
                ) AS d(day)
            LEFT JOIN steps stp ON stp.user_id = dashboard_user_id AND stp.last_update = d.day
            WHERE stp.step_count > 0),
        -- last_update is the last recorded step count, not necesarily today, for the user in the column date, if no record is found, it defaults to null
         (SELECT MAX(last_step.last_update) FROM steps last_step  WHERE last_step.user_id = dashboard_user_id) AS last_update
     
    FROM
        users u
        LEFT JOIN steps s ON u.user_id = s.user_id AND s.last_update = (now() AT TIME ZONE _timezone)::date
        LEFT JOIN user_levels ul ON u.user_id = ul.user_id
        LEFT JOIN streaks st ON u.user_id = st.user_id
    WHERE u.user_id = dashboard_user_id;
END;
$$ LANGUAGE plpgsql STABLE;