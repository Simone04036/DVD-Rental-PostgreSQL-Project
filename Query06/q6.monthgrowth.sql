WITH monthly_revenue AS (
  SELECT DATE_TRUNC('month', rental_date) as month,
         SUM(amount) as revenue
  FROM rental r
  JOIN payment p ON r.rental_id = p.rental_id
  GROUP BY month)
SELECT month,
       revenue,
       ((revenue - LAG(revenue) OVER (ORDER BY month))/LAG(revenue) OVER (ORDER BY month)) * 100 as growth_rate
FROM monthly_revenue