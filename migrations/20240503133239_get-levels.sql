CREATE OR REPLACE FUNCTION public.get_user_future_levels(_user_id UUID, _timezone TEXT, _limit INT DEFAULT 10)
RETURNS TABLE (
    id INT,
    level_name TEXT,
    image_url TEXT,
    motivational_quote TEXT,
    reward INT,
    step_count_to_next_level INT
) AS $$

DECLARE
    _current_level INT;
BEGIN
    -- Getting the user's current level
    SELECT current_level INTO _current_level 
    FROM user_levels
    WHERE user_id = _user_id;

    -- Handle case when current level is not found
    IF _current_level IS NULL THEN
        RAISE EXCEPTION 'No current level found for user_id %', _user_id;
    END IF;
    
    -- Return current and future levels based on the current level and the provided limit
    RETURN QUERY 
    SELECT 
        kali_levels.id,
        kali_levels.level_name,
        kali_levels.image_url,
        kali_levels.motivational_quote,
        kali_levels.reward,
        kali_levels.step_count_to_next_level
    FROM kali_levels
    WHERE kali_levels.id >= _current_level
    ORDER BY kali_levels.id
    LIMIT _limit;

END;
$$ LANGUAGE plpgsql;