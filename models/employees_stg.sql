select 
	EmployeeID,
	FirstName,
	LastName,
	Email,
	JobTitle,
	HireDate,
	ManagerID,
	Address,
	City,
	State,
	ZipCode,
	Updated_at,
     CONCAT(FirstName, ' ', LastName) AS EmployeeName
 from
		L1_LANDING.EMPLOYEES