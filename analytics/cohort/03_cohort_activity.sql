CREATE OR REPLACE VIEW cohort_activity AS
WITH purchases AS (
	SELECT 
		f.customer_key,
		d.full_date
	FROM
		fact_sales AS f
	LEFT JOIN
		dim_date AS d
	ON f.date_key = d.date_key
),
customer_purchases AS (
	SELECT
		p.customer_key,
		v.cohort_month,
		p.full_date AS purchase_month
	FROM
		purchases AS p
	LEFT JOIN
		view_customer_cohort_month AS v
	ON
		p.customer_key = v.customer_key
)
SELECT
	customer_key,
	to_date(cohort_month, 'YYYY-MM'),
	purchase_month,
	resta_meses(to_date(cohort_month, 'YYYY-MM'), purchase_month) AS cohort_index
	
FROM
	customer_purchases;