CREATE VIEW cohort_retention AS
SELECT
	to_date AS cohort_month,
	cohort_index,
	COUNT (DISTINCT customer_key) AS active_customers

FROM 
	cohort_activity
GROUP BY to_date, cohort_index;