-- 📋 Netflix Data Validation Script --

USE netflix_db;

-- 1. Check Total Number of Records
SELECT COUNT(*) AS total_records
FROM netflix;

-- 2. Check Breakdown of Movies vs TV Shows
SELECT type, COUNT(*) AS total_count
FROM netflix
GROUP BY type;

-- 3. Check for NULLs in Critical Fields
SELECT COUNT(*) AS null_type_count FROM netflix WHERE type IS NULL;
SELECT COUNT(*) AS null_title_count FROM netflix WHERE title IS NULL;
SELECT COUNT(*) AS null_showid_count FROM netflix WHERE show_id IS NULL OR show_id = '';

-- 4. Check Distinct Values for Categorical Fields
SELECT DISTINCT type FROM netflix;
SELECT DISTINCT rating FROM netflix;

-- Validation Step: Identify wrong 'min' entries in rating column
SELECT show_id, title, rating, duration
FROM netflix
WHERE rating LIKE '%min%';

-- Cleaning Step: Move wrong 'min' entries from rating to duration
UPDATE netflix
SET
	duration = rating, -- Copy the wrong rating value to correct duration field
    rating = NULL -- set rating as Null after moving
WHERE rating LIKE '%min%';

-- Validation Step After Cleaning: Confirm no more 'min' entries exist in rating
SELECT DISTINCT rating
FROM netflix
ORDER BY rating;

-- 5. Data Distribution Check for Ratings
SELECT rating, COUNT(*) AS total_count
FROM netflix
GROUP BY rating
ORDER BY total_count DESC;

-- 6. Range Check for Release Year
SELECT MIN(release_year) AS earliest_year, MAX(release_year) AS latest_year
FROM netflix;

-- 7. Pattern Check for Show ID (non-null, non-empty)
SELECT COUNT(*) AS invalid_show_ids
FROM netflix
WHERE show_id IS NULL OR show_id = '';

-- 8. Sample Record Check
SELECT * 
FROM netflix
LIMIT 5;
