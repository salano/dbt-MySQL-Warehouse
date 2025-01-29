
{{ config(MATERIALIZED='incremental', unique_key='ORDERID') }}

select 
	orderID,
    orderDate,
    CustomerID,
    employeeID,
    storeID,
    status as statusCD,
    case 
		when status = '01' then 'In Progress'
        when status = '02' then 'Completed'
        when status = '03' then 'Cancelled'
		else null 
	end as statusDesc,
    updated_at,
    current_timestamp as dbt_updated_at
FROM
	  {{ source('landing','ordr') }}



{% if is_incremental() %}
    where Updated_at >= (SELECT MAX(dbt_updated_at) from {{ this}} )
{% endif %}
