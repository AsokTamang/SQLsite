/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT brand,
    model,
    color
FROM cars
WHERE color NOT IN ('blue','white','red')
    AND brand NOT IN ('Aston Martin', 'Bentley', 'Jaguar')
    AND sold is false;