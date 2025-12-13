UPDATE cars
SET condition = 1,
    price = 10000
WHERE brand = 'Porsche'
    AND sold is FALSE