SELECT name,
    role,
    sold_price
FROM staff S
    FULL JOIN sold_cars SC ON SC.seller = S.id