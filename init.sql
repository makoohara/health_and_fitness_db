CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INT,
    gender VARCHAR(50),
    height DECIMAL(5,2),
    weight DECIMAL(5,2),
    email VARCHAR(255) UNIQUE NOT NULL,
    profile_picture VARCHAR(255),
    fitness_goal VARCHAR(255)
);

CREATE TABLE workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    workout_date DATE,
    workout_type VARCHAR(255),
    duration DECIMAL(5,2),
    heart_rate INT,
    calories_burned INT,
    exercises TEXT,
    device_data TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE nutrition_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    log_date DATE,
    meal_type VARCHAR(255),
    ingredients TEXT,
    macronutrients TEXT,
    micronutrients TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE sleep_logs (
    sleep_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    sleep_date DATE,
    sleep_duration DECIMAL(5,2),
    sleep_efficiency DECIMAL(5,2),
    sleep_stages TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE health_metrics (
    metric_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    log_date DATE,
    mood_log VARCHAR(255),
    hydration_level DECIMAL(5,2),
    menstrual_cycle TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

