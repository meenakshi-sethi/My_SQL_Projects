## 📚 Data Validation and Quality Checks

Before beginning the business analysis, the Netflix dataset was validated for correctness and completeness using industry-standard SQL validation techniques:

| Validation Type | Description | Why It Matters |
|:----------------|:-------------|:---------------|
| ✅ Row Count Validation | Verified the number of records matches the expected count. | Ensures no records were missed or duplicated during insertion. |
| ✅ NULL Checks | Checked for unexpected NULL values in critical columns like `type`, `title`, and `show_id`. | Detects incomplete or corrupt data. |
| ✅ Distinct Value Checks | Verified the unique values in categorical columns such as `type` and `rating`. | Helps identify typos, unexpected categories, or data issues. |
| ✅ Data Distribution Validation | Confirmed the distribution of movies vs TV shows, and rating counts. | Ensures realistic and expected data proportions. |
| ✅ Data Type and Range Checks | Checked the minimum and maximum `release_year` values. | Detects invalid dates (e.g., movies with future release dates). |
| ✅ Pattern/Integrity Checks | Ensured that key fields like `show_id` were non-empty and valid. | Maintains referential and entity integrity. |
| ✅ Sample Record Checks | Randomly inspected sample records for data sanity. | Manual verification for quick anomaly detection. |

These checks helped guarantee that the data loaded into MySQL was ready for reliable and meaningful business insights.

**[SQL Data Validation Script](https://github.com/meenakshi-sethi/My_SQL_Projects/blob/main/Netflix_Data_Analysis_Adv_SQL/netlfix_data_validation.sql)**
