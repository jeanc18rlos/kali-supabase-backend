CREATE OR REPLACE FUNCTION create_user_on_signup()
    RETURNS TRIGGER
    AS $$
BEGIN
    RAISE NOTICE 'Public user is currently %', NEW.raw_user_meta_data ->> 'role'; 
    IF ((NEW.raw_user_meta_data ->> 'role' IS NULL) or (NEW.raw_user_meta_data ->> 'role' = 'app')) THEN
        INSERT INTO public.user_profiles(user_id, email, timezone, profile_image_url)
                VALUES(NEW.id, NEW.email, NEW.raw_user_meta_data ->> 'timezone', 'http://example.com/syd_user.jpg');
    ENd IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;
