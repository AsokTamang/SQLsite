SELECT brand,model,price FROM cars 
WHERE brand='Volkswagen' AND price < ANY (
    select price from cars WHERE brand='Ford'
) ---here we are selecting the brand,model and price of cars having brand Volkswagen and whose price is cheaper than any of the price of brand Ford