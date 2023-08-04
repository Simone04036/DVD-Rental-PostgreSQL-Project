SELECT c.customer_id, c.first_name, c.last_name, sub.film_title
FROM customer c
JOIN (
  SELECT r.customer_id, f.title AS film_title
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film f ON i.film_id = f.film_id
  WHERE f.title LIKE 'Airplane%'
) AS sub ON c.customer_id = sub.customer_id