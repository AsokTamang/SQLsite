/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT sum(price) as total_earnings FROM cars
WHERE sold is TRUE  --here we are using sum on price for determing the total earnings of the sold cars