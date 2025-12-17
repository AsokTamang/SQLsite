UPDATE cars
SET price = CASE
        WHEN model = 'DB5' THEN price + ((0.15) * price)
        WHEN model LIKE 'DB_' THEN price + ((0.10) * price)
        ELSE price + ((0.05) * price)
    END
WHERE sold IS FALSE
    AND brand = 'Aston Martin';


UPDATE cars 
SET price = CASE
WHEN state = 'Chicago' THEN price+0.2*price
WHEN state = 'Detroit' THEN price- 0.2*price
ELSE price  --if the states are not chicago and detroit then the price remains same
END
WHERE sold IS FALSE AND dealership_id IS NOT NULL;
