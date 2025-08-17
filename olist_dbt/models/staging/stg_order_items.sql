-- olist_dbt/models/staging/stg_order_items.sql

-- This model simply selects all columns from the raw order_items data.
-- No cleaning was identified as necessary for this table in the initial analysis.

SELECT
    *
FROM
    {{ source('raw_data', 'order_items') }}
