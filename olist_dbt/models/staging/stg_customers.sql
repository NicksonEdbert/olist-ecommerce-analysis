-- olist_dbt/models/staging/stg_customers.sql

SELECT
    *
FROM
    {{ source('raw_data', 'customers') }}
