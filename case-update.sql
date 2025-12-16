UPDATE cars
SET price = CASE
        WHEN model = 'DB5' THEN price + ((0.15) * price)
        WHEN model LIKE 'DB_' THEN price + ((0.10) * price)
        ELSE price + ((0.05) * price)
    END
WHERE sold IS FALSE
    AND brand = 'Aston Martin';