# **Walmart Sales and Profitability Analysis - Detailed Report**

## **Introduction**
We began by creating the Walmart database to organize and store sales data effectively. A `sales` table was defined, containing key attributes such as customer type, product line, transaction amounts, and timestamps. Due to issues with importing the CSV file directly into MySQL, the data was manually inserted into the table to ensure that the analysis could proceed without delays.

### **Objective**
- To extract actionable insights from Walmart’s sales data to enhance product strategy, customer engagement, and operational efficiency.

### **Data Preparation**
- Processed and cleaned a dataset containing 1,000 records and 16 features.
- Data cleaning was conducted to ensure the integrity of the dataset, confirming that there were no null values in key financial columns.
- To enhance the dataset and gain deeper insights, we performed feature engineering by creating new attributes:
- **`timeofday`**: Categorizes transactions into morning, afternoon, or evening.
- **`dayname`**: Captures the day of the week of each transaction.
- **`monthname`**: Records the month of each transaction.
  These new features are instrumental in analyzing temporal trends and patterns in the sales data, enabling a more detailed and insightful analysis. which are as below:

#### Detailed Table of Attributes with Description and Data Type:

| **Attribute**       | **Data Type**       | **Description**                                                                 |
|---------------------|---------------------|---------------------------------------------------------------------------------|
| `invoiceid`         | `VARCHAR(30)`       | Unique identifier for each sales transaction.                                   |
| `branch`            | `VARCHAR(5)`        | Identifier for the store branch where the transaction occurred (e.g., A, B, C). |
| `custtype`          | `VARCHAR(20)`       | Type of customer, indicating whether they are a "Member" or "Normal" customer.  |
| `gender`            | `VARCHAR(10)`       | Gender of the customer ("Male" or "Female").                                    |
| `prodline`          | `VARCHAR(100)`      | Product category or line (e.g., Food and Beverages, Home and Lifestyle).        |
| `pricepu`           | `DECIMAL(10,2)`     | Price per unit of the product purchased.                                        |
| `quantity`          | `INT`               | Number of units purchased in the transaction.                                   |
| `tax`               | `DECIMAL(6,4)`      | Tax amount applied to the transaction.                                          |
| `total`             | `DECIMAL(10,2)`     | Total transaction amount, including tax.                                        |
| `transdate`         | `DATE`              | Date on which the transaction occurred.                                         |
| `transtime`         | `TIME`              | Time at which the transaction was completed.                                    |
| `payment`           | `VARCHAR(20)`       | Payment method used by the customer (e.g., Cash, Credit Card, Ewallet).         |
| `cogs`              | `DECIMAL(10,2)`     | Cost of goods sold, representing the cost to Walmart for the items sold.        |
| `grossmarginpct`    | `DECIMAL(10,2)`     | Gross margin percentage, indicating the profitability of the transaction.       |
| `grossinc`          | `DECIMAL(10,2)`     | Gross income from the transaction, calculated as Total minus COGS.              |
| `rating`            | `DECIMAL(3,1)`      | Customer rating of their shopping experience, on a scale of 1 to 10.            |
| `timeofday`         | `VARCHAR(20)`       | Categorizes transactions into "Morning," "Afternoon," or "Evening" based on time.|
| `dayname`           | `VARCHAR(20)`       | Name of the day on which the transaction occurred (e.g., Monday, Tuesday).      |
| `monthname`         | `VARCHAR(20)`       | Name of the month in which the transaction occurred (e.g., January, February).  |

---
### **Methodology**
- Utilized a range of SQL functions, including aggregate functions, date/time functions, CASE statements, GROUP BY, ORDER BY, and CTEs to derive meaningful insights.

---

### **Product Analysis Insights**

1. **Highest Revenue Product Line**
   - ![SQL Query A1](path to image)
   - **Result:** "Food and beverages" generated the highest revenue across all branches, totaling $56,144.96.
   - **Insight:** Focus promotions and inventory on this category to maximize profits.

2. **Highest Average Transaction Value**
   - ![SQL Query A2](path to image)
   - **Result:** "Home and lifestyle" leads with an average transaction value of $336.64, followed by "Sports and travel" at $332.07.
   - **Insight:** Target higher-spending customers for these products through premium marketing strategies.

