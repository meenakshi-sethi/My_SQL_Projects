# Walmart Sales Analysis using MySQL

## Table of Contents
- [About the Project](#about-the-project)
- [Objective of the Project](#objective-of-the-project)
- [Tools](#tools)
- [Future Enhancements](#future-enhancements)
- [About the Data](#about-the-data)
  - [Data Dictionary](#data-dictionary)
  - [Purpose of the Data](#purpose-of-the-data)
  - [Data Source](#data-source)
  - [Usage](#usage)

## About the Project
This project analyzes Walmart sales data to uncover insights that can drive business decisions. The main goals are to understand sales patterns, customer behavior, product performance, and profitability across different store branches.

## Objective of the Project
The major objective of this project is to gain insight into Walmart's sales data to understand the various factors that affect sales across different branches.

## Tools
- **MySQL**: Used for data storage and analysis.
- **GitHub**: For version control and project management.

## Future Enhancements
- **Predictive Analytics**: Adding machine learning for sales forecasting.
- **Visualization**: Creating interactive dashboards.
- **Cross-Store Analysis**: Extending analysis to multiple stores.

## About the Data
The dataset used in this analysis contains transactional data from a Walmart store, specifically focusing on branch-wise sales. The data comprises 1,000 records and 16 columns, each capturing essential details about individual transactions, including the branch, product category, pricing, and customer demographics.

**Data Overview:**

- **Total Records:** 1,000
- **Total Columns:** 16

**Data Dictionary**

| Column Name       | Description                                                                                      |
|-------------------|--------------------------------------------------------------------------------------------------|
| **InvoiceID**     | A unique identifier for each transaction.                                                        |
| **Branch**        | The store branch where the transaction occurred, represented by single characters (A, B, C).     |
| **CustType**      | The type of customer, indicating whether they are a "Member" or a "Normal" customer.             |
| **Gender**        | The gender of the customer, categorized as "Male" or "Female".                                    |
| **ProdLine**      | The product category or line to which the purchased item belongs.                                 |
| **PricePU**       | The unit price of the product purchased.                                                         |
| **Quantity**      | The number of units of the product purchased in the transaction.                                 |
| **Tax**           | The tax amount applied to the transaction.                                                       |
| **Total**         | The total transaction amount, including the tax.                                                 |
| **TransDate**     | The date on which the transaction took place.                                                    |
| **TransTime**     | The time of day the transaction occurred.                                                        |
| **Payment**       | The method of payment used by the customer (e.g., Cash, Credit Card, Ewallet).                   |
| **COGS**          | Cost of Goods Sold, representing the cost to Walmart for the items sold in the transaction.      |
| **GrossMarginPct**| The gross margin percentage, indicating the profitability of the transaction.                    |
| **GrossInc**      | The gross income generated from the transaction, calculated as Total minus COGS.                 |
| **Rating**        | The customer’s rating of their shopping experience, on a scale of 1 to 10.                       |

**Modifications:**

To focus more effectively on branch-wise sales analysis, several columns were removed from the original dataset:

- **City**: Removed because branch data provides sufficient geographic detail for this analysis.
- **Time_of_Day**, **Day_Name**, and **Month_Name**: Removed since the date and time columns provide the necessary temporal information, and these derived columns were not needed for this specific analysis.

This streamlined dataset allows for a more targeted examination of sales trends, customer behavior, and profitability across different Walmart branches.

### Purpose of the Data
This dataset is used to perform various sales analyses, including but not limited to:
- Analyzing sales trends across different store branches.
- Understanding customer preferences based on demographic factors.
- Identifying top-performing product lines.
- Evaluating the effectiveness of different payment methods.
- Calculating profitability and gross margins.

### Data Source
The data was obtained from [Kaggle](https://www.kaggle.com/datasets/antaesterlin/walmart-commerce-data).

### Usage
This data can be used for a variety of analyses, including descriptive statistics, trend analysis, and customer segmentation.
