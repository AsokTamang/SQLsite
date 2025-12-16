
---dealerships and cars then comes the table sold_cars
SELECT D.city,D.state,COUNT(SC.id) AS cars_sold FROM dealerships D LEFT JOIN cars C ON C.dealership_id=D.id LEFT JOIN sold_cars SC ON cars_id=C.id 
GROUP BY D.city,D.state
ORDER BY cars_sold  DESC;  --here we are  including the cars which might or mightnot be in the dealerships and also including the sold cars which might or mightnot be in the dealerships