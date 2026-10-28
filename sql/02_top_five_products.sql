SELECT
    Product_ID,
    ROUND(SUM(Sales_Amount), 2) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data
GROUP BY Product_ID
ORDER BY total_revenue DESC
LIMIT 5;
