-- olist_dbt/models/staging/stg_products.sql

-- This model cleans the raw products data.
-- 1. Selects all columns from the raw products table.
-- 2. Filters out rows where product_category_name is null, as these are not useful for analysis.

SELECT
    *
FROM
    {{ ref('products') }}
WHERE
    product_category_name IS NOT NULL
