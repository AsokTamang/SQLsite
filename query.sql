--salesperson , totalsales
SELECT S.name,SC.sold_price from staff S INNER JOIN sold_cars SC ON seller=S.id
WHERE sold_price > ANY (
    SELECT SUM(sold_price) from sold_cars GROUP BY seller)