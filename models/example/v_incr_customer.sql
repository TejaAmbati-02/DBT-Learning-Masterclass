{{ config(materialized = 'incremental') }}

select CUSTOMER_SK, 
    CUSTOMER_CODE, 
    FIRST_NAME, 
    LAST_NAME, 
    GENDER, 
    EMAIL, 
    PHONE, 
    LOYALTY_TIER, 
    SIGNUP_DATE,
    current_timestamp() AS updated_add 
FROM DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER

{% if is_incremental() %}
where updated_at >= (select max(updated_at) FROM {{ this }})
{% endif %}