-- olist_dbt/models/marts/mart_rfm.sql

{{
    config(
        materialized='table'
    )
}}

-- This model calculates Recency, Frequency, and Monetary (RFM) metrics for each customer.

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
),
customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

-- First, calculate the total payment value for each order.
order_payments AS (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value
    FROM payments
    GROUP BY order_id
),

-- Join all the tables together to get a single view of each customer's orders.
customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_id,
        o.order_purchase_timestamp,
        op.total_payment_value
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_payments op ON o.order_id = op.order_id
    WHERE o.order_status = 'delivered' -- Only consider completed orders for RFM
),

-- Find the most recent purchase date in the entire dataset to calculate recency from.
latest_purchase AS (
    SELECT MAX(order_purchase_timestamp) AS latest_purchase_date
    FROM customer_orders
),

-- Final RFM calculations for each customer.
final AS (
    SELECT
        co.customer_unique_id,
        
        -- Recency: Days since the last purchase from the latest purchase date in the data.
        date_diff('day', MAX(co.order_purchase_timestamp), lp.latest_purchase_date) AS recency,
        
        -- Frequency: Total number of orders.
        COUNT(DISTINCT co.order_id) AS frequency,
        
        -- Monetary: Total value of all purchases.
        SUM(co.total_payment_value) AS monetary
        
    FROM customer_orders co
    CROSS JOIN latest_purchase lp -- Use a CROSS JOIN to have the latest_purchase_date available on every row.
    GROUP BY 1, lp.latest_purchase_date
)

SELECT * FROM final
