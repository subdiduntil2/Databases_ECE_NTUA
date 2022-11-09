USE Hotel_Official; 
GO


DROP TABLE array_9;

SELECT CU.Firstname as A, CU.Surname as B, V.Area_ID as C, V.DateTimeEntry as D, V.DateTimeExit as E into array_9
FROM AREA as AR, Visits as V, Customers as CU
WHERE (CU.NFC_ID = V.NFC_ID) and (AR.Area_ID=V.Area_ID) and (CU.NFC_ID = 00001) --Insert NFC_ID of covid case

SELECT *
FROM array_9

