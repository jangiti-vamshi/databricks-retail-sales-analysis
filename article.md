# Databricks in Action: From Unity Catalog to Business Insights with SQL, Genie & AI/BI Dashboards

## Introduction

How can raw retail sales data be transformed into meaningful business insights?

As part of the Innomatics Data Engineering Foundations & Databricks hands-on challenge, I worked on a retail sales analytics project using Databricks. The project involved organizing data with Unity Catalog, analyzing sales using SQL, exploring business questions with Databricks Genie, and presenting insights through AI/BI Dashboards.

The main objective was to understand how data organization, SQL analytics, AI-assisted exploration, and visualization work together to support business decisions.

## 1. Data Organization with Unity Catalog

I used the following Databricks table for my analysis:

`Innomatics.default.sales_data`

The dataset contains 1,000 records and 13 columns, including Product_ID, Sale_Date, Sales_Rep, Region, Sales_Amount, Quantity_Sold, Product_Category, Unit_Cost, Unit_Price, Customer_Type, Discount, Payment_Method, and Sales_Channel.

Unity Catalog provides a structured way to organize and manage data:

- **Catalog:** `Innomatics`
- **Schema:** `default`
- **Table:** `sales_data`

This hierarchy makes data easier to organize, discover, and reference in SQL queries.

**Screenshot to add:** Unity Catalog showing the catalog, schema, and sales table.

## 2. Retail Sales Analysis Using Databricks SQL

I wrote five SQL queries to answer important business questions about sales performance, products, regions, monthly trends, and product categories.

### Analysis 1: Overall Sales Performance

The first query calculates total revenue, total quantity sold, total records, and the number of distinct products.

```sql
SELECT
    SUM(Sales_Amount) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold,
    COUNT(*) AS total_records,
    COUNT(DISTINCT Product_ID) AS unique_products
FROM Innomatics.default.sales_data;
```

**Results**

- Total recorded revenue: 5,019,265.23
- Total quantity sold: 25,355
- Total records: 1,000
- Distinct products: 100

**Business insight:** These figures establish a baseline for understanding the dataset's overall sales performance and product coverage.

### Analysis 2: Top Five Products by Revenue

The second query identifies the five products generating the highest total revenue.

```sql
SELECT
    Product_ID,
    ROUND(SUM(Sales_Amount), 2) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data
GROUP BY Product_ID
ORDER BY total_revenue DESC
LIMIT 5;
```

**Results**

1. Product 1099 — Revenue: 101,773.87 | Quantity: 502
2. Product 1092 — Revenue: 90,615.62 | Quantity: 548
3. Product 1033 — Revenue: 89,130.41 | Quantity: 404
4. Product 1090 — Revenue: 88,043.25 | Quantity: 590
5. Product 1086 — Revenue: 82,269.71 | Quantity: 357

**Business insight:** Product 1099 generated the highest revenue among the products analyzed. Product 1090 had the highest quantity sold within the top five, showing that sales volume and revenue do not always rank products in the same order.

### Analysis 3: Regional Sales Performance

This query compares total revenue and quantity sold across regions.

```sql
SELECT
    Region,
    ROUND(SUM(Sales_Amount), 2) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data
GROUP BY Region
ORDER BY total_revenue DESC;
```

**Results**

- **North:** Revenue 1,369,612.51 | Quantity 6,705
- **East:** Revenue 1,259,792.93 | Quantity 6,356
- **West:** Revenue 1,235,608.93 | Quantity 6,486
- **South:** Revenue 1,154,250.86 | Quantity 5,808

**Business insight:** North recorded the highest revenue and quantity sold. West sold more units than East but generated less revenue, demonstrating why it is useful to compare multiple performance metrics.

### Analysis 4: Monthly Sales Trend

This query groups sales by month and sorts the results chronologically.

