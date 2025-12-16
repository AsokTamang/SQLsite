---inorder to find any cars worth more than dealerships sales
SELECT brand,
    model,
    price
FROM cars
WHERE price > ANY (
        SELECT SUM(sold_price) --we must use SUM inorder to find the total sales
        FROM sold_cars SC
            INNER JOIN cars C ON cars_id = C.id
            JOIN dealerships D ON C.dealership_id = D.id
        GROUP BY D.id --here we are grouping by the dealershipid
    ) ;--we must only include the cars which are in the dealerships

SELECT brand,
    model,
    condition,
    price
FROM cars
where price < ALL (
        SELECT price
        FROM cars
        where condition = 3
    );

SELECT brand,
    model,
    year
FROM cars
where year < ALL (
        SELECT year
        FROM cars
        WHERE brand = 'Ford'
    )
ORDER BY year;

SELECT brand,model,city,price FROM cars JOIN dealerships D ON dealership_id=D.id where price > ALL( 
    SELECT sold_price from sold_cars
)ORDER BY city;
--here we are selecting the cars which are in dealerships and they are expensive than the cars that had been sold