/*
 Search for columns: brand, model, color, year, price, sold
 from the table cars
 where the color is a shade of red
 or the year is between 1960 and 1969
 and sold is false
 */
SELECT brand,
    model,
    price,
    sold
FROM cars
WHERE (
        brand NOT IN ('Ford', 'Triumph', 'Chevrolet', 'Dodge') ---the customer doesnot want an american brand
        OR price < 50000
    )
    AND sold is false;