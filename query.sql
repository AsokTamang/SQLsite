SELECT name,role,D.city FROM sold_cars SC RIGHT JOIN staff S ON seller=S.id LEFT JOIN dealerships D ON dealership_id=D.id
WHERE 
SC.id is NULL AND S.role='Salesperson';

--here we are selecting the name and role of a staff who is a salesperson and who might be or not be in the dealership but hasnot sold any cars till now, so
--thats why in the where clause the sold_cars id here must be null