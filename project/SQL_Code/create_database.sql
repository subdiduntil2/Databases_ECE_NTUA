USE Hotel_Official;
GO 

CREATE TABLE Customers (
    NFC_ID nchar(5) NOT NULL PRIMARY KEY, /*AUTO_INCREMENT ?? */
    FirstName varchar(50) NOT NULL,
    Surname varchar(50) NOT NULL,
    DateOfBirth date NOT NULL,
    TypeOfID varchar(50) NOT NULL,
	ID_Number varchar(50) NOT NULL,
	IssuingAuthority varchar(50) NOT NULL
);

CREATE TABLE CustomerPhone (
	NFC_ID nchar(5) NOT NULL,
	phone_number nchar(10) NOT NULL, 
	CONSTRAINT PKCustomerPhone PRIMARY KEY(NFC_ID, phone_number),
	CONSTRAINT FKCustomerPhone FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
	);

CREATE TABLE CustomerEmail (
	NFC_ID nchar(5) NOT NULL,
	email varchar(50) NOT NULL, 
	CONSTRAINT PKCustomerEmail PRIMARY KEY(NFC_ID, email),
	CONSTRAINT FKCustomerEmail FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
	);

CREATE TABLE TheServices (
	Service_ID varchar(50) NOT NULL PRIMARY KEY,
	DescriptionSer varchar(100) NOT NULL
	);

CREATE TABLE AREA(
	Area_ID varchar(50) NOT NULL PRIMARY KEY,
	Number_Of_Beds nchar(10),
	Name_Of_Area varchar(50) NOT NULL,
	Floor nchar(10) NOT NULL,
	Direction varchar(50) NOT NULL,
	);

CREATE TABLE HasAccess (
	NFC_ID nchar(5) NOT NULL,
	Area_ID varchar(50) NOT NULL,
	DateTimeStart datetime NOT NULL,
	DateTimeEnd datetime NOT NULL,
	CONSTRAINT PKHasAccess PRIMARY KEY(NFC_ID, Area_ID),
	CONSTRAINT FK1HasAccess FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	CONSTRAINT FK2HasAccess FOREIGN KEY (Area_ID) REFERENCES AREA (Area_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
 );

 CREATE TABLE Visits (
	 NFC_ID nchar(5) NOT NULL,
	 Area_ID varchar(50) NOT NULL,
	 DateTimeEntry datetime NOT NULL,
	 DateTimeExit datetime NOT NULL,
	 CONSTRAINT FK1Visits FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE,
	 CONSTRAINT FK2Visits FOREIGN KEY (Area_ID) REFERENCES AREA (Area_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE
 );

 CREATE TABLE GetsCharged (
	 NFC_ID nchar(5) NOT NULL,
	 Service_ID varchar(50) NOT NULL,
	 TimestampC datetime NOT NULL,
	 Descpription_Charge varchar(50) NOT NULL,
	 Amount INT NOT NULL,
	 CONSTRAINT PKGetsCharged PRIMARY KEY(NFC_ID, Service_ID),
	 CONSTRAINT FK1GetsCharged FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE,
	 CONSTRAINT FK2GetsCharged FOREIGN KEY (Service_ID) REFERENCES TheServices (Service_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE
 );

CREATE TABLE AreProvidedIn (
	Service_ID varchar(50) NOT NULL,
	Area_ID varchar(50) NOT NULL,
	CONSTRAINT PKAreProvidedIn PRIMARY KEY(Service_ID, Area_ID),
	CONSTRAINT FK1AreProvidedIn FOREIGN KEY (Service_ID) REFERENCES TheServices (Service_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
	CONSTRAINT FK2AreProvidedIn FOREIGN KEY (Area_ID) REFERENCES AREA (Area_ID)
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE RequiresSub (
	 NFC_ID nchar(5) NOT NULL,
	 Service_ID varchar(50) NOT NULL,
	 DateTimeSub datetime NOT NULL, 
	 CONSTRAINT PKRequiresSub PRIMARY KEY(NFC_ID, Service_ID),
	 CONSTRAINT FK1RequiresSub FOREIGN KEY (NFC_ID) REFERENCES Customers (NFC_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE,
	 CONSTRAINT FK2RequiresSub FOREIGN KEY (Service_ID) REFERENCES TheServices (Service_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE
 );

CREATE TABLE NotRequiresSub (

	 Service_ID varchar(50) NOT NULL,
	 CONSTRAINT PKNotRequiresSub PRIMARY KEY(Service_ID),
	 CONSTRAINT FKNotRequiresSub FOREIGN KEY (Service_ID) REFERENCES TheServices (Service_ID)
	 ON DELETE CASCADE 
	 ON UPDATE CASCADE
);

CREATE TABLE [dbo].[array_mid](
	[DateExitplus1] [datetime] NULL
);

CREATE TABLE [dbo].[array_9](
	[A] [varchar](50) NOT NULL,
	[B] [varchar](50) NOT NULL,
	[C] [varchar](50) NOT NULL,
	[D] [datetime] NOT NULL,
	[E] [datetime] NOT NULL
);

	CREATE INDEX Name_Of_Service ON TheServices(DescriptionSer);
	CREATE INDEX Visits_ID ON Visits(Area_ID);
	CREATE INDEX Provides_ID ON AreProvidedIn(Area_ID);


