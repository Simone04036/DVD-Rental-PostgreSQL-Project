--select all 1000 film and their category
SELECT film_category.film_id, film.title, category.name, category.category_id 
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id