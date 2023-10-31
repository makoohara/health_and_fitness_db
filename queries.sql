-- User Profile Analysis:

-- Retrieve a user's complete profile, including their fitness goals and personal details.
SELECT * 
FROM users 
WHERE user_id = ?;

-- List users who have a specific fitness goal, like weight loss.
SELECT user_id, full_name, fitness_goal 
FROM users 
WHERE fitness_goal = 'weight loss';

-- Workout Tracking:

-- Extract a user's workout data for the past week.
SELECT * 
FROM workouts 
WHERE user_id = ? AND workout_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE();

-- Identify users who have burned more than a specific number of calories in a single workout session.
SELECT user_id 
FROM workouts 
WHERE calories_burned > ?;

-- Nutrition Analysis:

-- Retrieve a user's nutrition log for a specific day.
SELECT * 
FROM nutrition_logs 
WHERE user_id = ? AND log_date = ?;

-- Find users who consistently consume below the recommended daily intake of Vitamin C.
SELECT user_id 
FROM nutrition_logs 
WHERE vitamin_c_intake < ? 
GROUP BY user_id HAVING COUNT(log_date) > 5;

-- Sleep Pattern Assessment:

-- Extract data showing a user's sleep efficiency and sleep stages for the past month.
SELECT * 
FROM sleep_logs 
WHERE user_id = ? AND sleep_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 30 DAY) AND CURDATE();

-- Identify users who have had less than a specific number of hours of deep sleep in the past week.
SELECT user_id 
FROM sleep_logs 
WHERE deep_sleep_duration < ? AND sleep_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE();

-- User Progress Monitoring:

-- Track a user's weight changes over the past six months.
SELECT user_id, weight, log_date 
FROM weight_logs 
WHERE user_id = ? AND log_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND CURDATE();

-- Compare a user's average workout duration this month vs the previous month.
WITH CurrentMonth AS (
    SELECT AVG(duration) as current_month_duration FROM workouts WHERE user_id = ? AND MONTH(workout_date) = MONTH(CURDATE())
),
PreviousMonth AS (
    SELECT AVG(duration) as previous_month_duration FROM workouts WHERE user_id = ? AND MONTH(workout_date) = MONTH(CURDATE()) - 1
)
SELECT current_month_duration, previous_month_duration FROM CurrentMonth, PreviousMonth;

-- Personalized Recommendations:

-- Identify users who might benefit from a hydration-focused recommendation.
SELECT user_id 
FROM workouts 
JOIN nutrition_logs 
ON workouts.user_id = nutrition_logs.user_id 
WHERE workouts.calories_burned > 500 AND nutrition_logs.water_intake < 2000ml;

-- Recommend a nutrition plan for users who frequently miss out on protein.
SELECT user_id 
FROM nutrition_logs 
WHERE protein_intake < 200 
GROUP BY user_id HAVING COUNT(log_date) > 10;

-- Advanced Scenarios:

-- Correlate sleep quality with workout performance for a user.
SELECT sleep_logs.sleep_quality, AVG(workouts.duration) as average_workout_duration 
FROM sleep_logs 
JOIN workouts 
ON sleep_logs.user_id = workouts.user_id 
WHERE sleep_logs.user_id = ? 
GROUP BY sleep_logs.sleep_quality;

-- Identify users who consistently work out but have irregular sleep patterns.
SELECT workouts.user_id 
FROM workouts 
JOIN sleep_logs 
ON workouts.user_id = sleep_logs.user_id 
WHERE sleep_logs.sleep_efficiency < 85 
GROUP BY workouts.user_id 
HAVING COUNT(DISTINCT workouts.workout_date) > 5;

-- Optimization and Insights:

-- Use JOIN operations to extract insights more efficiently.
-- Example: Correlate average protein intake with workout duration for a user.
SELECT AVG(nutrition_logs.protein_intake) as average_protein, AVG(workouts.duration) as average_duration 
FROM nutrition_logs 
JOIN workouts 
ON nutrition_logs.user_id = workouts.user_id 
WHERE nutrition_logs.user_id = ?;

-- Ensure queries are optimized for performance by using appropriate indexing, especially on columns used in WHERE clauses and JOIN operations.
