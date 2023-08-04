--film never be rental with actor_name
SELECT f.film_id, f.title, STRING_AGG(CONCAT(a.first_name, ' ', a.last_name), ', ') as actor_names
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id NOT IN (
    SELECT f.film_id
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
)
GROUP BY f.film_id, f.title
ORDER BY f.film_id, f.title, actor_names