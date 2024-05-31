-- This migration creates a function to set the daily goal for a user
-- based on their timezone. The function calculates the local date

CREATE OR REPLACE FUNCTION set_daily_goal(_user_id UUID, _goal INT, _user_timezone TEXT)
RETURNS VOID AS $$
DECLARE
    _local_date DATE;
BEGIN
    -- Convert the current timestamp to the user's timezone and extract the date
    _local_date := (now() AT TIME ZONE _user_timezone)::DATE;

    -- Upsert strategy to handle the goal entry
    INSERT INTO goals (user_id, steps_goal, effective_date, is_active)
    VALUES (_user_id, _goal, _local_date, TRUE) -- Directly use the calculated date
    ON CONFLICT (user_id, effective_date)
    DO UPDATE SET
        steps_goal = EXCLUDED.steps_goal,
        is_active = EXCLUDED.is_active;
END;
$$ LANGUAGE plpgsql;
