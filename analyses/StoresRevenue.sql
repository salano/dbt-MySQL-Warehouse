SELECT
    OS.StoreID,
    SUM(OFACT.revenue) as ActualSales,
FROM
	{{ ref('orders_stg') }} as OS
join 
    {{ ref('orders_fact') }} as OFACT
on 
    OS.orderID = OFACT.orderID
group by 
    1