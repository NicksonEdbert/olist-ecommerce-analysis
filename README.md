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