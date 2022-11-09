USE Hotel_Official; 
GO

DROP TABLE array_mid
SELECT DATEADD(hour,1,array_9.E) as DateExitplus1 into array_mid
FROM array_9

SELECT DISTINCT CU.Firstname, CU.Surname
FROM Customers as CU, Visits as V, array_9, array_mid
WHERE (CU.NFC_ID=V.NFC_ID) and ( V.Area_ID = array_9.C) and ( ( (V.DateTimeExit >= array_9.D) and (V.DateTimeExit <= array_mid.DateExitplus1) ) or 

( (V.DateTimeEntry >= array_9.D) and (V.DateTimeEntry <= array_mid.DateExitplus1) ) or ( (V.DateTimeExit >= array_mid.DateExitplus1) and (V.DateTimeEntry <= array_9.D) ) )