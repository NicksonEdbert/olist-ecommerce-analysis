-- olist_dbt/models/marts/mart_product_revenue.sql

{{
    config(
        materialized='table'
    )
}}

-- This model calculates the total revenue for each product category.
-- It joins the staging tables for order_items and products.

WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),
products AS (
    SELECT * FROM {{ ref('stg_products') }}
)

SELECT
    p.product_category_name,
    SUM(oi.price) AS total_revenue
FROM
    order_items oi
JOIN
    products p ON oi.product_id = p.product_id
GROUP BY
    p.product_category_name
ORDER BY
    total_revenue DESC
