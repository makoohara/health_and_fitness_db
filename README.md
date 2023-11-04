# Fitness Tracker Database

This repository contains the SQL schema and data insertion scripts for a fitness tracker application. It also includes a set of predefined queries to analyze the data.

## Project Structure

- `init.sql`: This file contains the SQL commands to create the database schema.
- `insert_data.sql`: This file contains SQL commands to insert data into the database.
- `queries.sql`: This file contains SQL queries to retrieve data from the database for analysis.

Additionally, there are Python scripts to facilitate the creation of the database, data insertion, and data querying.

## Installation

To set up the project environment and run the scripts, follow these steps:

## Prerequisites

- SQLite3
- Python 3 (if you plan to interact with the database using Python)

SQLite comes pre-installed on many operating systems, or you can download it from the [SQLite Download Page](https://www.sqlite.org/download.html).


### Setup

1. Clone the repository to your local machine:

```bash
git clone https://github.com/makoohara/health_and_fitness_db 
cd /path/to/fitness-tracker-db
```
2. Use the sqlite3 locally in your computer. Make sure it is accessible in bin through the command sqlite3:


### Running the files 

```
sqlite3 main.db < init.sql
sqlite3 main.db < insert_data.sql
sqlite3 main.db < queries.sql
```