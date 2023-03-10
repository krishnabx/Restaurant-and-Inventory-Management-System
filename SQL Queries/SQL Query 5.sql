SELECT T.DISHID, D.NAME, COUNT(*) AS ORDER_COUNT
FROM (SELECT T.ORDERID, T.FOODRATING, C.DISHID
		FROM (SELECT ORDERID, FOODRATING
				FROM RESTAURANT.FEEDBACK
                WHERE FOODRATING > 7) AS T,
		RESTAURANT.CONSIST_OF AS C
        WHERE C.ORDERID = T.ORDERID) AS T,
RESTAURANT.DISHES AS D
WHERE D.DISHID = T.DISHID
GROUP BY T.DISHID
ORDER BY ORDER_COUNT DESC
LIMIT 5;