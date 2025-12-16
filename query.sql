SELECT city,state,COUNT(*) AS car_count FROM cars RIGHT JOIN dealerships D ON dealership_id=D.id  --here we are counting all the cars which are in the dealerships but they are also unsold
WHERE sold is NOT TRUE
GROUP BY city,state
ORDER BY car_count;