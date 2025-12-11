SELECT brand,
    model,
    condition,
    price
FROM cars
WHERE price < 250000
    OR brand = 'Porsche' --as the question is asking that color contains red  
    ---here we are selecting the car whose condition is greater than or equal to 3 and it was manufactured before 1970