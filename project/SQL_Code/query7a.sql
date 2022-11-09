/*Customer Results*/
USE Hotel_Official;
GO
/*All Services?? */
SELECT a.DescriptionSer
FROM TheServices AS a
ORDER BY a.DescriptionSer;

/*Όλες οι υπηρεσίες μπορούν να τυπωθούν σε δύο πίνακες, έναν για αυτές που απαιτούν εγγραφή και την τιμή και έναν για αυτές που δεν απαιτούν*/
SELECT h.Service_ID, p.DescriptionSer, g.Amount
FROM TheServices AS p, RequiresSub AS h, GetsCharged AS g
WHERE p.Service_ID = h.Service_ID
AND h.Service_ID = g.Service_ID
ORDER BY p.DescriptionSer;

SELECT h.Service_ID, p.DescriptionSer
FROM TheServices AS p, NotRequiresSub AS h
WHERE p.Service_ID = h.Service_ID
ORDER BY p.DescriptionSer;


 
