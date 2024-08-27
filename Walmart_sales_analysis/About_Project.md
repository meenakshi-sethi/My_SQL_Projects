# **Walmart Sales Analysis using MySQL**

## **Table of Contents**
1. About the Project
2. Objective of the Project
3. Tools
4. Future Enhancements
5. About the Data
   - Data Overview
   - Data Dictionary
6. Purpose of the Data
7. Data Source
8. Usage

---

## **About the Project**

This project focuses on analyzing Walmart's sales data to uncover insights that can drive strategic business decisions. The primary goals include understanding sales patterns, customer behavior, product performance, and profitability across different store branches. The analysis is carried out using MySQL to handle the data, with a view towards extracting actionable insights that can enhance Walmart’s overall business performance.

---

## **Objective of the Project**

The major objective of this project is to gain a comprehensive understanding of Walmart's sales data to identify various factors that influence sales across different branches. This analysis aims to:
- Identify top-performing products and branches.
- Understand customer purchasing behavior and preferences.
- Analyze the profitability of different products and payment methods.
- Uncover seasonal sales trends and high-demand periods.

---

## **Tools**

- **MySQL:** Used for data storage, manipulation, and analysis.
- **GitHub:** Employed for version control and project management.

---

## **Future Enhancements**

- **Predictive Analytics:** Incorporating machine learning algorithms for sales forecasting and predictive modeling to anticipate future sales trends and customer behavior.
- **Visualization:** Developing interactive dashboards using tools like Tableau or Power BI to provide visual insights and enhance data-driven decision-making.

---

## **About the Data**

The dataset used in this analysis contains transactional data from Walmart, with a particular focus on branch-wise sales. This data consists of 1,000 records and 16 columns, each providing critical details about individual transactions, such as the store branch, product category, pricing, and customer demographics.

### **Data Overview:**

- **Total Records:** 1,000
- **Total Columns:** 16

### **Data Dictionary**

| Column Name    | Description |
|----------------|-------------|
| **InvoiceID**     | A unique identifier for each transaction. |
| **Branch**        | The store branch where the transaction occurred, represented by single characters (A, B, C). |
| **CustType**      | The type of customer, indicating whether they are a "Member" or a "Normal" customer. |
| **Gender**        | The gender of the customer, categorized as "Male" or "Female". |
| **ProdLine**      | The product category or line to which the purchased item belongs. |
| **PricePU**       | The unit price of the product purchased. |
| **Quantity**      | The number of units of the product purchased in the transaction. |
| **Tax**           | The tax amount applied to the transaction. |
| **Total**         | The total transaction amount, including the tax. |
| **TransDate**     | The date on which the transaction took place. |
| **TransTime**     | The time of day the transaction occurred. |
| **Payment**       | The method of payment used by the customer (e.g., Cash, Credit Card, Ewallet). |
| **COGS**          | Cost of Goods Sold, representing the cost to Walmart for the items sold in the transaction. |
| **GrossMarginPct**| The gross margin percentage, indicating the profitability of the transaction. |
| **GrossInc**      | The gross income generated from the transaction, calculated as Total minus COGS. |
| **Rating**        | The customer’s rating of their shopping experience, on a scale of 1 to 10. |

### **Modifications:**
To focus more effectively on branch-wise sales analysis, City columns were removed from the original dataset because the analysis was designed to be branch-specific.

---

## **Purpose of the Data**

The dataset is utilized to conduct various analyses aimed at understanding key aspects of Walmart's business:

1. **Product Analysis:**
   - Identify which product lines generate the highest revenue.
   - Analyze the average transaction value by product line.
   - Determine the seasonal variation in sales by product line.

2. **Sales Analysis:**
   - Identify top-performing branches in terms of total sales revenue.
   - Analyze sales trends over time, including monthly and weekly patterns.
   - Understand the sales performance by payment method and average transaction size.

3. **Customer Analysis:**
   - Examine average spend per customer type.
   - Understand purchase frequency and behavior by customer type.
   - Analyze the gender distribution of purchases.

4. **Profitability Analysis:**
   - Determine the most profitable product lines and branches.
   - Analyze profit margins by product line and payment method.
   - Assess the seasonal profitability trends and customer satisfaction based on ratings.

---

## **Data Source**

The data was obtained from [Kaggle](https://www.kaggle.com/datasets/antaesterlin/walmart-commerce-data).

---

## **Usage**

This data can be leveraged for a wide range of analyses, including:
- **Descriptive Statistics:** To summarize and describe the key features of the dataset.
- **Trend Analysis:** To identify patterns and changes in sales over time.
- **Customer Segmentation:** To categorize customers based on their buying behavior and demographics, aiding targeted marketing strategies.

---
