/*Customer Results*/
USE Hotel_Official;
GO

DROP TABLE array_7a
DROP TABLE array_7b
DROP TABLE array_7c
DROP TABLE array_7d
DROP TABLE array_7e
DROP TABLE array_7f
DROP TABLE array_7g

/*Visits by Name of Service*/

SELECT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction into array_7a
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d
WHERE a.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID
AND c.Area_ID = d.Area_ID
AND a.DescriptionSer =  'Restaurant' --input01
ORDER BY a.DescriptionSer;

/*Visits by Date*/

SELECT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction into array_7b
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d
WHERE a.Service_ID = b.Service_ID 
AND b.Area_ID = c.Area_ID
AND c.Area_ID = d.Area_ID
AND CAST(c.DateTimeEntry AS DATE) =  '2021-06-10'--input02
ORDER BY a.DescriptionSer;

/*Visits by Cost*/

SELECT DISTINCT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction, h.Amount as Amount into array_7c
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d, GetsCharged AS h, RequiresSub AS g
WHERE a.Service_ID = b.Service_ID
AND g.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID 
AND c.Area_ID = d.Area_ID
AND h.NFC_ID = c.NFC_ID
AND h.Service_ID = a.Service_ID
AND h.Amount <= 35 --input03
ORDER BY a.DescriptionSer;


--visits by date and cost

SELECT DISTINCT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction, h.Amount as Amount into array_7d
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d, GetsCharged AS h, RequiresSub AS g
WHERE a.Service_ID = b.Service_ID
AND g.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID 
AND c.Area_ID = d.Area_ID
AND h.NFC_ID = c.NFC_ID
AND h.Service_ID = a.Service_ID
AND h.Amount <= 35 --input03
AND CAST(c.DateTimeEntry AS DATE) =  '2021-06-10'--input02
ORDER BY a.DescriptionSer;

--visits by Cost and Service_Name

SELECT DISTINCT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction, h.Amount as Amount into array_7e
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d, GetsCharged AS h, RequiresSub AS g
WHERE a.Service_ID = b.Service_ID
AND g.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID 
AND c.Area_ID = d.Area_ID
AND h.NFC_ID = c.NFC_ID
AND h.Service_ID = a.Service_ID
AND h.Amount <= 100 --input03
AND a.DescriptionSer = 'Gym'--input02
ORDER BY a.DescriptionSer;

--visits by date and service_name

SELECT DISTINCT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction, h.Amount as Amount into array_7f
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d, GetsCharged AS h, RequiresSub AS g
WHERE a.Service_ID = b.Service_ID
AND g.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID 
AND c.Area_ID = d.Area_ID
AND h.NFC_ID = c.NFC_ID
AND h.Service_ID = a.Service_ID
AND a.DescriptionSer = 'Bar'
AND CAST(c.DateTimeEntry AS DATE) =  '2021-05-09'--input02
ORDER BY a.DescriptionSer;

--visits by all criteria

SELECT DISTINCT a.Service_ID as Service_ID, a.DescriptionSer as DescriptionSer, c.DateTimeEntry as DateTimeEntry, c.DateTimeExit as DateTimeExit, d.Floor as Floor, d.Direction as Direction, h.Amount as Amount into array_7g
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d, GetsCharged AS h, RequiresSub AS g
WHERE a.Service_ID = b.Service_ID
AND g.Service_ID = b.Service_ID
AND b.Area_ID = c.Area_ID 
AND c.Area_ID = d.Area_ID
AND h.NFC_ID = c.NFC_ID
AND h.Service_ID = a.Service_ID
AND a.DescriptionSer = 'Bar'
AND CAST(c.DateTimeEntry AS DATE) =  '2021-05-09'--input02
AND h.Amount <=20
ORDER BY a.DescriptionSer;





SELECT *
FROM array_7g
 


/*All Visits*/

SELECT a.Service_ID, a.DescriptionSer, c.DateTimeEntry, c.DateTimeExit,d.Floor, d.Direction
FROM TheServices AS a, AreProvidedIn AS b, Visits AS c, AREA AS d
WHERE a.Service_ID = b.Service_ID
AND b.Area_ID  = c.Area_ID
AND c.Area_ID = d.Area_ID
ORDER BY a.DescriptionSer;