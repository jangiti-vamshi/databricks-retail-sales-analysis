SELECT
    DATE_FORMAT(Sale_Date, 'yyyy-MM') AS sales_month,
    ROUND(SUM(Sales_Amount), 2) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data
GROUP BY DATE_FORMAT(Sale_Date, 'yyyy-MM')
ORDER BY sales_month;
