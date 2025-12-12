/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT brand,
    model,
    condition,
    price
FROM cars
ORDER BY condition DESC,
    price ---here we are retrieveing the table order first by the condition in descending order then the price in ascending order