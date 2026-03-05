CREATE VIEW view_customer_cohort_month AS
SELECT
	customer_key,
	TO_CHAR(first_purchase, 'YYYY-MM') as cohort_month
FROM
	customer_first_purchase;