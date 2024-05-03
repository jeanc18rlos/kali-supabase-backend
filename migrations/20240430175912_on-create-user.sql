CREATE OR REPLACE FUNCTION set_initial_user_data()
RETURNS TRIGGER AS $$
DECLARE
    _adjusted_date TIMESTAMPTZ;
    _initial_level INT;
    _initial_points_to_next_level INT;
    _initial_subscription_id INT;
    _initial_max_daily_steps INT;
BEGIN
    -- Convert current date to the user's timezone
    _adjusted_date := now() AT TIME ZONE NEW.timezone;

    -- Get initial level details from kali_levels
    SELECT id, step_count_to_next_level INTO _initial_level, _initial_points_to_next_level 
    FROM public.kali_levels 
    WHERE id = 1;  -- Assuming id=1 is your starting level

    -- Get initial subscription details from kali_subscriptions
    SELECT id, daily_points_limit INTO _initial_subscription_id, _initial_max_daily_steps 
    FROM public.kali_subscriptions 
    WHERE id = 1;  -- Assuming id=1 is your starting subscription

    -- Insert initial level and points data for the new user
    INSERT INTO public.user_levels (
        user_id,
        current_level,
        current_points,
        points_to_next_level
    )
    VALUES (
        NEW.user_id,
        _initial_level, -- Starting level id
        0,              -- Starting points, assuming starting from 0
        _initial_points_to_next_level -- Points needed to reach the next level
    );

    -- Insert initial streak data for the new user with timezone-adjusted date
    INSERT INTO public.streaks (
        user_id,
        current_streak,
        best_streak,
        last_update
    )
    VALUES (
        NEW.user_id,
        0,
        0,
        _adjusted_date - INTERVAL '1 day'  -- Set last update to the previous day
    );

    -- Initialize a default subscription for the new user
    INSERT INTO public.subscriptions (
        user_id,
        max_daily_steps,
        kali_subscription_id
    )
    VALUES (
        NEW.user_id,
        _initial_max_daily_steps,
        _initial_subscription_id  -- Dynamic max daily steps based on subscription
    );

    -- Return the new row from the trigger function
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Create a trigger to set initial data for a new user after creation in the users table

CREATE TRIGGER trigger_after_user_creation
AFTER INSERT ON public.user_profiles
FOR EACH ROW
EXECUTE FUNCTION set_initial_user_data();


