
## VitalVerve SQL Data Schema Overview

### User Table (users):

Columns:
user_id (Primary Key): Unique identifier for each user.
full_name: User's full name.
age: User's age.
gender: User's gender.
height: User's height in cm.
weight: User's weight in kg.
email: User's email address.
profile_picture: URL to user's profile picture.
fitness_goal: User's fitness goal (e.g., weight loss, muscle gain).
Primary Key: user_id because it's a unique identifier for each user.
Data Integrity: The email column will have a unique constraint to ensure no two users have the same email.

### Workout Information Table (workouts):

Columns:
workout_id (Primary Key): Unique identifier for each workout.
user_id (Foreign Key): Refers to the users table.
workout_type: Type of workout (e.g., running, yoga).
duration: Duration of the workout in minutes.
heart_rate: Average heart rate during the workout.
calories_burned: Calories burned during the workout.
exercises: JSON or serialized data of exercises with repetitions and sets.
device_data: Data from wearable devices.
Foreign Keys: user_id linking to the users table.

### Nutrition Logs Table (nutrition_logs):

Columns:
log_id (Primary Key): Unique identifier for each log.
user_id (Foreign Key): Refers to the users table.
meal_type: Type of meal (e.g., breakfast, lunch).
ingredients: Detailed breakdown of ingredients with portion sizes.
macronutrients: JSON or serialized data of carbs, proteins, fats.
micronutrients: JSON or serialized data of vitamins and minerals.
Foreign Keys: user_id linking to the users table.

### Sleep Patterns Table (sleep_logs):

Columns:
sleep_id (Primary Key): Unique identifier for each sleep log.
user_id (Foreign Key): Refers to the users table.
sleep_duration: Total sleep duration in hours.
sleep_efficiency: Percentage of time spent in actual sleep.
sleep_stages: JSON or serialized data of light, deep, and REM sleep durations.
Foreign Keys: user_id linking to the users table.

### Other Health Metrics Table (health_metrics):

Columns:
metric_id (Primary Key): Unique identifier for each metric.
user_id (Foreign Key): Refers to the users table.
mood_log: User's mood on a particular day.
hydration_level: Amount of water intake in liters.
menstrual_cycle: Data related to female users' menstrual cycles.
Foreign Keys: user_id linking to the users table.

### Relationships and Constraints:

All tables except the users table have a foreign key (user_id) linking back to the users table, establishing a one-to-many relationship.
Unique constraints on email addresses and primary keys ensure data integrity.
Schema Justification:
This schema design provides a comprehensive view of a user's health and fitness journey. By segregating data into specific tables, it ensures efficient data retrieval and storage, aligning with VitalVerve's objectives.