-- Indexes for improved query performance
CREATE INDEX idx_users_user_id ON users (user_id);
CREATE INDEX idx_users_fitness_goal ON users (fitness_goal);
CREATE INDEX idx_workouts_user_id_date ON workouts (user_id, workout_date);
CREATE INDEX idx_workouts_calories_burned ON workouts (calories_burned);
CREATE INDEX idx_nutrition_logs_user_id_date ON nutrition_logs (user_id, log_date);
CREATE INDEX idx_sleep_logs_user_id_date ON sleep_logs (user_id, sleep_date);
CREATE INDEX idx_health_metrics_user_id_hydration ON health_metrics (user_id, hydration_level);

-- Retrieve a user's complete profile, including their fitness goals and personal details.
SELECT * FROM users 
WHERE user_id = 1;

-- List users who have a specific fitness goal, like weight loss.
SELECT user_id, full_name, fitness_goal FROM users 
WHERE fitness_goal = 'weight loss';

-- Extract a user's workout data for the past week.
SELECT * FROM workouts 
WHERE user_id = 1 AND workout_date BETWEEN date('now', '-7 days') AND date('now');

-- Identify users who have burned more than a specific number of calories in a single workout session.
SELECT DISTINCT(user_id) FROM workouts 
WHERE calories_burned > 250;

-- Retrieve a user's nutrition log for a specific day.
SELECT * FROM nutrition_logs 
WHERE user_id = 1 AND log_date = '2023-10-30';

-- Extract data showing a user's sleep efficiency and sleep stages for the past month.
SELECT * FROM sleep_logs 
WHERE user_id = 1 AND sleep_date BETWEEN date('now', '-30 days') AND date('now');

-- Compare a user's average workout duration this month vs the previous month.
WITH CurrentMonth AS (
    SELECT AVG(duration) as current_month_duration FROM workouts 
    WHERE user_id = 1 AND strftime('%m', workout_date) = strftime('%m', 'now')
),
PreviousMonth AS (
    SELECT AVG(duration) as previous_month_duration FROM workouts 
    WHERE user_id = 1 AND strftime('%m', workout_date) = strftime('%m', 'now', '-1 month')
)
SELECT current_month_duration, previous_month_duration FROM CurrentMonth, PreviousMonth;

-- Identify users who might benefit from a hydration-focused recommendation.
SELECT DISTINCT(workouts.user_id) FROM workouts
JOIN health_metrics ON workouts.user_id = health_metrics.user_id 
WHERE workouts.calories_burned > 500 AND health_metrics.hydration_level < 2.00;

-- Correlate sleep quality with workout performance for a user.
SELECT sleep_efficiency, AVG(workouts.duration) as average_workout_duration FROM sleep_logs 
JOIN workouts ON sleep_logs.user_id = workouts.user_id 
WHERE sleep_logs.user_id = 1 
GROUP BY sleep_efficiency;

-- Identify users who consistently work out but have irregular sleep patterns.
SELECT DISTINCT(workouts.user_id) FROM workouts 
JOIN sleep_logs ON workouts.user_id = sleep_logs.user_id 
WHERE sleep_logs.sleep_efficiency < 85 
GROUP BY workouts.user_id 
HAVING COUNT(DISTINCT workouts.workout_date) > 5;

-- Correlate average protein intake with workout duration for a user.
-- Note: This query assumes that the 'macronutrients' column can be parsed to extract protein intake.
-- This is a placeholder for the logic that would be required to parse the 'macronutrients' column.
SELECT AVG(CAST(SUBSTR(macronutrients, INSTR(macronutrients, 'Protein: ') + 9, INSTR(macronutrients, 'g') - (INSTR(macronutrients, 'Protein: ') + 9)) AS DECIMAL(5,2))) as average_protein, AVG(workouts.duration) as average_duration 
FROM nutrition_logs 
JOIN workouts ON nutrition_logs.user_id = workouts.user_id 
WHERE nutrition_logs.user_id = 1;
