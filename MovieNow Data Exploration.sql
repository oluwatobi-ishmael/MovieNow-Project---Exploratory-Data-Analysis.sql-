MOVIENOW RENTAL SQL QUERY 

/* Revenue */ 

  

/* Total revenue */ 

  

SELECT SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id; 

  

/* Total revenue by country */ 

  

SELECT c.country, SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id 

JOIN customers c 

ON r.customer_id = c.customer_id 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* Total revenue by genre*/ 

  

SELECT m.genre, SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* Total revenue by movie title*/ 

  

SELECT m.title, SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* Total revenue by year*/ 

  

SELECT EXTRACT(YEAR FROM r.date_renting), SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id 

GROUP BY 1 

ORDER BY 1 ASC; 

  

/* Total revenue by month*/ 

 

SELECT TO_CHAR( 

    TO_DATE (EXTRACT(MONTH FROM r.date_renting)::text, 'MM'), 'Month' 

    ) AS Month_Name, SUM(m.renting_price) AS Total_revenue 

FROM renting r 

JOIN movies m 

ON r.movie_id = m.movie_id 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* movies */ 

  

  

/* Total number of movies listed and total number of genre*/ 

  

SELECT COUNT(DISTINCT title) AS total_movies_listed, COUNT(DISTINCT genre) AS total_genre_listed 

FROM movies; 

  

/* total number of actors */ 

  

SELECT COUNT(DISTINCT name) AS total_movie_actor 

FROM actors; 

  

/* Total customer registered */ 

  

SELECT COUNT(DISTINCT name) AS number_of_customers 

FROM customers; 

  

/* Total number of movie times movie was rented */ 

  

SELECT COUNT(renting_id) AS num_of_rented_movies 

FROM renting; 

  

/* Total number of times movie was rented per year */ 

  

SELECT EXTRACT(YEAR FROM date_renting) AS year, COUNT(renting_id) AS num_of_rented_movies 

FROM renting 

GROUP BY 1; 

  

/* Total number of times movie was rented per Month */ 

  

SELECT TO_CHAR( 

    TO_DATE (EXTRACT(MONTH FROM date_renting)::text, 'MM'), 'Month' 

    ) AS Month_Name, COUNT(renting_id) AS num_of_rented_movies 

FROM renting 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* country breakdown */ 

  

/* Which country has the highest customer */ 

SELECT country, COUNT(DISTINCT name) num_of_customers 

FROM customers 

GROUP BY 1 

ORDER BY 2 DESC 

LIMIT 5; 

  

  

/* Which country has the highest actors */ 

SELECT nationality, COUNT(DISTINCT name) AS total_movie_actor 

FROM actors 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* Country with the highest number of rented movies*/ 

  

SELECT c.country, COUNT(r.renting_id) AS tot_movies_rented 

FROM customers c 

INNER JOIN renting r 

ON c.customer_id = r.customer_id 

GROUP BY 1 

ORDER BY 2 DESC; 

  

/* Average, Minimum, Maximum */ 

  

/* Avg, Min, Max renting price*/ 

  

SELECT ROUND(AVG(renting_price), 2), MIN(renting_price) AS minimum_price, MAX(renting_price) AS maximum_price 

FROM movies; 

  

/* Avg, Min, Max renting price by genre*/ 

  

SELECT genre, ROUND(AVG(renting_price), 2) AS average_price, MIN(renting_price) AS minimum_price,  

MAX(renting_price) AS maximum_price 

FROM movies 

GROUP BY genre; 

  

/* Avg, Min, Max rating*/ 

  

SELECT ROUND(AVG(rating), 2) AS Average_rating, MIN(rating) As Minimum_rating, MAX(rating) As Maximum_rating 

FROM renting; 

  

/* Avg, Min, Max rating by genre*/ 

  

SELECT m.genre, ROUND(AVG(r.rating), 2) AS Average_rating, MIN(r.rating) AS Minimum_rating, MAX(r.rating) AS Maximum_rating 

FROM movies m 

JOIN renting r 

ON m.movie_id = r.movie_id 

GROUP BY 1; 

  

/* Avg, Min, Max rating by movie title*/ 

  

SELECT m.title, ROUND(AVG(r.rating), 2) AS Average_rating, MIN(r.rating) AS Minimum_rating, MAX(r.rating) AS Maximum_rating 

FROM movies m 

JOIN renting r 

ON m.movie_id = r.movie_id 

WHERE r.rating IS NOT NULL 

GROUP BY 1; 

 
