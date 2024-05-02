-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    timezone VARCHAR(50) NOT NULL,
    name VARCHAR(255),
    bio TEXT,
    phone_number VARCHAR(20),
    birthdate_calendar_date DATE,
    profile_image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
--- End of Users table

-- Steps table
CREATE TABLE IF NOT EXISTS steps (
    steps_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    last_update DATE NOT NULL,
    step_count INT DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Add index to steps table for user_id and date columns

CREATE UNIQUE INDEX idx_steps_user_date ON steps (user_id, last_update);

-- Add unique constraint to steps table for user_id and date columns

ALTER TABLE steps ADD CONSTRAINT unique_user_date UNIQUE (user_id, last_update);


--- End of Steps table

-- Goals table

CREATE TABLE IF NOT EXISTS goals (
    goal_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    steps_goal INT,
    effective_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    UNIQUE (user_id, effective_date)
);

-- Add index to goals table for user_id and effective_date columns

CREATE INDEX idx_goals_user_effective ON goals (user_id, effective_date);

--- End of Goals table

-- User levels table

CREATE TABLE user_levels (
    level_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    current_level INT,
    current_points INT,
    points_to_next_level INT
);

-- End of User levels table

-- Streaks table

CREATE TABLE IF NOT EXISTS streaks (
    streak_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    current_streak INT DEFAULT 0,
    best_streak INT DEFAULT 0,
    last_update DATE NOT NULL
);

-- End of Streaks table

-- Kali levels table

CREATE TABLE IF NOT EXISTS kali_levels (
    id SERIAL PRIMARY KEY,
    level_name TEXT NOT NULL,
    image_url TEXT NOT NULL,
    motivational_quote TEXT NOT NULL,
    reward INT NOT NULL,  -- Points added as a reward when reaching this level
    step_count_to_next_level INT NOT NULL  -- Steps required to reach the next level
);

-- Kali subscriptions table

CREATE TABLE IF NOT EXISTS kali_subscriptions (
    id SERIAL PRIMARY KEY,
    subscription_name TEXT NOT NULL,
    daily_points_limit INT NOT NULL  -- Maximum daily points allowed
);

-- Subscriptions table

CREATE TABLE IF NOT EXISTS subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id UUID REFERENCES users(user_id),
    kali_subscription_id INT REFERENCES kali_subscriptions(id),
    max_daily_steps INT
);

-- End of Subscriptions table

