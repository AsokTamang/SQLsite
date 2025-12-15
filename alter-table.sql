ALTER TABLE cars
ADD COLUMN dealership_id INTEGER;

UPDATE cars 
SET dealership_id=1
WHERE dealership_id IS NULL;