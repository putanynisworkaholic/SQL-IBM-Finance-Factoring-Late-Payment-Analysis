# [SQL] IBM-Finance-Factoring-Late-Payment-Analysis
# Owner : Putanyn Manee 🇹🇭 🙇🏻‍♂️

This project contains SQL scripts and a dataset used for analyzing late payment histories in a finance factoring context. The analysis includes performance metrics, financial analysis, payment behavior, and customer insights.

## Project Structure

- `data.csv`: The dataset containing late payment histories.
- `database_setup.sql`: SQL script to create the database and tables.
- `import_data.sql`: SQL script to import data from the CSV file into the database.
- `preprocessing.ipynb`: Jupyter notebook for preprocessing the data.
- `queries.sql`: SQL script containing various queries for analysis.

## Setup

### Prerequisites

- PostgreSQL
- Python (with `pandas` and `jupyter` packages)
- Git

### Steps to Set Up the Project

1. **Clone the repository**:
   ```sh
   git clone https://github.com/putanynisworkaholic/SQL-IBM-Finance-Factoring-Late-Payment-Analysis.git
   cd SQL-IBM-Finance-Factoring-Late-Payment-Analysis

2. **Set up the PostgreSQL database**:
   - Open your PostgreSQL CLI:
     ```sh
     psql -U postgres
     ```
   - List your databases to confirm connection:
     ```sh
     \l
     ```
   - Run the `database_setup.sql` script to create the database and tables. You can copy and run the following command:
     ```sh
     \i database_setup.sql
     ```

3. **Import the data**:
   - Connect to the `finance_factoring` database:
     ```sh
     \c finance_factoring
     ```
   - Run the `import_data.sql` script to import the CSV data into the database. You can copy and run the following command:
     ```sh
     \i import_data.sql
     ```

4. **Preprocess the data** (optional):
   - Open the `preprocessing.ipynb` notebook in Jupyter and run the cells to preprocess the data as needed.

## Usage

### Running Queries

To run the analysis queries, connect to the `finance_factoring` database and execute the queries from the `queries.sql` file. Instead of using `\i`, you can copy and paste the queries into your IDE or SQL tool as you prefer.

### Queries Description

#### Performance Metrics

1. **Average Days Late**: Calculates the average number of days invoices are paid late.
2. **Total Disputed Amounts**: Sums the invoice amounts for all disputed invoices.
3. **Average Days to Settle**: Calculates the average number of days taken to settle invoices.
4. **Disputed Invoices by Country**: Counts the number of disputed invoices for each country.

#### Financial Analysis

1. **Average Invoice Amount by Country**: Calculates the average invoice amount for each country.
2. **Top 5 Customers by Total Invoice Amount**: Lists the top 5 customers based on their total invoice amounts.

#### Payment Behavior

1. **Invoices Settled Late by Month**: Counts the number of invoices settled late for each month.
2. **Percentage of Disputed Invoices by Country**: Calculates the percentage of disputed invoices for each country.

#### Customer Insights

1. **Customers with Country Details**: Retrieves the list of customers along with their country details.
2. **High-Value Customers**: Identifies customers whose total invoice amount is greater than the average.

#### Set Operations

1. **Union of Disputed and Non-Disputed Invoices**: Combines the list of customers with disputed and non-disputed invoices.
2. **Intersection of Disputed and Late Invoices**: Identifies customers who have disputed invoices and also have invoices that are more than 10 days late.
3. **Difference of Disputed but Not Late Invoices**: Finds customers with disputed invoices that were not late.

## Source of Data

The dataset used in this project is sourced from Kaggle: [Finance Factoring - IBM Late Payment Histories](https://www.kaggle.com/datasets/hhenry/finance-factoring-ibm-late-payment-histories).

