{{ config(materialized = 'view') }}

with stg_customers AS(
    SELECT
        customer_sk,
        CONCAT(first_name, ' ', last_name) as customer_name,
        email as email_address,
        phone as home_phone
    FROM DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER
)

SELECT * FROM stg_customers