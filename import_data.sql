-- Import data from a CSV file into the 'late_payment_histories' table

COPY late_payment_histories(
    country_code,      -- Country code (INT)
    customer_id,       -- Customer ID (VARCHAR)
    paperless_date,    -- Paperless date (DATE)
    invoice_number,    -- Invoice number (BIGINT)
    invoice_date,      -- Invoice date (DATE)
    due_date,          -- Due date (DATE)
    invoice_amount,    -- Invoice amount (DECIMAL)
    disputed,          -- Disputed status (BOOLEAN)
    settled_date,      -- Settled date (DATE)
    paperless_bill,    -- Paperless bill type (VARCHAR)
    days_to_settle,    -- Days to settle (INT)
    days_late          -- Days late (INT)
)
-- Source file path
FROM '/Users/putanyn/Documents/Job_Project/SQL/data.csv'

-- Column delimiter
DELIMITER ','

-- First row contains column headers
CSV HEADER;