# Exploratory Data Analysis of Olist E-Commerce Orders

An end-to-end data analysis project on the Brazilian Olist e-commerce dataset. This project demonstrates a professional, modular workflow for data cleaning, feature engineering, and exploratory analysis.

## Project Objective
The goal is to analyze the Olist dataset to derive insights into order fulfillment, delivery performance, and overall operational efficiency. This serves as a portfolio piece to showcase practical data analysis skills.

## Key Skills Demonstrated
*   **Data Cleaning & Preparation:** Handling missing values, correcting data types, and ensuring data integrity.
*   **Feature Engineering:** Creating new, insightful columns from existing data (e.g., `delivery_time_days`, `delivery_performance`).
*   **Exploratory Data Analysis (EDA):** Using statistics and visualizations to uncover patterns and answer business questions.
*   **Data Visualization:** Creating clear and informative plots with Matplotlib and Seaborn.
*   **Modular Project Structure:** Separating data preparation logic from analysis for a clean, reproducible, and scalable workflow.
*   **Version Control & Documentation:** Using Git/GitHub for version control and maintaining clear documentation in a README.

## Progress Log

* **August 3, 2025**
    * Discussed and implemented the `.dropna()` method to handle missing values in the `products` table.
    * Clarified the workflow difference between "profiling for discovery" (in the lab) and "profiling for verification" (after cleaning).
    * Established a "session log" to track progress and create a motivational feedback loop.
    * Create the reusable cleaning function for the Products table.
    * Learn how to import functions from folders properly, how to use `if __name__ == '__main__'`, and how to use parquet.
    * Created run_cleaning_pipeline.py to streamline the data cleaning pipeline.

* **August 4, 2025**
    * Created the order items notebook and found that no cleaning is needed for the order items table.
    * Created `clean_order_items.py` to save the csv file to parquet and also as a validation that the data has been checked.

* **August 5, 2025**
    * Added the order items processing script to the data cleaning pipeline and now we have the parquet files for both order items and products.
    * Began the "Gold" analysis phase by answering the business question: "What are the top 5 best-selling product categories by revenue?"
    * Learned how to merge data, group it, and sort it in pandas to get the final answer.
    * Saved the analysis-ready data to a CSV file and connected it to Tableau to create a visual bar chart of the results.

* **August 6, 2025**
    * Added a function to fill missing date values with Nat(Not a time).

* **August 7, 2025**
    * Completed the "Lab" and "Factory" phases for the `orders` table.
    * Implemented logic to correctly parse all date columns, ensuring data integrity.
    * Integrated the `orders` cleaning script into the main pipeline, creating a three-stage data processing workflow.

* **August 9, 2025**
    * Began a new time-series analysis to track the sales of the top 5 product categories.
    * Enriched the analysis dataset by merging the orders table to include purchase dates.
    * Created a new, filtered DataFrame containing only data for the top 5 categories.

* **August 15, 2025**
    * Created KPI worksheets in Tableau for "Total Revenue" and "Total Orders." 
    * Built a new line chart visualization to show the trend of sales revenue over time. 
    * Assembled the first version of the "Sales Performance Dashboard" by combining the KPI cards and key visualizations. 
    * Added interactivity to the dashboard, allowing it to be filtered by date. 
    * [![View on Tableau Public](https://img.shields.io/badge/Tableau-View_Dashboard-E97627?logo=tableau)](https://public.tableau.com/views/SalesPerformanceDashboard_17552803012150/SalesPerformanceDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

* **August 16, 2025**
    * Migrated the data cleaning pipeline to dbt and DuckDB.
    * Initialized the dbt project, seeded raw data, and built staging & marts models.
    * Added dbt `sources` to formally declare raw data tables.
    * Implemented `unique` and `not_null` tests on source primary keys to ensure data quality.
    * Configured the marts model to materialize as a `table` for better query performance.
    * Generated and explored the dbt documentation site, including the project's lineage graph.
    * Began RFM (Recency, Frequency, Monetary) analysis to segment customers.
    * Profiled new `customers` and `payments` data to check for duplicates and nulls.
    * Seeded new raw data and added corresponding staging models.
    * Added data quality tests to the new source tables to automate profiling checks.
    * Built the final `mart_rfm` model to calculate Recency, Frequency, and Monetary values for each customer.

* **August 17, 2025**
    * Corrected `DATE_DIFF` syntax for DuckDB in the `mart_rfm` model.
    * Materialized the `mart_rfm` model as a table for improved query performance.
    * Successfully ran the complete RFM pipeline.

* **August 18, 2025**
    * Began the final analysis phase of the RFM project: customer segmentation.
    * Set up a new notebook for RFM segmentation.
    * Load the `mart_rfm` data from DuckDB into pandas.
    * Score customers on Recency, Frequency, and Monetary values using quantiles.
    * Map the RFM scores to descriptive segments (e.g., 'Best Customers', 'At Risk').
    * Explore the characteristics of each customer segment.

* **August 20, 2025**
    * Completed the RFM analysis by creating visualizations and a summary table for each customer segment.

* **August 23, 2025**
    * Reviewed and interpreted the final RFM analysis visualizations.
    * Corrected the customer count visualization by implementing a logarithmic scale to properly display all customer segments, including the smaller, high-value ones.
    * **Next Session:** Formulate actionable business recommendations for each customer segment.

* **August 24, 2025**
    * Began formulating actionable business recommendations for each customer segment based on the RFM analysis.
    * **Today's Goals:**
        * [x] Interpret the "Best Customers" segment and define a retention strategy.
        * [x] Interpret the "At Risk" and "Needs Attention" segments and define a win-back strategy.
        * [x] Interpret the "Potential Loyalists" and "New Customers" segments and define a nurturing strategy.
        * [x] Create a summary of recommendations.
