--Find all possible combinations of film and store
SELECT f.title, s.store_id
FROM film AS f
CROSS JOIN store AS s