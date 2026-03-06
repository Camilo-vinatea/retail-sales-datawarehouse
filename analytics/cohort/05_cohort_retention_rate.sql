CREATE OR REPLACE VIEW cohort_retention_rate AS
WITH auxiliar AS(
	SELECT cohort_month, active_customers
	FROM cohort_retention
	WHERE cohort_index = 0
)
SELECT
	c.cohort_month,
	c.cohort_index,
	c.active_customers,
	ROUND((c.active_customers::NUMERIC/a.active_customers::NUMERIC),2) AS retention_rate
FROM auxiliar AS a
JOIN cohort_retention AS c
ON c.cohort_month = a.cohort_month;