/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT brand,
    model,
    year,
    sold
FROM cars
WHERE ((brand='Dodge' AND (year BETWEEN 1960 AND 1969)) OR (brand in ('Ford','Triumph') AND (year BETWEEN 1970 AND 1979))) AND (sold IS FALSE)