USE Hotel_Official;
GO

DROP TABLE #tempCustomers;
CREATE TABLE #tempCustomers (
    NFC_ID int NOT NULL PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    Age varchar(50),
);


INSERT INTO #tempCustomers
 SELECT NFC_ID, FirstName, Surname,
		CASE
			WHEN Age BETWEEN 20 AND 40 THEN '20-40'
			WHEN Age BETWEEN 40 AND 60 THEN '40-60'
			WHEN Age > 60 THEN '60+'
		END AS 'Ages'

 FROM (SELECT NFC_ID, FirstName, Surname, Floor(DateDiff(d, DateOfBirth, GetDate()) / 365.25) AS Age
        FROM dbo.customers )
         AS Ages

SELECT a.DescriptionSer, COUNT(DISTINCT b.NFC_ID) AS "Provided To Most Clients with age 20-40"
FROM TheServices AS a, (SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2021-01-01' AND '2021-12-31') AS b,
		AreProvidedIn AS c,
		#tempCustomers AS d
WHERE a.Service_ID = c.Service_ID 
AND b.Area_ID = c.Area_ID
AND b.NFC_ID = d.NFC_ID
AND d.Age='20-40'
GROUP BY DescriptionSer
ORDER BY "Provided To Most Clients with age 20-40" DESC;

SELECT a.DescriptionSer, COUNT(DISTINCT b.NFC_ID) AS "Provided To Most Clients with age 40-60"
FROM TheServices AS a, (SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2021-01-01' AND '2021-12-31') AS b,
		AreProvidedIn AS c,
		#tempCustomers AS d
WHERE a.Service_ID = c.Service_ID 
AND b.Area_ID = c.Area_ID
AND b.NFC_ID = d.NFC_ID
AND d.Age='40-60'
GROUP BY DescriptionSer
ORDER BY "Provided To Most Clients with age 40-60"  DESC;

SELECT a.DescriptionSer, COUNT(DISTINCT b.NFC_ID) AS "Provided To Most Clients with age 60+"
FROM TheServices AS a, (SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2021-01-01' AND '2021-12-31') AS b,
		AreProvidedIn AS c,
		#tempCustomers AS d
WHERE a.Service_ID = c.Service_ID 
AND b.Area_ID = c.Area_ID
AND b.NFC_ID = d.NFC_ID
AND d.Age='60+'
GROUP BY DescriptionSer
ORDER BY "Provided To Most Clients with age 60+"  DESC;









