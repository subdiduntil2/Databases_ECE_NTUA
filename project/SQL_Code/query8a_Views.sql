USE Hotel_Official;
GO 

CREATE VIEW Services_Charged 
AS 
SELECT b.Service_ID, b.DescriptionSer, c.Amount, c.TimestampC
FROM TheServices b, GetsCharged c 
WHERE b.Service_ID = c.Service_ID;

