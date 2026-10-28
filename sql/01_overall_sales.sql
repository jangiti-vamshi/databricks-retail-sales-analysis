SELECT
    SUM(Sales_Amount) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold,
    COUNT(*) AS total_records,
    COUNT(DISTINCT Product_ID) AS unique_products
FROM Innomatics.default.sales_data;
