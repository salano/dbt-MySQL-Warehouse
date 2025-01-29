select 
	O.orderID,
    O.orderDate,
    O.CustomerID,
    O.employeeID,
    O.storeID,
    O.statusCD,
    O.statusDesc,
   COUNT(distinct O.orderID) as OrderCount,
   SUM(OI.totalPrice) as Revenue
FROM
	{{ ref('orders_stg') }} as O
join 
    {{ ref('orderitems_stg') }} as OI 
on 
    O.orderID = OI.orderID
GROUP BY
    O.orderID,
    O.orderDate,
    O.CustomerID,
    O.employeeID,
    O.storeID,
    O.statusCD,
    O.statusDesc