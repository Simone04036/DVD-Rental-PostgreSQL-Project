SELECT f.film_id, 
       f.title, 
       COUNT(r.rental_id) AS rental_count,
       CASE 
         WHEN COUNT(r.rental_id) <= 10 THEN 'Less popular'
         WHEN COUNT(r.rental_id) > 10 AND COUNT(r.rental_id) <= 20 THEN 'Popular'
         ELSE 'Very popular'
       END AS popularity
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count ASC