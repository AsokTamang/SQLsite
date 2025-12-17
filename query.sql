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
    )
    AND EXISTS(
        SELECT 1
        FROM sold_cars
        WHERE seller = staff.id
    );
--HERE WE ARE CHECKING THE SALESPERSON WHO HAVENOT SOLD SINGLE CAR ABOVE PRICE 45000
--so the syntax for using the CASE method is that we must use case with when then and then we must end the case then we can use from table
SELECT S.name,
    S.role,
    S.dealership_id,
    SUM(SC.sold_price) AS total_sales,
    CASE
        WHEN SUM(SC.sold_price) > 100000 THEN 10000
        WHEN SUM(SC.sold_price) > 75000 THEN 5000
        ELSE 1000
    END AS bonus --we must end the case
FROM staff S
    LEFT JOIN sold_cars SC ON seller = S.id --even though the staff who hasnot sold any cars
GROUP BY S.name,
    S.role,
    S.dealership_id
ORDER BY bonus,
    S.dealership_id;
SELECT brand,
    model,
    condition,
    year,
    price
WHERE sold IS FALSE
    AND CASE
        WHEN year <= 1960 THEN condition >= 4
        WHEN year <= 1970 THEN condition >= 3
        WHEN year <= 1980 THEN condition >= 2
        WHEN year <= 1990 THEN condition >= 1
        ELSE TRUE
    END
FROM cars --here the car's id must not match with the id inside the sold_cars table
ORDER BY year,
    condition;
SELECT brand,
    model,
    condition,
    price
FROM cars --here the customer is negotiating with the price based on the condition of cars
WHERE sold IS FALSE
    AND CASE
        (
            WHEN condition >= 4 THEN price < 100000
            WHEN condition >= 3 THEN price < 50000
            WHEN condition >= 1 THEN price < 20000
            ELSE TRUE
        )
    END
ORDER BY condition;


SELECT COUNT(*) AS total_sales,
    --HERE WE ARE COUNTING THE NUMBER OF CARS THAT HAVE BEEN SOLD IN EACH QUARTERS
    CASE
        WHEN EXTRACT(
            MONTH
            FROM sold_date
        ) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN EXTRACT(
            MONTH
            FROM sold_date
        ) BETWEEN 3 AND 6 THEN 'Q2'
        WHEN EXTRACT(
            MONTH
            FROM sold_date
        ) BETWEEN 6 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS quarter
FROM sold_cars
GROUP BY quarter
ORDER BY quarter;