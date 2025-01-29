SELECT
    OS.StoreID,
    SUM(OFACT.revenue) as ActualSales,
    SUM(ST.SalesTarget) AS TargetSales
FROM
	{{ ref('orders_stg') }} as OS
join 
    {{ ref('orders_fact') }} as OFACT
on 
    OS.orderID = OFACT.orderID

join 
    {{ ref('salestargets') }} as ST
on 
    OS.StoreID = ST.StoreID
GROUP BY
    1