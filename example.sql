


-- Insert a user from New York
INSERT INTO users (email, timezone, name, profile_image_url)
VALUES ('ny_user@example.com', 'America/New_York', 'NY User', 'http://example.com/ny_user.jpg');

-- Insert a user from Sydney
INSERT INTO users (email, timezone, name, profile_image_url)
VALUES ('syd_user@example.com', 'Australia/Sydney', 'Sydney User', 'http://example.com/syd_user.jpg');

-- Now check the streaks table
SELECT user_id, last_update AT TIME ZONE 'UTC', last_update
FROM streaks
ORDER BY user_id;



-- For a user in New York (typically behind UTC)
SELECT set_daily_goal('4e71c633-3b96-4807-8dac-f8185b15d4b6', 10000, 'Australia/Sydney');


-- For a user in Sydney (often ahead of UTC, causing the day transition)


SELECT * FROM get_user_dashboard('8601e4c7-6282-4aa9-a433-725a5f6f42d0', 'Australia/Sydney');

SELECT update_steps('4e71c633-3b96-4807-8dac-f8185b15d4b6', 500, 'Australia/Sydney');

SELECT set_daily_goal('f8cf83c9-7ef0-4e44-97e7-6c7e8010f0bb', 9877, 'Australia/Sydney');


SELECT set_daily_goal('f8cf83c9-7ef0-4e44-97e7-6c7e8010f0bb', 9877, 'Australia/Sydney');

SELECT * FROM get_user_dashboard('f8cf83c9-7ef0-4e44-97e7-6c7e8010f0bb', 'Australia/Sydney');


SELECT * FROM get_user_dashboard('51134f67-486f-4d7a-a254-fd508c3b182d', 'America/New_York');

SELECT set_daily_goal('f8cf83c9-7ef0-4e44-97e7-6c7e8010f0bb', 9877, 'Australia/Sydney');

SELECT update_steps('4e71c633-3b96-4807-8dac-f8185b15d4b6', 500, 'Australia/Sydney');

-- For a user in New York (typically behind UTC)
SELECT set_daily_goal('4e71c633-3b96-4807-8dac-f8185b15d4b6', 10000, 'Australia/Sydney');


-- For a user in New York (typically behind UTC)
SELECT set_daily_goal('4e71c633-3b96-4807-8dac-f8185b15d4b6', 10000, 'Australia/Sydney');


-- For a user in Sydney (often ahead of UTC, causing the day transition)