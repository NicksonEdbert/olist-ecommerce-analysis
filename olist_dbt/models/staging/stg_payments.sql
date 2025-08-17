-- olist_dbt/models/staging/stg_payments.sql

SELECT
    *
FROM
    {{ source('raw_data', 'payments') }}
