# 📚 Netflix Content Analysis Project (SQL + Business Insights)

---

## 🎯 Business Understanding

Netflix must continually analyze its content portfolio to optimize viewer engagement, regional expansion and content strategy. Understanding trends in type, genre, country contributions, release patterns and content ratings is critical to drive data-driven business decisions.

---

## 📄 Project Overview

This project explores Netflix’s content dataset to extract actionable business insights.  
Using advanced SQL techniques, we solve 25 real-world business questions related to:

- Content Trends (Movies vs TV Shows)
- Genre Popularity
- Country-Wise Content Analysis
- Director Contributions
- Content Duration Trends
- Yearly Content Growth

The goal is to apply a structured business analytics approach while mastering SQL querying, data cleaning, pivoting/unpivoting and business problem framing.

---

## ✨ Personal Motivation for the Project

As a regular Netflix viewer and someone who personally enjoys exploring a wide range of TV shows and movies, I have always been curious about the vastness of Netflix’s content library.  
Questions like — *"How many movies or TV shows are available?"* and *"Which genres dominate Netflix's portfolio?"* — sparked my interest.

While this project analyzes content metadata, I would love to extend it further in the future by incorporating viewership or subscription datasets if available.  
This project reflects both technical practice and genuine curiosity about media analytics.

---

## 🗂 Dataset Overview

- **Source:** Public Netflix Titles Dataset (Kaggle, public sources)
- **Records:** 8807 entries after cleaning
- **Fields:**
  - `show_id`
  - `type` (Movie / TV Show)
  - `title`
  - `director`
  - `cast`
  - `country`
  - `date_added`
  - `release_year`
  - `rating`
  - `duration`
  - `listed_in` (Genres)
  - `description`
- **Link** [Netflix_Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)
---

## 🛠 Tools and Technologies

| Tool | Purpose |
|:-----|:--------|
| MySQL 8.0 | Data storage, SQL Query Execution |
| MySQL Workbench | Query development and testing |
| Python (pandas + mysql-connector) | Data import workaround |
| VSCode / Notepad++ | Documentation and organization |

---

## 🧹 Data Cleaning and Preprocessing

✅ **Issues Identified:**
- Wrong values like '74 min', '84 min' found incorrectly in the `rating` column (should be in `duration`)
- NULL values in columns like `director`, `cast`, `country`
- Inconsistent date formats in `date_added`

✅ **Cleaning Actions Taken:**
- Moved incorrect `rating` values (e.g., "74 min") to `duration` using SQL update statements
- Standardized missing values: NULLs handled appropriately
- Retained `date_added` as string format for analysis without altering original data
- Validated distinct values for critical columns like `type`, `rating`, `listed_in`

✅ **Python Used for Data Import:**
Due to **limitations with MySQL Workbench's native import wizard** (restricted to 100 rows),  
a **custom Python script** was written using **pandas** and **mysql-connector-python** to insert all 8807 records into the MySQL `netflix` table successfully.

---

## 🔄 Pivoting and Unpivoting

✅ In this project, pivoting and unpivoting techniques were used to:

- **Unpivot** multi-value fields like `listed_in` (Genres) and `cast` into individual rows
- **Pivot** grouped aggregates such as counts of Movies vs TV Shows by year or genre

✅ Purpose:

- Transform semi-structured data into analyzable relational format
- Enable deeper analysis such as genre distribution, actor appearances, etc.
- Demonstrate advanced SQL data transformation skills

---

## 🏆 Key Deliverables

- ✅ Solved 25 curated real-world business questions
- ✅ Provided Business Objective, SQL Query, and Insight for each question
- ✅ Applied CTEs, Window Functions, Subqueries wherever applicable
- ✅ Demonstrated Pivoting and Unpivoting of complex fields
- ✅ Performed Date Handling and Duration Analysis
- ✅ Conducted Genre, Country, and Director Analysis
- ✅ Summarized strategic findings based on results

---

## 🧠 Learning Goals

- How SQL is used for real-world business problem solving
- How to think like a business analyst: tying queries back to business objectives
- When and why to use CTEs vs Subqueries vs Window Functions
- How to perform Pivoting and Unpivoting in SQL
- How to derive actionable insights from dataset

---

## 🚀 Future Expansion (Planned)

- Create a Tableau dashboard showcasing the Netflix content trends visually
- If more granular datasets become available (e.g., viewership hours, subscriber growth), extend analysis to predictive modeling

---

## 📜 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

