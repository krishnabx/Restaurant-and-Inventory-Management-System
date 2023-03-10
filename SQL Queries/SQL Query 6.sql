SELECT T.DISHID, T.COUNT, D.PRICE AS DISH_PRICE, D.PRICE*T.COUNT AS TOTAL_PRICE_DISH, T.TOTAL_PRICE_INGREDIENTS, (D.PRICE*T.COUNT) - T.TOTAL_PRICE_INGREDIENTS AS TOTAL_PROFIT_LOSS
FROM(SELECT T.DISHID, T.COUNT, SUM(I.PRICE*T.COUNT) AS TOTAL_PRICE_INGREDIENTS
		FROM (SELECT DISHID, COUNT(DISHID) AS COUNT
				FROM RESTAURANT.CONSIST_OF
				GROUP BY DISHID) AS T
		INNER JOIN RESTAURANT.MAKES_USE AS M
			ON M.DISHID = T.DISHID
		INNER JOIN RESTAURANT.INGREDIENTS AS I
			ON I.ID = M.ID
		GROUP BY T.DISHID) AS T,
RESTAURANT.DISHES AS D
WHERE D.DISHID = T.DISHID;