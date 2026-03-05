# Retail ELT Star Schema -- PostgreSQL

End-to-end Data Warehouse project built in PostgreSQL using an ELT
approach. The pipeline ingests raw retail sales data, transforms it into
a staging layer, and models it into a dimensional star schema optimized
for analytical queries.

This project demonstrates core Data Engineering concepts including raw
data ingestion, staging transformations, dimensional modeling, and fact
table construction for business analytics.

# Architecture

The pipeline follows a typical layered data architecture:

RAW → STAGING → STAR SCHEMA

-   RAW: original dataset loaded directly into PostgreSQL
-   STAGING: cleaned and transformed data
-   STAR SCHEMA: dimensional model for analytics

# Dataset

The project uses the Online Retail dataset, which contains transactional
sales data from an e-commerce store.

Fields include:

-   Invoice
-   StockCode
-   Description
-   Quantity
-   InvoiceDate
-   UnitPrice
-   CustomerID
-   Country

Each row represents a product line within a sales invoice.

---
# Repository Structure
```text
Retail-sales-datawarehouse/
├── analytics/                  # Advanced queries and business logic
│   ├── cohort.sql              # User retention analysis (Cohorts)
│   ├── revenue_by_country.sql  # Revenue report by geographical location
│   ├── rfm_segmentation.sql    # Customer segmentation (Recency, Frequency, Monetary)
│   └── top_products.sql        # Identification of top-selling products
├── data/                       # Data file storage
│   ├── processed/              # Clean data ready for analysis
│   └── raw/                    # Original, unmodified data
├── performance/                # Database optimization
│   └── indexes.sql             # Index creation to improve query speed
├── sql/                        # Main database scripts
│   ├── database/               # Initial setup
│   │   ├── 01_create_database.sql
│   │   └── 02_raw_retail_data.sql
│   ├── etl/                    # Extraction, Transformation, and Loading process
│   │   ├── 04_extract.sql
│   │   ├── 05_transform.sql
│   │   ├── 06_load_dimensions.sql
│   │   └── 07_load_facts.sql
│   └── schema/                 # Data model definition
│       └── 03_star_schema.sql  # Definition of fact and dimension tables
├── utils/                      # Support tools
│   └── transform_raw.py        # Python script for data pre-processing
├── .gitignore                  # Files excluded from version control
└── README.md                   # Main project documentation
```
# Data Warehouse Model

The dimensional model follows a star schema centered around sales
transactions.

Fact Table:

        fact_sales
        invoice
        product_key
        customer_key
        date_key
        quantity
        unit_price
        revenue

Dimension Tables

    dim_customer:
       customer_key
        customer_id

    dim_product:
        product_key
        stockcode
        description

    dim_country:
        country_key
        country_name

    dim_date:
        date_key
        full_date
        year
        month
        day

This structure enables efficient analytical queries and BI workloads.

# Technologies

-   PostgreSQL
-   SQL
-   Dimensional Modeling
-   ELT Pipelines
-   Data Warehousing

# Key Concepts Demonstrated

-   Data ingestion from raw files
-   Staging layer transformations
-   Dimensional modeling (Star Schema)
-   Surrogate keys and fact tables
-   Analytical query optimization

# Author

Camilo Vinatea