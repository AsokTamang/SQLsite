SELECT name,role,SUM(sold_price) AS total_sales FROM staff S INNER JOIN sold_cars SC ON S.id = seller --here we are only selecting the staffs who are the seller in the table sold_cars
WHERE S.role='Salesperson'
GROUP BY name,role
ORDER BY total_sales DESC;
 