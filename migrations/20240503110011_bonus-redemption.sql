CREATE TABLE IF NOT EXISTS "public"."bonus_redemptions"(
    "redemption_id" serial PRIMARY KEY,
    "user_id" uuid NOT NULL,
    "redemption_date" date NOT NULL,
    "bonus_amount" integer NOT NULL,
    CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "public"."user_profiles"("user_id")
);

-- Create an index for faster lookup of the latest redemption date by user
CREATE INDEX IF NOT EXISTS "idx_user_redemption_date" ON "public"."bonus_redemptions"("user_id", "redemption_date");

CREATE OR REPLACE FUNCTION public.redeem_daily_bonus(_user_id uuid, _timezone text)
    RETURNS TABLE(
        status text,
        message text
    )
    AS $$
DECLARE
    last_redemption RECORD;
    today date;
    consecutive_days integer := 0;
    _bonus_amount integer;
    _current_points integer;
    _current_level integer;
    _next_level_points integer;
    _new_points integer;
BEGIN
    -- Convert current timestamp to user's timezone and extract the date
    today :=(NOW() AT TIME ZONE _timezone)::date;
    -- Look up the last redemption entry for this user
    SELECT
        * INTO last_redemption
    FROM
        public.bonus_redemptions
    WHERE
        user_id = _user_id
    ORDER BY
        redemption_date DESC
    LIMIT 1;
    -- Check if today's bonus was already redeemed
    IF last_redemption IS NOT NULL AND last_redemption.redemption_date = today THEN
        RETURN QUERY
        SELECT
            'Fail' AS status,
            'Bonus already redeemed today' AS message;
        RETURN;
        -- Prevents further execution
    END IF;
    -- Calculate consecutive days
    IF last_redemption IS NOT NULL AND last_redemption.redemption_date = today - INTERVAL '1 day' THEN
        consecutive_days := 1;
        -- Starts with yesterday if applicable
        WHILE last_redemption IS NOT NULL
            AND last_redemption.redemption_date = today - INTERVAL '1 day' * consecutive_days LOOP
                consecutive_days := consecutive_days + 1;
                -- Increase for prior consecutive days
            END LOOP;
    END IF;
    -- Determine the bonus based on consecutive days count
    _bonus_amount := 1000;
    -- Daily bonus amount
    IF consecutive_days = 10 THEN
        _bonus_amount := 20000;
        -- 10 day bonus amount
    END IF;
    -- Add bonus to user_levels and check for level changes
    SELECT
        current_points,
        current_level INTO _current_points,
        _current_level
    FROM
        user_levels
    WHERE
        user_id = _user_id;
    _new_points := _current_points + _bonus_amount;
    SELECT
        step_count_to_next_level INTO _next_level_points
    FROM
        kali_levels
    WHERE
        id = _current_level + 1;
    IF _new_points >= _next_level_points THEN
        UPDATE
            user_levels
        SET
            current_level = _current_level + 1,
            current_points = _new_points - _next_level_points
        WHERE
            user_id = _user_id;
        RETURN QUERY
        SELECT
            'Success' AS status,
            'Level up! Bonus redeemed successfully' AS message;
    ELSE
        UPDATE
            user_levels
        SET
            current_points = _new_points
        WHERE
            user_id = _user_id;
        RETURN QUERY
        SELECT
            'Success' AS status,
            'Bonus redeemed successfully' AS message;
    END IF;
    -- Add redemption record
    INSERT INTO public.bonus_redemptions(user_id, redemption_date, bonus_amount)
        VALUES (_user_id, today, _bonus_amount);
END;
$$
LANGUAGE plpgsql;

