CREATE OR REPLACE VIEW "02_revenue_by_country" AS 
	SELECT
		dc.country_name,
		SUM(f.revenue) AS total_revenue,
		COUNT (DISTINCT f.customer_key)
	FROM fact_sales AS f
	JOIN dim_country AS dc
	ON f.country_key = dc.country_key
	GROUP BY 
		dc.country_key,
		dc.country_name
	ORDER BY total_revenue DESC;