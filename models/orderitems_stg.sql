select 
    md5(OrderID || orderItemID) as s_key,
	orderItemID,
    OrderID,
    productID,
    Quantity,
    unitPrice,
    Quantity * unitPrice AS totalPrice,
    updated_at
FROM
	  {{ source('landing','ordritms') }}