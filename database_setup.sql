CREATE DATABASE finance_factoring;
\c finance_factoring;
CREATE TABLE late_payment_histories (
    country_code INT,           -- Storing the country code as an integer for efficient querying.
    customer_id VARCHAR(50),    -- Using VARCHAR for customer IDs as they are alphanumeric.
    paperless_date DATE,        -- Storing the date when the invoice was made paperless.
    invoice_number BIGINT,      -- Storing invoice numbers as BIGINT to accommodate large values.
    invoice_date DATE,          -- Storing the date the invoice was created.
    due_date DATE,              -- Storing the date the invoice is due.
    invoice_amount DECIMAL(15, 2), -- Using DECIMAL to store monetary amounts precisely.
    disputed BOOLEAN,           -- Using BOOLEAN to store whether the invoice was disputed (Yes/No).
    settled_date DATE,          -- Storing the date the invoice was settled.
    paperless_bill VARCHAR(20), -- Storing the type of billing (paper or electronic) as VARCHAR.
    days_to_settle INT,         -- Storing the number of days taken to settle the invoice.
    days_late INT               -- Storing the number of days the payment was late.
);