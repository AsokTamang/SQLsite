SELECT brand,
    model,
    color,
    year
FROM cars
WHERE model Like 'DB_'  --here LIKE DB_ means the cars having DB word at the start followed by onle one character in their model will be retrieved--