3. **Branch-Specific Product Line Performance**
   - ![SQL Query A3](path to image)
   - **Result:** Branch B excels in "Sports and travel" and "Health and beauty," while Branch A leads in "Home and lifestyle" and "Electronic accessories."
   - **Insight:** Tailor inventory and marketing strategies to the dominant product lines in each branch based on regional preferences.

4. **Seasonal Variation in Product Line Sales**
   - ![SQL Query A4](path to image)
   - **Result:** "Sports and travel" peaks in January, and "Home and lifestyle" in March.
   - **Insight:** Align promotions and inventory management with these peak periods to optimize sales.

5. **Product Line Performance by Customer Type**
   - ![SQL Query A5](path to image)
   - **Result:** Members generate higher revenue in "Food and beverages" and "Sports and travel," while non-members prefer "Electronic accessories."
   - **Insight:** Enhance loyalty programs and personalized offers to further engage members and boost spending.

7. **Consistent Seasonal Sales Trends**
   - ![SQL Query A7](path to image)
   -  **Result:** Seasonal trends were confirmed, with "Sports and travel" peaking in January and March.
   - **Insight:** Reinforce the importance of strategic stock management and seasonal sales planning.

8. **Highest Sales Volume**
   - **Result:** "Electronic accessories" sold the most units (971), followed by "Food and beverages" (952).
   - **Insight:** Ensure these popular products are well-stocked and leverage upselling opportunities to further boost sales.

9. **Highest Total Sales Revenue by Branch**
   - **Result:** Branch C generated the highest revenue at $110,568.86, followed by Branch A at $106,200.57.
   - **Insight:** Focus on maintaining and boosting Branch C’s performance by understanding the factors driving its success.

**Summary of Product Analysis:** 
"Food and beverages" and "Electronic accessories" are key drivers of revenue and sales volume. High-value transactions in "Home and lifestyle" and "Sports and travel" indicate potential for premium marketing. Regional preferences and seasonal variations emphasize the need for tailored strategies and strategic inventory management. Members demonstrate higher spending in specific categories, highlighting opportunities for targeted engagement through loyalty programs.

---

### **Sales Analysis Insights**

1. **Top-Performing Branch**
   - **Result:** Branch C led with $110,568.86 in total sales revenue, followed closely by Branch A and Branch B.
   - **Insight:** Branch C's strong performance could be due to its profitable location or superior customer engagement. Focus resources here to maintain and boost its performance.

2. **Monthly Sales Trends**
   - **Result:** January recorded the highest sales at $116,292.11, followed by March at $109,455.74, and February at $97,219.58.
   - **Insight:** Capitalize on post-holiday and seasonal sales peaks with targeted promotions to maximize revenue during these periods.

3. **Sales Performance by Payment Method**
   - **Result:** Cash payments generated the highest revenue at $112,206.76, followed by Ewallet ($109,993.38) and Credit card ($100,767.29).
   - **Insight:** While cash remains the most preferred method, the growing popularity of Ewallets indicates a shift towards digital payments. Enhance digital payment options to capture this emerging trend.

4. **Sales by Day of the Week**
   - **Result:** Saturday is the busiest day with $56,120.86 in sales, followed by Tuesday and Thursday.
   - **Insight:** Adjust staffing and inventory management to meet higher weekend demand, particularly on Saturdays.

5. **Average Transaction Size by Branch**
   - **Result:** Branch C has the highest average transaction size at $337.10, followed by Branch B at $319.87, and Branch A at $312.35.
   - **Insight:** Branch C not only generates the most revenue but also has the highest average transaction size, indicating higher customer spending per transaction. This branch could benefit from further investment and attention.

6. **Sales Comparison by Customer Type**
   - **Result:** Members generate more sales ($164,223.81) compared to non-members ($158,743.62).
   - **Insight:** Strengthen loyalty programs to increase member spending and capitalize on their slightly higher value.

7. **Underperforming Branches**
   - **Result:** Branches B and A have total sales slightly below the average branch sales.
   - **Insight:** Additional support or strategic changes may be required to improve the performance of these branches.

**Summary of Sales Analysis:** 
Branch C is the top performer in total sales revenue and average transaction size, making it a key driver of business success. Sales trends indicate that January and Saturdays are particularly strong, suggesting opportunities for targeted promotions during these peak times. The shift towards digital payments with Ewallets highlights a changing consumer preference, while underperforming branches may need strategic improvements.

---

### **Customer Analysis Insights**

