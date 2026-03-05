-- =========================
-- DIMENSION: DATE
-- =========================

CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    full_date DATE UNIQUE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL
);

-- =========================
-- DIMENSION: CUSTOMER
-- =========================

CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id VARCHAR(255) UNIQUE NOT NULL,
);

-- =========================
-- DIMENSION: PRODUCT
-- =========================

CREATE TABLE dim_product (
    product_key SERIAL PRIMARY KEY,
    stockcode VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255)
);

-- =========================
-- DIMENSION: COUNTRY
-- =========================

CREATE TABLE dim_country(
    country_key SERIAL PRIMARY KEY,
    country_name VARCHAR(255) UNIQUE NOT NULL
);

-- =========================
-- FACT TABLE: SALES
-- =========================

CREATE TABLE fact_sales (
    sales_key SERIAL PRIMARY KEY,
    invoice VARCHAR(255) NOT NULL,
    product_key INT NOT NULL,
    customer_key INT NOT NULL,
    date_key INT NOT NULL,
    country_key INT NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    revenue NUMERIC(12,2) NOT NULL
);

-- =========================
-- FOREIGN KEYS
-- =========================

ALTER TABLE fact_sales
ADD CONSTRAINT fk_product
FOREIGN KEY (product_key)
REFERENCES dim_product(product_key);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_key)
REFERENCES dim_customer(customer_key);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_date
FOREIGN KEY (date_key)
REFERENCES dim_date(date_key);

ALTER TABLE fact_sales
ADD CONSTRAINT fk_country
FOREIGN KEY (country_key)
REFERENCES dim_country(country_key);