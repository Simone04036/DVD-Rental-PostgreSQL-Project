--next rental after each rental 
SELECT customer_id,
       rental_date,
       LEAD(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) as next_rental_date
FROM rental;