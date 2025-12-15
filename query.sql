SELECT name,role,sold_price FROM  staff S INNER JOIN sold_cars SC 
ON S.id = SC.seller;  --here we are finding the list of staffs who have sold cars till date