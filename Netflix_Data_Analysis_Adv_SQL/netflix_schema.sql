# Netflix Schema
CREATE DATABASE netflix_db;

USE netflix_db;

CREATE TABLE netflix (
	show_id VARCHAR(10),	
	type VARCHAR(10),
	title VARCHAR(110),
	director VARCHAR(210),
	cast TEXT,
	country	VARCHAR(130),
	date_added VARCHAR(50),
	release_year INT,
	rating	VARCHAR(10),
    duration VARCHAR(15),	
	listed_in VARCHAR(150),
	descrip VARCHAR(250)
);

SHOW TABLES;

DESCRIBE TABLE netflix;

DESCRIBE netflix;