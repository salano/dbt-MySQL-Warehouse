SELECT
    orderID
FROM
     {{ ref('orders_fact') }}
where 
    Revenue < 0