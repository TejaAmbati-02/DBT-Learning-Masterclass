{{ config(materialized = 'incremental') }}

select * FROM DBT_TUTORIAL.DBT_SRC_FILES_DATA.DIM_CUSTOMER

{% if is_incremental() %}
where updated_at >= (select max(updated_at) FROM {{ this }})
{% endif %}