CREATE OR REPLACE FUNCTION create_user_on_signup()
    RETURNS TRIGGER
    AS $$
BEGIN
    INSERT INTO public.user_profiles(user_id, email, timezone, profile_image_url)
        VALUES(NEW.id, NEW.email, NEW.raw_user_meta_data ->> 'timezone', 'http://example.com/syd_user.jpg');
    RETURN NEW;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

CREATE TRIGGER create_user_on_signup
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION public.create_user_on_signup();

