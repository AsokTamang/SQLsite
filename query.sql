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
    year
FROM cars
WHERE year IN (1961, 1963, 1965, 1967, 1969)
    AND condition >= 3
    AND sold is false;