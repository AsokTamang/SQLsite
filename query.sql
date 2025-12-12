SELECT year,COUNT(year) AS car_count,MAX(price),MIN(price) FROM cars ---here count(year) counts the number of cars from this specific year
WHERE sold IS TRUE
GROUP BY year
HAVING COUNT(sold=TRUE) > 1
ORDER BY car_count