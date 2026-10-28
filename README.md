# databricks-retail-sales-analysis
Retail sales analytics using Databricks Unity Catalog, SQL, Genie, and AI/BI Dashboards.


## Project Overview

This project analyzes retail sales data using Databricks Unity Catalog, Databricks SQL, Genie, and AI/BI Dashboards. The goal is to transform sales records into useful business insights.

## Tools and Technologies

- Databricks
- Unity Catalog
- Databricks SQL
- Databricks Genie
- AI/BI Dashboards
- GitHub

## Dataset

**Table:** `Innomatics.default.sales_data`

- Total records: 1,000
- Distinct products: 100
- Total recorded revenue: 5,019,265.23
- Total quantity sold: 25,355

## SQL Analysis

The project contains five SQL analyses:

1. Overall sales performance
2. Top five products by revenue
3. Regional sales performance
4. Monthly sales trend
5. Revenue contribution by product category

## Key Findings

- Product 1099 generated the highest revenue among the products analyzed, at 101,773.87.
- The North region recorded the highest regional revenue, at 1,369,612.51.
- January 2023 had the highest monthly revenue in the results, at 476,092.36.
- Clothing contributed the largest share of category revenue, at 26.17%.

## Databricks Genie

Genie was used to ask natural-language questions about product performance, regional results, and monthly sales trends. Product and regional findings were compared with manually written SQL results.

## Dashboard

The AI/BI dashboard includes total revenue, total quantity sold, unique products, regional revenue, top products, monthly trends, and category revenue contribution.

## Repository Structure

- `sql/` — SQL queries used in the analysis
- `screenshots/` — Actual screenshots of the Databricks implementation
- `article.md` — Technical article describing the project

## Important Note

The SQL queries and findings in this repository are based on the Databricks project results. Screenshots should be added to document the actual implementation.
