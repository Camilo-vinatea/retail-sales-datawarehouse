CREATE TABLE bronze_online_retail AS
SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    Quantity * UnitPrice AS TotalPrice
FROM raw_online_retail;
WHERE Quantity > 0
AND InvoiceNo IS NOT NULL
AND CustomerID IS NOT NULL;
