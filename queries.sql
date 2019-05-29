-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.title AS awful_movie_title, movies.rating AS movie_rating
FROM movies
ORDER BY movie_rating ASC LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT movies.title AS movie_without_rating_title
FROM movies
WHERE movies.rating IS NULL
ORDER BY movie_without_rating_title ASC;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT movies.title AS thrilling_movie_title
FROM movies
WHERE movies.synopsis LIKE '%thrilling%'
ORDER BY thrilling_movie_title ASC;

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT movies.title AS sci_fi_fantasy_title, movies.year AS release_year,
movies.rating as rating
FROM movies
JOIN genres ON movies.genre_id = genres.id
WHERE genres.name = 'Science Fiction & Fantasy'
AND movies.year > 1979 AND movies.year < 1990 AND rating IS NOT NULL
ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name AS agent_007, movies.title AS movie_title,
movies.year AS release_year
FROM movies
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON cast_members.actor_id = actors.id
WHERE cast_members.character = 'James Bond'
ORDER BY release_year ASC;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title AS movie_with_j_m, movies.year AS release_year,
genres.name AS genre
FROM movies
JOIN genres ON movies.genre_id = genres.id
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON cast_members.actor_id = actors.id
WHERE actors.name = 'Julianne Moore'
ORDER BY genre, movie_with_j_m;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title AS horror_title, movies.year AS release_year,
studios.name AS studio
FROM movies
JOIN genres ON movies.genre_id = genres.id
LEFT JOIN studios ON movies.studio_id = studios.id
WHERE genres.name = 'Horror'
ORDER BY release_year ASC LIMIT 5;