```sql
SELECT
    DATE_FORMAT(Sale_Date, 'yyyy-MM') AS sales_month,
    ROUND(SUM(Sales_Amount), 2) AS total_revenue,
    SUM(Quantity_Sold) AS total_quantity_sold
FROM Innomatics.default.sales_data
GROUP BY DATE_FORMAT(Sale_Date, 'yyyy-MM')
ORDER BY sales_month;
```

**Key observations**

- January 2023 recorded the highest monthly revenue in the results: 476,092.36, with 2,472 units sold.
- November 2023 also performed strongly, generating 467,482.90 in revenue.
- February 2023 recorded the lowest revenue among the complete months of 2023 shown: 368,919.36.
- January 2024 recorded 19,328.01 in revenue and 77 units sold.

**Business insight:** Monthly analysis helps identify stronger and weaker periods. However, the January 2024 result is unusually low, so the date coverage should be checked to determine whether it represents a partial month before drawing conclusions about a sales decline.

### Analysis 5: Revenue Contribution by Product Category

The final query calculates each product category's revenue and percentage contribution to overall revenue.

```sql
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
```

**Results**

- **Clothing:** Revenue 1,313,474.36 | Contribution 26.17%
- **Furniture:** Revenue 1,260,517.69 | Contribution 25.11%
- **Electronics:** Revenue 1,243,499.64 | Contribution 24.77%
- **Food:** Revenue 1,201,773.54 | Contribution 23.94%

**Business insight:** Clothing contributed the largest share of revenue at 26.17%, followed by Furniture and Electronics. Revenue was distributed relatively evenly across the four categories.

## 3. Exploring Business Questions with Databricks Genie

Databricks Genie allows users to explore data by asking questions in natural language rather than writing every SQL query manually.

I explored three questions:

1. Which five products generated the highest revenue?
2. Which region generated the highest revenue, and how did revenue and quantity sold compare across regions?
3. What were the monthly sales revenue and quantity trends?

I validated the product and regional results by comparing Genie responses with manually written SQL queries. The product IDs, revenue figures, quantities, and regional totals matched the SQL results.

The monthly observations were also consistent with the SQL output for the periods discussed, including January 2023's strong revenue and January 2024's unusually low figures.

**Key learning:** AI-assisted analytics can make data exploration more accessible, but results should be checked against SQL and the underlying data before they are used to support business decisions.

**Screenshots to add:** Genie questions and responses, along with the matching SQL results used for validation.

## 4. Building an AI/BI Dashboard

I created a Retail Sales Performance Dashboard using Databricks AI/BI Dashboards to bring key sales metrics and visualizations into one place.

The dashboard includes three KPI cards:

- Total Revenue
- Total Quantity Sold
- Unique Products

It also contains four visualizations:

- Revenue by Region
- Top Five Products by Revenue
- Monthly Sales Trend
- Revenue Contribution by Product Category

Two filters were included:

- Region
- Product Category

The dashboard provides a visual overview of sales performance and helps users explore product, category, and regional patterns.

**Screenshot to add:** The actual completed AI/BI dashboard. Confirm that both filters work before describing them as tested.

## 5. Key Learnings

This hands-on project helped me develop practical experience with:

- Organizing and referencing data through Unity Catalog.
- Writing SQL queries using aggregation, grouping, sorting, and window functions.
- Translating business questions into analytical queries.
- Comparing AI-generated answers with manually written SQL.
- Interpreting regional, product-level, and monthly sales patterns.
- Presenting analytical results using KPI cards and charts.

One of my biggest takeaways is that data analytics involves more than calculating numbers. It requires validating results, interpreting trends carefully, and communicating findings in a clear and useful way.

## Conclusion

This project gave me practical exposure to Databricks, Unity Catalog, SQL analytics, Genie, and AI/BI Dashboards.

By combining structured queries, natural-language exploration, and visual reporting, I transformed a retail sales dataset into meaningful performance summaries and business observations.

I look forward to continuing to build my skills in data engineering and analytics through more hands-on projects.

Thank you to Innomatics Research Labs for this learning opportunity.

#DataEngineering #DataAnalytics #Databricks #LearningInPublic #InnomaticsResearchLabs
