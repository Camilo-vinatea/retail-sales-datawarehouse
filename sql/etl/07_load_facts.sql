INSERT INTO fact_sales (
    invoice, 
    product_key, 
    customer_key, 
    date_key,
    country_key,
    quantity, 
    unit_price, 
    revenue
)
SELECT 
    s.invoiceno,
    p.product_key,
    c.customer_key,
    d.date_key,
    ct.country_key,
    s.quantity,
    s.unitprice,
    s.totalprice
FROM staging_sales s
JOIN dim_product p ON s.stockcode = p.stockcode
JOIN dim_customer c ON s.customer_id = c.customer_id
JOIN dim_country ct ON s.country = ct.country_name
JOIN dim_date d ON DATE(s.invoicedate) = d.full_date;
