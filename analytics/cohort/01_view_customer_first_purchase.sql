CREATE VIEW customer_first_purchase AS
SELECT
	f.customer_key,
	MIN(dda.full_date) AS first_purchase
FROM
	fact_sales AS f
JOIN
	dim_date AS dda
ON
	f.date_key = dda.date_key
GROUP BY f.customer_key;