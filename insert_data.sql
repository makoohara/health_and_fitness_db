INSERT INTO users (user_id, full_name, age, gender, height, weight, email, profile_picture, fitness_goal)
VALUES 
(1, 'John Doe', 25, 'Male', 175, 70, 'john.doe@example.com', 'path/to/john.jpg', 'weight loss'),
(2, 'Jane Smith', 30, 'Female', 165, 55, 'jane.smith@example.com', 'path/to/jane.jpg', 'muscle gain'),
(3, 'Alice Johnson', 28, 'Female', 170, 60, 'alice.johnson@example.com', 'path/to/alice.jpg', 'maintenance');


INSERT INTO workouts (workout_id, user_id, workout_type, duration, calories_burned, heart_rate, exercises)
VALUES 
(1, 1, 'Running', 30, 300, 150, 'Outdoor run'),
(2, 2, 'Weightlifting', 45, 200, 120, 'Squats, Deadlifts'),
(3, 3, 'Yoga', 60, 150, 90, 'Sun Salutation, Tree Pose');


INSERT INTO nutrition_logs (log_id, user_id, log_date, meal, ingredients, portion_size, macronutrients, micronutrients)
VALUES 
(1, 1, '2023-10-30', 'Breakfast', 'Oatmeal, Blueberries', '1 bowl', 'Carbs: 40g, Protein: 10g, Fats: 5g', 'Vitamin C: 20mg'),
(2, 2, '2023-10-30', 'Lunch', 'Chicken Salad', '1 plate', 'Carbs: 20g, Protein: 30g, Fats: 10g', 'Vitamin C: 30mg'),
(3, 3, '2023-10-30', 'Dinner', 'Quinoa, Veggies', '1 plate', 'Carbs: 50g, Protein: 15g, Fats: 7g', 'Vitamin C: 40mg');


INSERT INTO sleep_logs (sleep_id, user_id, sleep_date, duration, sleep_efficiency, disturbances, sleep_stages)
VALUES 
(1, 1, '2023-10-29', 8, 90, 'None', 'Light: 4hrs, Deep: 3hrs, REM: 1hr'),
(2, 2, '2023-10-29', 7, 85, 'Woke up once', 'Light: 3.5hrs, Deep: 2.5hrs, REM: 1hr'),
(3, 3, '2023-10-29', 9, 95, 'None', 'Light: 5hrs, Deep: 3hrs, REM: 1hr');


INSERT INTO health_metrics (metric_id, user_id, log_date, mood, hydration, menstrual_cycle)
VALUES 
(1, 1, '2023-10-30', 'Happy', '2L', 'N/A'),
(2, 2, '2023-10-30', 'Neutral', '1.5L', 'Day 5'),
(3, 3, '2023-10-30', 'Sad', '2.5L', 'Day 10');
