# 📊 Retail Sales Analysis

<div align="center">

**Comprehensive SQL-based analysis transforming retail data into actionable business insights**

</div>

---

## 📋 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [💼 Business Impact & Relevance](#-business-impact--relevance)
- [🗄️ Dataset Structure](#️-dataset-structure)
- [🧹 Data Cleaning Process](#-data-cleaning-process)
- [🔍 Data Exploration](#-data-exploration)
- [📈 Business Problems Solved](#-business-problems-solved)
  - [1. Daily Sales Performance Tracking](#1-daily-sales-performance-tracking)
  - [2. Category-Specific Inventory Analysis](#2-category-specific-inventory-analysis)
  - [3. Category Performance Analysis](#3-category-performance-analysis)
  - [4. Customer Demographics Analysis](#4-customer-demographics-analysis)
  - [5. High-Value Transaction Analysis](#5-high-value-transaction-analysis)
  - [6. Gender-Category Purchase Patterns](#6-gender-category-purchase-patterns)
  - [7. Seasonal Trend Analysis](#7-seasonal-trend-analysis)
  - [8. Top Customer Identification](#8-top-customer-identification)
  - [9. Market Penetration Analysis](#9-market-penetration-analysis)
  - [10. Operational Efficiency Analysis](#10-operational-efficiency-analysis)
  - [11. Advanced Customer Ranking](#11-advanced-customer-ranking)
  - [12. Customer Behavior Analytics](#12-customer-behavior-analytics)
  - [13. Monthly Performance Trends](#13-monthly-performance-trends)
  - [14. Customer Engagement Analysis](#14-customer-engagement-analysis)
- [⚙️ Key Technical Features](#️-key-technical-features)
- [📊 Business Insights Summary](#-business-insights-summary)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 Future Enhancements](#-future-enhancements)
- [📝 Getting Started](#-getting-started)
- [📄 License](#-license)

---

## 📊 Dataset Download

| File Type | Description | Download Link |
|-----------|-------------|---------------|
| 📄 CSV | Raw retail sales data | [Download retail_sales.csv](./data/retail_sales.csv) |
| 📋 SQL | Complete analysis queries | [Download retail_sales_analysis.sql](./retail_sales_analysis.sql) |

> **Note**: The dataset contains transaction records with customer demographics, product categories and sales metrics. Perfect for learning SQL analytics and business intelligence techniques.

---

## 🎯 Project Overview

This project provides comprehensive SQL-based analysis of retail sales data to uncover critical business insights that drive revenue growth, optimize operations and enhance customer experience. Through systematic data exploration and advanced analytics, we address key business challenges faced by retail organizations.

## 💼 Business Impact & Relevance

Retail businesses generate vast amounts of transactional data daily. This analysis transforms raw data into actionable insights that directly impact:

- **💰 Revenue Optimization**: Identify high-value customers and products
- **📦 Inventory Management**: Understand seasonal trends and category performance  
- **🤝 Customer Retention**: Analyze purchasing patterns and behavior gaps
- **⚡ Operational Efficiency**: Optimize staffing based on sales patterns
- **📋 Strategic Planning**: Data-driven decision making for business growth

## 🗄️ Dataset Structure

```sql
CREATE TABLE retail_sales(
    transactions_id INT PRIMARY KEY, 
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(20),	
    quantiy INT,
    price_per_unit FLOAT,	
    cogs FLOAT,	
    total_sale FLOAT
);
```

## 🧹 Data Cleaning Process

<details>
<summary><strong>🔍 Null Value Detection</strong></summary>

**Purpose**: Identify data quality issues that could impact analysis accuracy

```sql
-- Check for null values across all critical fields
SELECT * 
FROM retail_sales
WHERE 
    transactions_id is NULL
    OR sale_date is NULL
    OR sale_time is NULL
    OR gender is NULL
    OR category is NULL
    OR quantiy is NULL
    OR cogs is NULL
    OR total_sale is NULL;
```

**Business Impact**: Ensures data integrity and prevents skewed analysis results that could lead to poor business decisions.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

<details>
<summary><strong>🧽 Data Cleaning Implementation</strong></summary>

**Purpose**: Remove incomplete records to maintain data quality

```sql
-- Remove records with missing critical information
DELETE FROM retail_sales
WHERE 
    transactions_id is NULL
    OR sale_date is NULL
    OR sale_time is NULL
    OR gender is NULL
    OR category is NULL
    OR quantiy is NULL
    OR cogs is NULL
    OR total_sale is NULL;
```

**Business Impact**: Creates a clean, reliable dataset for accurate business intelligence and decision-making.

**Key Insights**: *[Data cleaning results will be added based on analysis]*

</details>

## 🔍 Data Exploration

<details>
<summary><strong>📊 Overall Dataset Size</strong></summary>

**Purpose**: Understand the scope and scale of available data

```sql
-- Total number of sales transactions
SELECT COUNT(*) as total_sales FROM retail_sales;
```

**Business Impact**: Establishes the statistical significance of findings and determines the confidence level of insights.

**Key Insights**: *[Total sales count and significance will be added]*

</details>

<details>
<summary><strong>👥 Customer Base Analysis</strong></summary>

**Purpose**: Assess customer diversity and market reach

```sql
-- Count unique customers in dataset
SELECT COUNT(DISTINCT customer_id) as Total_no_Cust FROM retail_sales;
```

**Business Impact**: Understanding customer base size helps evaluate market penetration, customer acquisition needs and potential for growth.

**Key Insights**: *[Customer base size and implications will be added]*

</details>

<details>
<summary><strong>🏷️ Product Category Coverage</strong></summary>

**Purpose**: Evaluate business diversification and product portfolio

```sql
-- Count distinct product categories
SELECT COUNT(DISTINCT category) FROM retail_sales;
```

**Business Impact**: Reveals business diversification level and helps identify opportunities for category expansion or consolidation.

**Key Insights**: *[Category analysis and portfolio insights will be added]*

</details>

## 📈 Business Problems Solved

### 1. Daily Sales Performance Tracking

<details>
<summary><strong>📅 Click to expand analysis</strong></summary>

**Business Question**: What were our sales on specific dates?

```sql
SELECT *
FROM retail_sales
WHERE sale_Date = '2022-11-05';
```

**Business Impact**: Essential for daily performance monitoring, identifying successful promotional campaigns, and understanding traffic patterns during specific events or holidays.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 2. Category-Specific Inventory Analysis

<details>
<summary><strong>👕 Click to expand analysis</strong></summary>

**Business Question**: Which high-quantity clothing transactions occurred in November 2022?

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing' 
    AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' 
    AND quantiy >= 4;
```

**Business Impact**: Identifies bulk buyers and helps optimize inventory levels for high-demand periods. Critical for preventing stockouts and planning promotional strategies.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 3. Category Performance Analysis

<details>
<summary><strong>📊 Click to expand analysis</strong></summary>

**Business Question**: What is the total revenue and transaction volume by category?

```sql
SELECT 
    category, 
    SUM(total_sale) as total_sales,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY category;
```

**Business Impact**: Reveals which product categories drive the most revenue and volume, enabling strategic resource allocation, marketing budget distribution, and expansion decisions.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 4. Customer Demographics Analysis

<details>
<summary><strong>👤 Click to expand analysis</strong></summary>

**Business Question**: What is the average age of Beauty category customers?

```sql
SELECT 
    ROUND(AVG(age)) as avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

**Business Impact**: Enables targeted marketing campaigns, product development aligned with customer demographics, and personalized customer experiences.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 5. High-Value Transaction Analysis

<details>
<summary><strong>💎 Click to expand analysis</strong></summary>

**Business Question**: Which transactions exceed $1000?

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

**Business Impact**: Identifies premium customers and high-value transactions, crucial for VIP customer programs, luxury product positioning, and revenue concentration analysis.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 6. Gender-Category Purchase Patterns

<details>
<summary><strong>👫 Click to expand analysis</strong></summary>

**Business Question**: How do purchase patterns vary by gender across categories?

```sql
SELECT
    gender,
    category,
    COUNT(transactions_id) as total_transactions
FROM retail_sales
GROUP BY gender, category;
```

**Business Impact**: Informs targeted marketing strategies, product placement decisions, and helps identify cross-selling opportunities by understanding gender preferences.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 7. Seasonal Trend Analysis

<details>
<summary><strong>📈 Click to expand analysis</strong></summary>

**Business Question**: What are the best-performing months each year?

```sql
WITH monthly_avg_sales AS(
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) as avg_sales
    FROM retail_sales
    GROUP BY year, month
),
ranked_months AS(
    SELECT
        year, month, avg_sales,
        RANK() OVER(PARTITION BY year ORDER BY avg_sales DESC) as sales_rank
    FROM monthly_avg_sales
)
SELECT * FROM ranked_months
WHERE sales_rank = 1
ORDER BY year DESC;
```

**Business Impact**: Critical for seasonal inventory planning, promotional calendar development, and cash flow forecasting. Helps optimize marketing spend timing.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 8. Top Customer Identification

<details>
<summary><strong>⭐ Click to expand analysis</strong></summary>

**Business Question**: Who are our top 5 customers by total sales value?

```sql
SELECT 
    customer_id,
    ROUND(SUM(total_sale)::numeric, 2) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

**Business Impact**: **Why Top 5 Customers Matter**:
- **80/20 Rule**: Often 20% of customers generate 80% of revenue
- **Retention ROI**: Retaining existing customers costs 5x less than acquiring new ones
- **Lifetime Value**: Top customers often have higher lifetime value and referral potential
- **Risk Management**: Identifying revenue concentration helps assess business risk
- **Personalization**: Enables VIP treatment and personalized service strategies

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 9. Market Penetration Analysis

<details>
<summary><strong>🎯 Click to expand analysis</strong></summary>

**Business Question**: How many unique customers shop in each category?

```sql
SELECT 
    category,
    COUNT(DISTINCT customer_id) as Total_customers
FROM retail_sales
GROUP BY category;
```

**Business Impact**: Measures market penetration by category, identifies expansion opportunities, and reveals category-specific customer loyalty patterns.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 10. Operational Efficiency Analysis

<details>
<summary><strong>⏰ Click to expand analysis</strong></summary>

**Business Question**: What are our sales patterns by time of day?

```sql
SELECT
    CASE
        WHEN sale_time <= TIME '12:00:00' THEN 'Morning' 
        WHEN sale_time < TIME '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS orders
FROM retail_sales
GROUP BY 1
ORDER BY orders DESC;
```

**Business Impact**: Optimizes staff scheduling, identifies peak hours for promotional activities, and helps plan maintenance during low-traffic periods.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 11. Advanced Customer Ranking

<details>
<summary><strong>🏆 Click to expand analysis</strong></summary>

**Business Question**: Top 5 customers using window functions for detailed ranking?

```sql
WITH cust_total AS (
    SELECT
        customer_id,
        ROUND(SUM(total_sale)::numeric,2) AS total_sales
    FROM retail_sales
    GROUP BY customer_id
),
ranked AS (
    SELECT
        customer_id, total_sales,
        ROW_NUMBER() OVER(ORDER BY total_sales DESC) as rn
    FROM cust_total
)
SELECT customer_id, total_sales
FROM ranked
WHERE rn <= 5;
```

**Business Impact**: Provides precise customer ranking for loyalty programs, enables tier-based customer service, and supports strategic account management.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 12. Customer Behavior Analytics

<details>
<summary><strong>🔍 Click to expand analysis</strong></summary>

**Business Question**: What are the purchase patterns and running totals for each customer?

```sql
SELECT
    customer_id, sale_date, sale_time, total_sale,
    LAG(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date, sale_time) AS prev_sale,
    (total_sale - LAG(total_sale) OVER (PARTITION BY customer_id ORDER BY sale_date, sale_time)) AS delta_vs_prev,
    SUM(total_sale) OVER(PARTITION BY customer_id ORDER BY sale_date, sale_time 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM retail_sales
ORDER BY customer_id, sale_date, sale_time;
```

**Business Impact**: Reveals customer spending evolution, identifies increasing/decreasing spend patterns, and enables predictive analytics for customer lifetime value.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 13. Monthly Performance Trends

<details>
<summary><strong>📅 Click to expand analysis</strong></summary>

**Business Question**: How do monthly sales perform with month-over-month changes?

```sql
WITH monthly AS(
    SELECT
        EXTRACT(YEAR FROM sale_date)::int AS yr,
        EXTRACT(MONTH FROM sale_date)::int AS mn,
        SUM(total_sale) AS month_sales
    FROM retail_sales
    GROUP BY yr, mn
),
ranked AS(
    SELECT
        yr, mn, ROUND(month_sales::numeric,2) AS month_sales,
        LAG(month_sales) OVER (PARTITION BY yr ORDER BY mn) AS prev_month_sales,
        (month_sales - LAG(month_sales) OVER(PARTITION BY yr ORDER BY mn)) AS mom_delta,
        RANK() OVER (PARTITION BY yr ORDER BY month_sales DESC) AS sales_rank
    FROM monthly
)
SELECT yr, mn, month_sales, prev_month_sales, mom_delta, sales_rank
FROM ranked
ORDER BY yr, sales_rank, mn;
```

**Business Impact**: Tracks business growth momentum, identifies seasonal patterns, and provides early warning indicators for performance issues.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

### 14. Customer Engagement Analysis

<details>
<summary><strong>📱 Click to expand analysis</strong></summary>

**Business Question**: Which customers have the largest gaps between purchases?

```sql
WITH ordered AS(
    SELECT
        customer_id, sale_date,
        LEAD(sale_date) OVER (PARTITION BY customer_id ORDER BY sale_date) AS next_date
    FROM retail_sales
),
gaps AS(
    SELECT
        customer_id, sale_date, next_date,
        (next_date - sale_date) AS gap_days
    FROM ordered
    WHERE next_date IS NOT NULL
)
SELECT
    customer_id,
    MAX(gap_days) AS max_gap_days
FROM gaps
GROUP BY customer_id
ORDER BY max_gap_days DESC
LIMIT 5;
```

**Business Impact**: Identifies at-risk customers for churn, enables re-engagement campaigns, and helps understand customer lifecycle patterns for retention strategies.

**Key Insights**: *[Insights will be added based on result analysis]*

</details>

## ⚙️ Key Technical Features

- **🧹 Data Cleaning**: Comprehensive null value handling and data validation
- **📊 Window Functions**: Advanced analytics using LAG, LEAD, ROW_NUMBER, RANK
- **🔄 CTEs**: Complex queries broken down for readability and performance
- **📅 Date/Time Analysis**: Sophisticated temporal pattern recognition
- **📈 Aggregation**: Multi-level grouping and statistical analysis

## 📊 Business Insights Summary

*[Result sets and specific insights will be added based on query execution results]*

## 🛠️ Technologies Used

- **💾 SQL**: PostgreSQL/MySQL compatible queries
- **📈 Analytics**: Window functions, CTEs, aggregations
- **📊 Data Types**: Comprehensive handling of dates, times, and numeric data

## 🚀 Future Enhancements

- 📊 Customer segmentation analysis (RFM)
- 🔮 Predictive analytics for demand forecasting
- 👥 Cohort analysis for customer retention
- 🛒 Market basket analysis for cross-selling opportunities

## 📝 Getting Started

1. **Create Table**: Use the provided schema to create the retail_sales table
2. **Load Data**: Import your retail sales data
3. **Clean Data**: Execute the data cleaning queries
4. **Analyze**: Run analysis queries based on your business needs

---

## 📄 License

MIT License

Copyright (c) 2025 [Meenakshi Sethi]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

<div align="center">

**⭐ If this project helped you, please consider giving it a star! ⭐**

*This analysis provides actionable insights that directly impact business decision-making, from daily operations to strategic planning.*

</div>
