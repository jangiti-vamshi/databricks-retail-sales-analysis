SELECT
    Product_Category,
    ROUND(SUM(Sales_Amount), 2) AS category_revenue,
    ROUND(
        SUM(Sales_Amount) * 100.0
        / SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS revenue_contribution_pct
FROM Innomatics.default.sales_data
GROUP BY Product_Category
ORDER BY category_revenue DESC;
