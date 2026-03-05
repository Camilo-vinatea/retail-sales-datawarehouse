INSERT INTO dim_customer (customer_id)
SELECT DISTINCT
    customerid
FROM bronze_online_retail;

INSERT INTO dim_product (stockcode, description)
SELECT stockcode, MIN(description)
FROM bronze_online_retail
GROUP BY stockcode;

INSERT INTO dim_date (full_date, year, month, day)
SELECT DISTINCT
    DATE(invoicedate) AS full_date,
    EXTRACT(YEAR FROM invoicedate),
    EXTRACT(MONTH FROM invoicedate),
    EXTRACT(DAY FROM invoicedate)
FROM bronze_online_retail;

INSERT INTO dim_country (country_name)
SELECT DISTINCT
    country
FROM bronze_online_retail;