select 
	orderItemID,
    OrderID,
    productID,
    Quantity,
    unitPrice,
    Quantity * unitPrice AS totalPrice,
    updated_at
FROM
	  {{ source('landing','ordritms') }}