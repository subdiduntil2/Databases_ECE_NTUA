USE Hotel_Official;
GO 

CREATE VIEW Customer_Info
AS 
SELECT DISTINCT b.NFC_ID, b.FirstName, b.Surname, b.DateOfBirth, b.ID_Number, b.TypeOfID, b.IssuingAuthority, c.email, d.phone_number
FROM Customers b, CustomerEmail c, CustomerPhone d
WHERE b.NFC_ID = c.NFC_ID
AND c.NFC_ID = d.NFC_ID;