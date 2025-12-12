SELECT brand , count(brand), FLOOR(AVG(price)) AS "AVG" FROM cars   ---so here we are selecting the brand, and counting the number of brands and then the average price of each brands
WHERE sold IS FALSE
GROUP BY brand
