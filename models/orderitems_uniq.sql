{{ config(MATERIALIZED='table') }}

{{ dbt_utils.deduplicate(
    relation=source('landing', 'ordritms'),
    partition_by='OrderID',
    order_by="updated_at desc",
   )
}}