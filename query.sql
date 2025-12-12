SELECT CEIL(AVG(price)) as avg,
 MIN(price), MAX(price) FROM cars
WHERE sold is TRUE