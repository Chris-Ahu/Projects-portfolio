-- confirm dataset
SELECT *
FROM movies;

-- How many records are in the table?
SELECT COUNT(*) AS count_records
FROM movies;

-- Are there equal number of records with a budget, gross and movie name in the table? 
SELECT COUNT(budget) AS count_budget, 
COUNT(gross) AS count_gross
FROM movies;

--How many missing values are in the budget field?
SELECT COUNT(*)
FROM movies
WHERE budget IS NULL;

--How many missing values are in the gross field?
SELECT COUNT(*)
FROM movies
WHERE gross IS NULL;
 
 --Remove any missing values from applicable fields (OPTION 1)?
DELETE FROM movies
WHERE name IS NULL OR budget IS NULL OR gross IS NULL OR year IS NULL 
OR genre IS NULL OR votes IS NULL OR runtime IS NULL;

--Remove any missing values from applicable fields (OPTION 2)?
SELECT name, genre, year, budget, gross, votes, runtime
FROM movies
WHERE name IS NOT NULL AND genre IS NOT NULL AND year IS NOT NULL AND
 budget IS NOT NULL AND gross IS NOT NULL AND votes IS NOT NULL AND runtime IS NOT NULL
 ORDER BY budget DESC;
 
 ---Create a virtual table with OPTION 2
 CREATE VIEW cleaned_movies AS 
 SELECT name, genre, year, budget, gross, votes, runtime
FROM movies
WHERE name IS NOT NULL AND genre IS NOT NULL AND year IS NOT NULL AND
 budget IS NOT NULL AND gross IS NOT NULL AND votes IS NOT NULL AND runtime IS NOT NULL
 ORDER BY budget DESC;
 
 ---Query the VIEW
 SELECT *
 FROM cleaned_movies;

 ---How many movies where produced on or before year 2000?
 SELECT COUNT(name) AS count_movies
 FROM cleaned_movies
 WHERE year <= 2000;

  ---How many Action movies where produced on or before year 2000?
 SELECT COUNT(genre) AS count_genre, genre
 FROM cleaned_movies
 WHERE year <= 2000 AND genre = 'Action';
 
---How many movie genre where produced on or before the year 2000?
 SELECT COUNT(genre) AS count_genre, genre
 FROM cleaned_movies
 WHERE year <= 2000
 GROUP BY genre;
 
 ---How many movie genre where produced after the year 2000?
 SELECT COUNT(genre) AS count_genre, genre
 FROM cleaned_movies
 WHERE year > 2000
 GROUP BY genre;
 
 ---How many movies produced after the year 2000 have a runtime less than 2hrs?
 SELECT COUNT(name) AS count_name
 FROM cleaned_movies
 WHERE year > 2000 AND runtime < 120;
 
 ---What movie name(s) released between 1980 and 2015 had a maximum budget USD100m?
 SELECT name, year, budget
 FROM cleaned_movies
 WHERE year BETWEEN 1980 AND 2015 AND budget >= 50000000
 ORDER BY budget;

 ---What are the top 5 least expensive movies in the table?
 SELECT name, budget
 FROM cleaned_movies
 ORDER BY  budget
 LIMIT 5;
 
 ---Delete cleaned_movies
 DROP VIEW cleaned_movies

