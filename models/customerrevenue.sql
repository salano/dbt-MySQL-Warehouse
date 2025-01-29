SELECT
    OS.CustomerID,
    CustomerName,
    SUM(OS.OrderCount) as OrderCount,
    SUM(OS.Revenue) AS Revenue
FROM
	{{ ref('orders_fact') }} as OS
join 
    {{ ref('customers_stg') }} as C 
on 
    OS.CustomerID = C.CustomerID
GROUP BY
    OS.CustomerID,
    CustomerName