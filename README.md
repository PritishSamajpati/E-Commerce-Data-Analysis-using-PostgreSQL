# 🛒 E-Commerce Data Analysis using PostgreSQL

This project focuses on cleaning, importing, and analyzing an E-Commerce dataset using PostgreSQL. The dataset contains transaction records for an online UK retailer, and the goal is to extract insights through SQL queries.

---



## 📁 Files Included

| File Name                    | Description                                               |
|-----------------------------|-----------------------------------------------------------|
| `ecommerce_data.csv`        | Raw ecommerce dataset                                     |
| `ecommerce_data_cleaned.csv`| Cleaned dataset ready for PostgreSQL import               |
| `rcustomers.csv`            | Optional: Customer metadata file                          |
| `E_Commerce UKretailerSQL.sql` | SQL script with queries for analysis and reporting     |
| `README.md`                 | Project documentation                                     |

---

## 🚀 Objectives

- Clean and prepare raw ecommerce data
- Import cleaned data into PostgreSQL
- Perform exploratory and advanced analysis
- Create views and indexes for performance
- Use SQL features like:
  - `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
  - `JOIN` operations (`INNER`, `LEFT`, `RIGHT`)
  - Subqueries and aggregate functions (`SUM`, `AVG`)
  - Views and indexes
  - `LIKE` and `NULL` handling
  - Time-based and customer segmentation analysis

---

## 🗃️ Dataset Description

| Column Name   | Description                                |
|---------------|--------------------------------------------|
| InvoiceNo     | Invoice number (unique transaction ID)     |
| StockCode     | Unique product code                        |
| Description   | Product description                        |
| Quantity      | Quantity purchased                         |
| InvoiceDate   | Timestamp of purchase                      |
| UnitPrice     | Price per item                             |
| CustomerID    | Unique identifier for customer             |
| Country       | Country of the customer                    |

---

##Data Cleaning Using Excel--
1. *Missing values*:  
   - Description and CustomerID have missing entries.

2. *Date formatting*:  
   - InvoiceDate should be converted to proper datetime format.

3. *CustomerID type*:  
   - Should be converted to INTEGER if values are truly integers.

4. *Text cleanup*:  
   - Strip whitespace and possibly remove/control special characters.

5. *Duplicates*:  
   - Check for and remove exact duplicate rows.


📊 Sample Queries

.Top 10 Products by Revenue
.Daily Sales and Trends
.Monthly Cumulative Sales
.Customer Lifetime Value
.Cancelled Orders / Returns
.Top Revenue by Country
.Most Active Buying Hours
.Pattern search with ILIKE '%gift%'
.Handling NULL with COALESCE, CASE

##📦 Technologies Used

PostgreSQL
SQL (Advanced)
Excel (for preprocessing)

🚀 Key Highlights

.Real-world UK e-commerce dataset
.Cleaned and optimized for PostgreSQL
.Advanced SQL queries for analysis
.Covers JOINs, aggregates, views, indexes, NULL handling
.Includes customer & order segmentation, returns, and time-series metrics
.Ready-to-import datasets (.csv) and query scripts (.sql)


BY- Pritish Samajpati
Date- April 2025
