CREATE TABLE ecommerce_ukretailer (

invoice_no	VARCHAR(20),
stock_code VARCHAR(20),
description TEXT,
quantity INT,
invoice_date TIMESTAMP,
unit_price NUMERIC(10,2),
customer_id VARCHAR(20),
country VARCHAR(20)
);
SELECT * FROM ecommerce_ukretailer

CREATE TABLE rcustomers (
customer_id	VARCHAR(20),
customer_name VARCHAR(20),	
country  VARCHAR(20)
);
SELECT * FROM rcustomers



--Total Number of Orders
SELECT COUNT(DISTINCT invoice_no) AS total_orders
FROM ecommerce_ukretailer;


-- List all records for customers in the United Kingdom, sorted by invoice_date
SELECT invoice_no, customer_id, invoice_date, country
FROM ecommerce_ukretailer
WHERE country = 'United Kingdom'
ORDER BY invoice_date DESC;


--Count the number of orders by country and order the results by the order count
SELECT country, COUNT(invoice_no) AS total_orders
FROM ecommerce_ukretailer
GROUP BY country
ORDER BY total_orders DESC;


--WAQ for Daily Sales Insights
SELECT DATE(invoice_date) AS date, 
       COUNT(DISTINCT invoice_no) AS total_orders,
       SUM(quantity * unit_price) AS total_revenue
FROM ecommerce_ukretailer
GROUP BY DATE(invoice_date)
ORDER BY date;


--WAQ for Revenue by Country
SELECT country,
       SUM(quantity * unit_price) AS revenue
FROM ecommerce_ukretailer
GROUP BY country
ORDER BY revenue DESC;


--INNER JOIN: Transactions with matched customers
SELECT 
    e.*,
    r.customer_name,
    r.country
FROM 
    ecommerce_ukretailer e
INNER JOIN 
    rcustomers r ON e.customer_id = r.customer_id;


	--LEFT JOIN:
SELECT 
    e.*,
    r.customer_name,
    r.country
FROM 
    ecommerce_ukretailer e
LEFT JOIN 
    rcustomers r ON e.customer_id = r.customer_id;


--RIGHT JOIN:	
SELECT 
    e.*,
    r.customer_name,
    r.country
FROM 
    ecommerce_ukretailer e
RIGHT JOIN 
    rcustomers r ON e.customer_id = r.customer_id;	

	
--	FULL OUTER JOIN: All records from both tables
SELECT 
    e.*,
    r.customer_name,
    r.country
FROM 
    ecommerce_ukretailer e
FULL OUTER JOIN 
    rcustomers r ON e.customer_id = r.customer_id;


--JOIN with Aggregation: Total spending per customer
SELECT 
    r.customer_name,
    r.country,
    SUM(e.quantity * e.unit_price) AS total_spent
FROM 
    ecommerce_ukretailer e
JOIN 
    rcustomers r ON e.customer_id = r.customer_id
GROUP BY 
    r.customer_name, r.country
ORDER BY 
    total_spent DESC;

	

--WAQ for the Top 10 Products by Revenue
SELECT description, 
       SUM(quantity * unit_price) AS total_sales
FROM ecommerce_ukretailer
GROUP BY Description
ORDER BY total_sales DESC
LIMIT 10;


--WAQ for the Least Selling Products
SELECT description, 
       SUM(quantity) AS total_quantity
FROM ecommerce_ukretailer
GROUP BY description
ORDER BY total_quantity ASC
LIMIT 10;


--WAQ for the Most Frequently Sold Items
SELECT description, 
       COUNT(*) AS frequency
FROM ecommerce_ukretailer
GROUP BY description
ORDER BY frequency DESC
LIMIT 10;


--WAQ for the Number of Returned Items
SELECT COUNT(*) AS returned_items
FROM ecommerce_ukretailer
WHERE quantity < 0;


--Write a SubQuery for the Average Basket Value (Per Order)
SELECT AVG(order_value) AS avg_basket_value
FROM (
  SELECT invoice_no, 
         SUM(quantity * unit_price) AS order_value
  FROM ecommerce_ukretailer
  GROUP BY invoice_no
) AS subquery;


--WAQ for the Monthly Revenue
SELECT DATE_TRUNC('month', invoice_date) AS month,
       SUM(quantity * unit_price) AS total_revenue
FROM ecommerce_ukretailer
GROUP BY month
ORDER BY month;


--WAQ for the Fill NULLs in Description
SELECT COALESCE(description, 'No Description') AS clean_description
FROM ecommerce_ukretailer;


--Search Products Containing “gift”
SELECT *FROM ecommerce_ukretailer
WHERE description ILIKE '%gift%';


--WAQ for the Retrieve products whose description includes the word “Laptop”
SELECT invoice_no, stock_code, description
FROM ecommerce_ukretailer
WHERE description LIKE '%Laptop%';


--WAQ for the Create a View of Daily Sales Summary
CREATE VIEW daily_sales_summary AS
SELECT DATE(invoice_date) AS date,
       COUNT(DISTINCT invoice_no) AS total_orders,
       SUM(quantity * unit_price) AS total_sales
FROM ecommerce_ukretailer
GROUP BY DATE(invoice_date);


--WAQ for the Create Index for Performance
CREATE INDEX idx_invoice_date ON ecommerce_ukretailer(invoice_date);
CREATE INDEX idx_customer_id ON ecommerce_ukretailer(customer_id);

--NAME- Pritish Samajpati
--DATE- April/2025
