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
    );
--we must only include the cars which are in the dealerships
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
SELECT brand,
    model,
    city,
    price
FROM cars
    JOIN dealerships D ON dealership_id = D.id
where price > ALL(
        SELECT sold_price
        from sold_cars
    )
ORDER BY city;
--here we are selecting the cars which are in dealerships and they are expensive than the cars that had been sold
SELECT city,
    state,
    TO_CHAR(established, 'YYYY-MM-DD') AS 'est'
FROM dealerships
WHERE NOT EXISTS (
        SELECT 1
        FROM cars
        WHERE dealership_id = dealerships.id
    );
--here we are selecting the cars whose deals have already been made but these cars are not in our stock
SELECT city,
    state
FROM dealerships
WHERE EXISTS (
        SELECT price
        FROM cars
        WHERE dealership_id = dealerships.id
            AND price > 50000
    );
--here we are checking if the cars existing in dealerships, costing more than 50000 are available in our stock or not
SELECT name,
    role
FROM staff
WHERE staff.role = 'Salesperson'
    AND NOT EXISTS (
        SELECT 1
        FROM sold_cars
        WHERE seller = staff.id
            AND sold_price > 45000
    );  --HERE WE ARE CHECKING THE SALESPERSON WHO HAVENOT SOLD SINGLE CAR ABOVE PRICE 45000