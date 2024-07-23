-- Section: Performance Metrics

-- Calculate the average days late
-- This query calculates the average number of days invoices are paid late. It helps in understanding payment behavior.
SELECT AVG(days_late) AS average_days_late 
FROM late_payment_histories;

-- Calculate the total disputed amounts
-- This query sums the invoice amounts for all disputed invoices, giving the total amount in dispute. It's useful for assessing financial risk.
SELECT SUM(invoice_amount) AS total_disputed_amount 
FROM late_payment_histories 
WHERE disputed = TRUE;

-- Calculate the average days to settle
-- This query calculates the average number of days taken to settle invoices. It helps in evaluating the efficiency of the settlement process.
SELECT AVG(days_to_settle) AS average_days_to_settle 
FROM late_payment_histories;

-- Count of disputed invoices by country
-- This query counts the number of disputed invoices for each country. It provides insights into dispute frequencies by region, which can inform regional risk assessments.
SELECT country_code, COUNT(*) AS disputed_count 
FROM late_payment_histories 
WHERE disputed = TRUE 
GROUP BY country_code;


-- Section: Financial Analysis

-- Calculate the average invoice amount by country
-- This query calculates the average invoice amount for each country. It's useful for financial analysis and pricing strategies.
SELECT country_code, AVG(invoice_amount) AS average_invoice_amount 
FROM late_payment_histories 
GROUP BY country_code;

-- Identify the top 5 customers by total invoice amount
-- This query lists the top 5 customers based on their total invoice amounts. It's useful for identifying key customers.
SELECT customer_id, SUM(invoice_amount) AS total_invoice_amount 
FROM late_payment_histories 
GROUP BY customer_id 
ORDER BY total_invoice_amount DESC 
LIMIT 5;


-- Section: Payment Behavior

-- Calculate the number of invoices settled late by month
-- This query counts the number of invoices settled late for each month. It's useful for identifying trends in payment delays.
SELECT DATE_TRUNC('month', settled_date) AS month, COUNT(*) AS late_settled_count 
FROM late_payment_histories 
WHERE days_late > 0 
GROUP BY month 
ORDER BY month;

-- Calculate the percentage of disputed invoices by country
-- This query calculates the percentage of disputed invoices for each country. It helps in understanding how common disputes are in different regions.
SELECT country_code, 
       COUNT(*) AS total_invoices, 
       SUM(CASE WHEN disputed THEN 1 ELSE 0 END) AS disputed_invoices, 
       (SUM(CASE WHEN disputed THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS disputed_percentage
FROM late_payment_histories 
GROUP BY country_code 
ORDER BY disputed_percentage DESC;


-- Section: Customer Insights

-- List of customers with their country details (assuming a 'countries' table exists)
-- This query retrieves the list of customers along with their country details. It's useful for customer segmentation and regional analysis.
SELECT lph.customer_id, lph.invoice_number, c.country_name 
FROM late_payment_histories lph
JOIN countries c ON lph.country_code = c.country_code;

-- Customers with total invoice amount greater than the average
-- This query identifies customers whose total invoice amount is greater than the average. It's useful for finding high-value customers.
SELECT customer_id, total_invoice_amount 
FROM (
    SELECT customer_id, SUM(invoice_amount) AS total_invoice_amount 
    FROM late_payment_histories 
    GROUP BY customer_id
) sub
WHERE total_invoice_amount > (SELECT AVG(invoice_amount) FROM late_payment_histories);


-- Section: Set Operations

-- Set union of disputed and non-disputed invoices (select distinct customer_id)
-- This query combines the list of customers with disputed and non-disputed invoices, providing a complete customer list.
SELECT customer_id FROM late_payment_histories WHERE disputed = TRUE
UNION
SELECT customer_id FROM late_payment_histories WHERE disputed = FALSE;

-- Set intersection of disputed and invoices with days late greater than 10
-- This query identifies customers who have disputed invoices and also have invoices that are more than 10 days late. It highlights customers with significant payment issues.
SELECT customer_id FROM late_payment_histories WHERE disputed = TRUE
INTERSECT
SELECT customer_id FROM late_payment_histories WHERE days_late > 10;

-- Set difference of customers with disputed invoices but not late
-- This query finds customers with disputed invoices that were not late. It provides insights into disputes unrelated to payment delays.
SELECT customer_id FROM late_payment_histories WHERE disputed = TRUE
EXCEPT
SELECT customer_id FROM late_payment_histories WHERE days_late > 0;

---- DONE !! YEAHHHH
