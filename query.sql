/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT brand,
    model,
    color,
    price
FROM cars
WHERE color LIKE '%red%' AND sold is FALSE   --the customer wants with any shade of color red in car
ORDER BY price
LIMIT 5;  --here we are limiting the output upto quantity 5