1. **Average Spend by Customer Type**
   - **Result:** Members have a higher average spend of $327.79 compared to non-members at $318.12.
   - **Insight:** Loyalty programs are effectively encouraging members to spend more. Expanding and enhancing these programs could further increase member spending.

2. **Purchase Frequency by Customer Type**
   - **Result:** Members and non-members have nearly equal purchase frequencies, with members slightly ahead at 501 purchases compared to 499 by non-members.
   - **Insight:** The close purchase frequency suggests strong engagement across both segments. Expanding loyalty initiatives could further boost member engagement and spending.

3. **Gender Distribution of Purchases**
   - **Result:** Females lead in purchase count with 501 purchases, while males made 499 purchases.
   - **Insight:** The gender distribution is nearly equal, indicating balanced engagement from both male and female customers. Marketing strategies should be balanced to appeal to both genders.

4. **Revenue Contribution by Customer Type**
   - **Result:** Members contribute slightly more to revenue with $164,223.81 compared to $158,743.62 from non-members.
   - **Insight:** Members contribute more to overall revenue, underscoring the importance of fostering membership programs. Investments in member-specific promotions could enhance this further.

5. **Sales by Time of Day**
   - **Result:** Evening sales are the highest at $142,846.60, followed by the afternoon at $118,321.83, with the morning being the lowest at $61,799.00.
   - **Insight:** The evening is the peak time for sales, likely due to customers shopping after work. Aligning promotions and staffing with these peak periods can maximize sales opportunities.

**Summary of Customer Analysis:** 
Members are slightly more valuable in terms of spending and revenue contribution, though non-members remain an important segment. The gender distribution is balanced, suggesting that marketing efforts can be effectively targeted to both males and females. Sales trends throughout the day show evenings as the busiest time, presenting a strategic opportunity for promotions and staffing.

---

### **Profitability Analysis Insights**

1. **Most Profitable Product Lines**
   - **Result:** "Home and lifestyle" has the highest profitability percentage at 5.000092%, closely followed by "Electronic accessories."
   - **Insight:** These lines should be prioritized for maintaining strong margins and profitability.

2. **Most Profitable Branch**
   - **Result:** Branch C is the most profitable, generating $5,265.33 in profit.
   - **Insight:** Branch C's efficiency or management strategies should be analyzed and potentially replicated across other branches to enhance overall profitability.

3. **Profit Margins by Product Line**
   - **Result:** "Food and beverages" has the highest gross profit at $2,673.68, followed by "Sports and travel" at $2,625.07.
   - **Insight:** These lines not only generate high revenue but also deliver strong profits, making them critical for the business's success.

4. **Profitability by Customer Type**
   - **Result:** Members are more profitable, generating $7,820.53 compared to $7,559.52 from non-members.
   - **Insight:** Members contribute slightly more to profits, reaffirming the importance of loyalty programs. Encouraging more customers to become members could further increase overall profitability.

5. **Gross Margin by Product Line**
   - **Result:**

 "Sports and travel" has the highest gross margin percentage at 4.762205%.
   - **Insight:** This product line offers the best margin on sales, highlighting its importance for driving overall profitability.

6. **Profitability by Payment Method**
   - **Result:** Ewallets show the highest profit margin of 5.000261%, followed closely by Credit card and Cash.
   - **Insight:** Ewallets slightly outperform other payment methods, suggesting a focus on promoting digital payments could improve overall profitability.

7. **Seasonal Profitability**
   - **Result:** January is the most profitable month, generating $5,537.95, followed by March at $5,212.40.
   - **Insight:** Leverage post-holiday spending trends for increased profitability during these periods.

8. **Customer Satisfaction by Product Line**
   - **Result:** "Food and beverages" has the highest average rating at 7.11, indicating strong customer satisfaction.
   - **Insight:** High customer satisfaction in this category can be leveraged in marketing campaigns to attract more customers.

**Summary of Profitability Analysis:** 
"Home and lifestyle" and "Food and beverages" stand out as top performers in terms of profitability, gross margin, and customer satisfaction. Branch C is the most profitable location, with strategies that could be replicated across other branches. Ewallets and seasonal trends suggest potential areas for increased profitability through focused efforts on digital payments and post-holiday promotions.

---

This refined report provides a comprehensive overview of the key insights and recommendations based on the analysis of Walmart's sales data, structured to deliver clear and actionable information to decision-makers.
