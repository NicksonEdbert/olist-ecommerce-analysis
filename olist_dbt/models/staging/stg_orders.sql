-- olist_dbt/models/staging/stg_orders.sql

-- This model cleans the raw orders data.
-- 1. Selects all columns from the raw orders table.
-- 2. Casts all date-related columns to a timestamp data type for consistency and to enable time-based analysis.

SELECT
    order_id,
    customer_id,
    order_status,
    CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_timestamp,
    CAST(order_approved_at AS TIMESTAMP) AS order_approved_at,
    CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_date,
    CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_date,
    CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_date
FROM
    {{ source('raw_data', 'orders') }}
