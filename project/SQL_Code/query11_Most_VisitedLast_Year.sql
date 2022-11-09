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





SELECT a.Name_Of_Area, COUNT(b.Area_ID) AS "Most Visited Areas for 20-40"
FROM  AREA AS a,
		(SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2020-06-01' AND '2021-6-30') AS b,
		#tempCustomers AS d
WHERE a.Area_ID = b.Area_ID
AND d.NFC_ID=b.NFC_ID
AND d.Age='20-40'
GROUP BY Name_Of_Area
ORDER BY  "Most Visited Areas for 20-40" DESC;

SELECT a.Name_Of_Area, COUNT(b.Area_ID) AS "Most Visited Areas for 40-60"
FROM  AREA AS a,
		(SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2020-06-01' AND '2021-6-30') AS b,
		#tempCustomers AS d
WHERE a.Area_ID = b.Area_ID
AND d.NFC_ID=b.NFC_ID
AND d.Age='40-60'
GROUP BY Name_Of_Area
ORDER BY  "Most Visited Areas for 40-60" DESC;;

SELECT a.Name_Of_Area, COUNT(b.Area_ID) AS "Most Visited Areas for 60+"
FROM  AREA AS a,
		(SELECT * FROM Visits
		WHERE DateTimeEntry BETWEEN '2020-06-01' AND '2021-6-30') AS b,
		#tempCustomers AS d
WHERE a.Area_ID = b.Area_ID
AND d.NFC_ID=b.NFC_ID
AND d.Age='60+'
GROUP BY Name_Of_Area
ORDER BY  "Most Visited Areas for 60+" DESC;;