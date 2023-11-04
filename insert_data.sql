-- Insert data into users table
INSERT INTO users (full_name, age, gender, height, weight, email, profile_picture, fitness_goal) VALUES 
('John Doe', 25, 'Male', 175.00, 70.00, 'john.doe@example.com', 'path/to/john.jpg', 'weight loss'),
('Jane Smith', 30, 'Female', 165.00, 55.00, 'jane.smith@example.com', 'path/to/jane.jpg', 'muscle gain'),
('Alice Johnson', 28, 'Female', 170.00, 60.00, 'alice.johnson@example.com', 'path/to/alice.jpg', 'maintenance');

-- Insert data into workouts table with conditions for queries
INSERT INTO workouts (user_id, workout_date, workout_type, duration, calories_burned, heart_rate, exercises) VALUES 
(1, '2023-10-30', 'Running', 60.00, 600, 150, 'Outdoor run'),
(1, '2023-10-29', 'Cycling', 45.00, 450, 130, 'Indoor cycling'),
(1, '2023-10-28', 'Swimming', 30.00, 300, 140, 'Laps in pool'),
(1, '2023-10-27', 'Gym', 50.00, 500, 135, 'Weight training'),
(1, '2023-10-26', 'Running', 60.00, 600, 155, 'Treadmill run'),
(1, '2023-10-25', 'Aerobics', 40.00, 400, 120, 'Aerobics class'),
(1, '2023-10-24', 'Yoga', 50.00, 250, 110, 'Yoga session');

-- Insert data into nutrition_logs table with macronutrients details
INSERT INTO nutrition_logs (user_id, log_date, meal_type, ingredients, macronutrients, micronutrients) VALUES 
(1, '2023-10-30', 'Breakfast', 'Eggs, Toast', 'Carbs: 30g, Protein: 20g, Fats: 10g', 'Vitamin C: 20mg'),
(1, '2023-10-29', 'Lunch', 'Chicken Salad', 'Carbs: 10g, Protein: 30g, Fats: 15g', 'Vitamin C: 30mg'),
(1, '2023-10-28', 'Dinner', 'Steak', 'Carbs: 5g, Protein: 25g, Fats: 20g', 'Vitamin C: 40mg');

-- Insert data into sleep_logs table with varying sleep efficiency
INSERT INTO sleep_logs (user_id, sleep_date, sleep_duration, sleep_efficiency, sleep_stages) VALUES 
(1, '2023-10-30', 8.00, 90.00, 'Light: 4hrs, Deep: 3hrs, REM: 1hr'),
(1, '2023-10-29', 7.00, 80.00, 'Light: 3.5hrs, Deep: 2.5hrs, REM: 1hr'),
(1, '2023-10-28', 6.00, 84.00, 'Light: 5hrs, Deep: 3hrs, REM: 1hr');

-- Insert data into health_metrics table with hydration levels
INSERT INTO health_metrics (user_id, log_date, mood_log, hydration_level, menstrual_cycle) VALUES 
(1, '2023-10-30', 'Happy', 1.50, 'N/A'),
(2, '2023-10-30', 'Neutral', 1.50, 'Day 5'),
(3, '2023-10-30', 'Sad', 2.50, 'Day 10');
