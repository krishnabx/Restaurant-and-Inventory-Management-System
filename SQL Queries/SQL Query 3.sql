/*TOP 3 POPULAR DISHES*/

SELECT C.DISHID, D.NAME, COUNT(C.DISHID) AS COUNT_OF_DISH
FROM RESTAURANT.CONSIST_OF AS C, RESTAURANT.DISHES AS D
WHERE D.DISHID = C.DISHID			
GROUP BY DISHID
ORDER BY COUNT(DISHID) DESC
LIMIT 3;