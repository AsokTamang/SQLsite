SELECT year,COUNT(year) AS car_count,MAX(price),MIN(price) FROM cars ---here count(year) counts the number of cars from this specific year
WHERE sold IS TRUE
GROUP BY year
HAVING COUNT(sold=TRUE) > 1 --and the number of cars sold in the current specific year must be greater than 1
ORDER BY car_count   --here order by car_count orders the result based on the count of cars in this specific year