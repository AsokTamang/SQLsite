SELECT name,role,city,state FROM staff S LEFT JOIN dealerships D
ON S.dealership_id=D.id   --here we are retrieving all the staffs both dealer as well as non-dealer