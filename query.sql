SELECT brand,
    model,
    condition,
    price,
    year
FROM cars
WHERE condition >=3   ---here we are selecting the car whose condition is greater than or equal to 3 and it was manufactured before 1970
AND year < 1970  