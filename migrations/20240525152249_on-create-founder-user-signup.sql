CREATE OR REPLACE FUNCTION shop.create_founder_user_on_signup()
    RETURNS TRIGGER
    AS $$
BEGIN
    RAISE NOTICE 'SHop Founder creation  is currently %', NEW; 
    IF (NEW.raw_user_meta_data ->> 'role' IS NOT NULL or NEW.raw_user_meta_data ->> 'role' = 'founder') THEN
        INSERT INTO shop.founders_profiles(user_id, email, name, surename, phone_number, role )
                VALUES(NEW.id, NEW.email,NEW.raw_user_meta_data ->> 'name' , NEW.raw_user_meta_data ->> 'surename', NEW.raw_user_meta_data ->> 'phone', NEW.raw_user_meta_data ->> 'role');
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;


CREATE OR REPLACE TRIGGER create_founder_user_on_signup
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION shop.create_founder_user_on_signup();

