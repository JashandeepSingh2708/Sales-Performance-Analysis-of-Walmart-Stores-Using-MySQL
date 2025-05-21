# Sales-Performance-Analysis-of-Walmart-Stores-Using-MySQL
This project analyzes Walmart's transactional data using advanced SQL techniques to uncover insights on sales growth, customer segmentation, product profitability, and payment preferences. Each SQL task is designed to solve a specific business problem Walmart faces, helping to optimize their strategy based on data-driven decisions.

# Sales Performance Analysis of Walmart Stores Using Advanced MySQL Techniques

## 📊 Overview
This project presents a comprehensive analysis of Walmart’s sales dataset using MySQL. It explores patterns in sales growth, product profitability, customer behavior, and payment methods using advanced SQL techniques including `CTEs`, `window functions`, and conditional logic. The goal is to provide Walmart with actionable business insights to improve their operational and marketing strategies.

---

## 📁 Dataset Overview

The dataset includes:
- Branch details (A, B, C)
- City and customer type
- Product lines and their gross income
- Sales totals and quantities
- Payment methods
- Timestamps (Date & Time)

---

## 🧠 Business Problems & SQL Solutions

### Task 1: 🔝 Identifying the Top Branch by Sales Growth Rate
- **Techniques Used:** `CTE`, `GROUP BY`, `DATE_FORMAT`, `ROUND`, `MAX/MIN`
- **Goal:** Compare month-over-month sales totals by branch to find the highest sales growth.

### Task 2: 💰 Most Profitable Product Line for Each Branch
- **Techniques Used:** `Window Function (RANK)`, `SUM`, `PARTITION BY`, `Subquery`
- **Goal:** Identify the product line with the highest profit (`gross income - cogs`) per branch.

### Task 3: 👤 Customer Segmentation Based on Spending
- **Techniques Used:** `CASE`, `ROUND`, `AVG`, `GROUP BY`
- **Goal:** Categorize customers into `Low`, `Medium`, and `High` spenders based on their average spending.

### Task 4: 🚨 Detecting Anomalies in Sales Transactions
- **Techniques Used:** Nested `SELECT`, `STDDEV`, `AVG`, `CASE`
- **Goal:** Flag transactions that are 2 standard deviations away from the average product line total.

### Task 5: 💳 Most Popular Payment Method by City
- **Techniques Used:** `COUNT`, `GROUP BY`, `ORDER BY`, `LIMIT`
- **Goal:** Determine the most frequently used payment method across cities.

### Task 6: 👩‍🦰 Monthly Sales Distribution by Gender
- **Techniques Used:** `MONTHNAME`, `SUM`, `RANK`, `PARTITION BY`
- **Goal:** Understand sales contribution trends across genders monthly.

### Task 7: 🛒 Best Product Line by Customer Type
- **Techniques Used:** `CTE`, `COUNT`, `RANK`, `PARTITION BY`
- **Goal:** Find which product lines are favored by each customer type (`Member` vs `Normal`).

### Task 8: 🔁 Identifying Repeat Customers
- **Techniques Used:** `JOIN`, `DATEDIFF`, `MIN`, `GROUP BY`
- **Goal:** Track customers who made a second purchase within 30 days of their first.

### Task 9: 🏆 Top 5 Customers by Sales Volume
- **Techniques Used:** `SUM`, `ROUND`, `ORDER BY`, `LIMIT`
- **Goal:** Rank and reward top 5 customers based on total revenue generated.

### Task 10: 📆 Sales Trends by Day of the Week
- **Techniques Used:** `DAYNAME`, `SUM`, `ORDER BY`, `GROUP BY`
- **Goal:** Find out which day yields the highest revenue and quantity sold.

---

## 🛠 SQL Functions & Concepts Used

- `WITH` (Common Table Expressions)
- `RANK() OVER (PARTITION BY...)`
- `CASE WHEN` logic for conditional classification
- Aggregate functions: `SUM()`, `AVG()`, `STDDEV()`, `COUNT()`, `MIN()`, `MAX()`
- Date formatting with `DATE_FORMAT()`, `DAYNAME()`, `MONTHNAME()`, `STR_TO_DATE()`
- Subqueries and nested queries
- Joins (`self-join` for repeat customer detection)



---

## 🧑‍💻 How to Run

1. Create the database and import the dataset.
2. Run the preprocessing steps to correct date/time formats.
3. Execute each query to explore the respective insights.


---




