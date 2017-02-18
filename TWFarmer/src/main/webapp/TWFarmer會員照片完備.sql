USE TWFarmer
GO

DROP TABLE Msg
DROP TABLE ChatRoom
DROP TABLE Violation
DROP TABLE QnA
DROP TABLE JPFollowerDetail
DROP TABLE JPFollower
DROP TABLE F2FDetail
DROP TABLE JPDetail
DROP TABLE JointPurchase
DROP TABLE JPStatus
DROP TABLE MiscVia
DROP TABLE OrderDetail
DROP TABLE Orders
DROP TABLE OrderStatus
DROP TABLE ProductPic
DROP TABLE ProductDiscount
DROP TABLE TrackProduct
DROP TABLE Product
DROP TABLE ProductType
DROP TABLE Farmer
DROP TABLE Friend
DROP TABLE Member

CREATE TABLE Member(
	MemberID int PRIMARY KEY IDENTITY(1001,1) NOT NULL,
	Account varchar(20) NOT NULL,
	Password varchar(20) NOT NULL,
	Name varchar(20),
	PostalCode char(3),
	District char(20),
	Address varchar(100) ,
	Phone varchar(20), 
	Email varchar(50),
	IDNumber varchar(10),
	BirthDate datetime,
	Gender varchar(1),
	IDType int,
	Rating int,
	MemberPic varchar(100),
)
GO

CREATE TABLE Farmer (
	FarmerID varchar(10) PRIMARY KEY NOT NULL, 
	MemberID int REFERENCES Member(MemberID) NOT NULL,
	FarmerIntro varchar(600),
	Bank nvarchar(10),
	BankAccount varchar(20),
)
GO

CREATE TABLE Friend (
	MemberId int REFERENCES Member(MemberID) NOT NULL,
	FriendId int REFERENCES Member(MemberID) NOT NULL,
	FriendStatus int,
	PRIMARY KEY(MemberId,FriendId)
)
GO

CREATE TABLE ProductType(
	ProductTypeID int IDENTITY(2101,1) NOT NULL PRIMARY KEY,
	Type nvarchar(10),
)
GO

--CREATE TABLE ProductStatus(
--	ProductStatusID int IDENTITY(2501,1) NOT NULL PRIMARY KEY,
--	ProductStatusName nvarchar(10),
--)
--GO

CREATE TABLE Product(
	ProductID int IDENTITY(2001,1) NOT NULL PRIMARY KEY,
	SellerID int REFERENCES Member (MemberID) NOT NULL,
	Origin nvarchar(10),
	ProductName nvarchar(40),
	Inventory int,
	Price int,
	Unit varchar(10),
	ProductTypeName nvarchar(40),
	ProductIntro nvarchar(600),
	Freight int,
	AddDate datetime,
	RemoveEstDate datetime,
	RemoveDate datetime,
	ProductStatusName nvarchar(40),
)
GO

CREATE TABLE ProductPic(
	ProductPicID int IDENTITY(2401,1) NOT NULL PRIMARY KEY,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	PictureName varchar(100),
	PictureIntro nvarchar(60)
)
GO

CREATE TABLE ProductDiscount(
	DiscountID int IDENTITY(2301,1) NOT NULL PRIMARY KEY,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	MinThreshold int,
	MaxThreshold int,
	DiscountPrice int,
)
GO

CREATE TABLE TrackProduct(
	MemberID int REFERENCES Member(MemberID) NOT NULL,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	TrackDate datetime,
	PRIMARY KEY(MemberID,ProductID)
)
GO

CREATE TABLE OrderStatus(
	OrderStatusID int IDENTITY(3101,1) NOT NULL PRIMARY KEY,
	OrderStatusName nvarchar(10),
)
GO

CREATE TABLE Orders(
	OrderID int IDENTITY(3001,1) NOT NULL PRIMARY KEY,	  
	SellerID int REFERENCES Member (MemberID) NOT NULL,
	BuyerID int REFERENCES Member (MemberID) NOT NULL, 
	TotalFreight int,
	TotalPrice int,
	OrderDate datetime,
	ShipDate datetime,
	ShipName nvarchar(20),
	ShipPostalCode nvarchar(3),
	ShipDistrict nvarchar(10),
	ShipAddress nvarchar(50) ,
	OrderStatusID int REFERENCES OrderStatus (OrderStatusID),
	RatingBuyer int,
	RatingSeller int,
	Remittance int,
	RemittanceDate datetime,
	RemittanceBank nvarchar(10),
	RemittanceAcc varchar(5),
)
GO

CREATE TABLE OrderDetail(
	OrderID int REFERENCES Orders (OrderID) NOT NULL,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	Unit varchar(10),
	UnitPrice int,
	OrderQuantity int,
	UnitFreight int,
	PRIMARY KEY(OrderID,ProductID)
)
GO

CREATE TABLE JPStatus(
	JPStatusID int IDENTITY(4101,1) NOT NULL PRIMARY KEY,
	JPStatusName nvarchar(10),
)
GO

CREATE TABLE MiscVia(
	MiscViaID int IDENTITY(4201,1) NOT NULL PRIMARY KEY,
	MiscViaWay nvarchar(10),
)
GO

CREATE TABLE JointPurchase(
	JPID int IDENTITY(4001,1) NOT NULL PRIMARY KEY,
	InitID int NOT NULL REFERENCES Member(MemberID),
	JPName varchar(100),
	JPIntro varchar(600),
	InitDate datetime,
	EndDate datetime,
	JPLocation nchar(10),
	JPStatusID int REFERENCES JPStatus(JPStatusID),
	JPFreight int,
	MiscViaID int REFERENCES MiscVia(MiscViaID),
	Misc int,
	BankAccount varchar(20),
	BankName varchar(20)
)
GO

CREATE TABLE JPDetail(
	JPID int REFERENCES JointPurchase(JPID) NOT NULL,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	JPPopulationMin int,
	JPPopulationMax int,
	JPMinQEach int,
	JPPrice int,
	JPFreight int,
	JPUnit varchar(10),
	PRIMARY KEY(JPID,ProductID)
)
GO

CREATE TABLE F2FDetail (
	F2FID int IDENTITY(4301,1) PRIMARY KEY NOT NULL,
	JPID int REFERENCES JointPurchase(JPID) NOT NULL,
	F2FPlace nvarchar(50),
	F2FTime datetime,
)
GO

CREATE TABLE JPFollower(
	JPFollowerID int IDENTITY(4401,1) PRIMARY KEY NOT NULL,
	MemberID int REFERENCES Member(MemberID) NOT NULL,
	F2FID int REFERENCES F2FDetail(F2FID),
	JPID int REFERENCES JointPurchase(JPID),
	TotalPrice int,
	RemittanceStatus int,
	RemittanceDate datetime,
	Remittance int,
	RemittanceBank nvarchar(10),
	RemittanceAcc varchar(5),
	Misc int,
	SplitFreight int,
	Notes nvarchar(200),
)
GO
CREATE TABLE JPFollowerDetail(
	JPFollowerID int REFERENCES JPFollower(JPFollowerID) NOT NULL,
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	Quantity int,
	Price int,
	PRIMARY KEY(JPFollowerID,ProductID)
)
GO

CREATE TABLE QnA(
	QnAID int IDENTITY(5001, 1) PRIMARY KEY NOT NULL,
	QueryID int REFERENCES Member (MemberID) NOT NULL, 
	ProductID int REFERENCES Product(ProductID) NOT NULL,
	QnATitle nvarchar(40),
	QnAContent  nvarchar(250), 
	QueryDate datetime,
	ReQnA  nvarchar(250), 
	ReDate datetime,
	ReStatus int,
)
GO

CREATE TABLE Violation(
	TicketID int PRIMARY KEY IDENTITY(5101, 1) NOT NULL,
	ReportedID int REFERENCES Product (ProductId) NOT NULL, 
	ReporterID int REFERENCES Member (MemberID) NOT NULL,
	VioTitle nvarchar(40), 
	VioContent nvarchar(250),
	CreateDate datetime,
	ProcessDate datetime,
	TicketResult nvarchar(100),
	TicketStatue int,
)
GO

CREATE TABLE ChatRoom(
	ChatMsgID int PRIMARY KEY IDENTITY(5201, 1) NOT NULL,
	WriterID int REFERENCES Member (MemberID) NOT NULL, 
	ReaderID int REFERENCES Member (MemberID) NOT NULL, 
	ChatMsgContent nvarchar(250),
	ChatMsgTime datetime,
)
GO

CREATE TABLE Msg(
	MsgID int PRIMARY KEY IDENTITY(5301, 1) NOT NULL,
	MsgWriterID int REFERENCES Member (MemberID) NOT NULL, 
	MsgReaderID int REFERENCES Member (MemberID) NOT NULL, 
	MsgTitle nvarchar(50),
	MsgContent nvarchar(500),
	MsgTime datetime,
	MsgStatus int,
)
GO

--Member
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('a001','password','�|��A',235,'�s�_�����M��','�|��A���a','0911111111','memberA@gmail.com','A111111111','1990-01-01','M',1,0,'P1001.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('b001','password','�|��B',106,'�x�_���j�w��','�|��B���a','0922222222','memberB@gmail.com','B222222222','1988-02-02','F',1,10,'P1002.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('c002','password','�p�AA',367,'�]�߿��T�q�m','�p�AA���a','0933333333','memberA@gmail.com','A333333333','1944-04-04','M',2,100,'P1003.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
            VALUES ('d002','password','�p�AB',904,'�̪F���E�p�m','�p�AB���a','0944444444','memberB@gmail.com','B444444444','1955-05-05','M',2,30,'P1004.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('c001','password','�|��C',106,'�x�_���j�w��','�|��C���a','0933333333','memberB@gmail.com','C222222222','1988-02-02','F',1,10,'P1005.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('d001','password','�|��D',106,'�x�_���j�w��','�|��D���a','0944444444','memberB@gmail.com','D222222222','1988-02-02','F',1,10,'P1006.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('e001','password','�|��E',106,'�x�_���j�w��','�|��E���a','0955555555','memberB@gmail.com','E222222222','1988-02-02','F',1,10,'P1007.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('f001','password','�|��F',106,'�x�_���j�w��','�|��F���a','0966666666','memberB@gmail.com','F222222222','1988-02-02','F',1,10,'P1008.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('c002','password','�p�AC',367,'�]�߿��T�q�m','�p�AC���a','0933333333','memberC@gmail.com','C333333333','1944-04-04','M',2,100,'P1009.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('d002','password','�p�AD',904,'�̪F���E�p�m','�p�AD���a','0944444444','memberD@gmail.com','D444444444','1955-05-05','M',2,30,'P1010.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('micky','123','�̤p��',555,'�n�뿤�����m','�H����215��','0912345678','micky@gmail.com','M125943647','1962-08-25','M',2,126,'P1011.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
          	VALUES ('kitty','123','�͸���',973,'�Ὤ���N�w�m','�O����52��','0987416423','kitty@gmail.com','U235974118','1973-06-16','M',2,95,'P1012.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        values ('sunmary', '123', '�]�p��', 206, '�򶩥��C����', '�֤@��172��22��', '0912766281', 'sunmary@gmail.com', 'C223456724', '1988-10-08', 'F',1, 25,'P1013.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        values ('arrtuu', '123', '�i���g', 950, '�x�F���x�F��', '�C�����G�q581��', '0933268953', 'arrtuu@gmail.com', 'V116456724', '1963-05-30', 'M',2, 130,'P1014.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        values ('missmoney', '123', '���ҤH', 106, '�x�_���j�w��', '�{����40��65��3��', '0957923581', 'missmoney@gmail.com', 'A213583216', '1976-05-20', 'F',1, 32,'P1015.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('p001','iloveopen','open�N',654,'���L���|��m','open�N���a','0977777777','open@gmail.com','O177777777','1966-06-06','M',2,30,'P1016.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('p002','ilovedoraemon','�G��A��',840,'�������j���','�G��A�ڤ��a','0988888888','doraemon@gmail.com','E133333333','1978-09-03','M',2,65,'P1017.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('p003','ilovesonic','���t�p�l',238,'�s�_����L��','���t�p�l���a','0999000123','sonic@gmail.com','F133333333','1987-08-05','M',1,53,'P1018.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('skyYo','123456','�ۦb��',906,'�̪F������m','������96��','0908997955','strongyo@gmail.com','A136854479','1988-08-08','M',1,100,'P1019.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('draconicwu','123456','�ť��s',221,'�s�_�������','�s�x�����@�q866��','0970579136','draconicwu@gmail.com','F136854132','1996-12-23','M',1,0,'P1020.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('verysilent','123456','�H��u',266,'�y�����T�P�m','�|�Z�����I���G�q704��','0979254186','truesilence50@gmail.com','G236854479','1987-07-04','F',2,105,'P1021.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('littleli','123456','���p��',110,'�x�_���H�q��','�Q�s��999��','0971270920','chienchien999@gmail.com','F206854185','1998-03-06','F',2,299,'P1022.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('furry','123456','���б�',106,'�x�_���j�w��','�ذ�n���G�q79��100��','0974180520','thisrealmneedsme@gmail.com','F276854479','1992-01-01','F',1,240,'P1023.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('shinhuei','123456','���ɴ@',241,'�s�_���T����','�����_��111��','0947240785','tintinyuli@gmail.com','F243054423','1987-09-06','F',1,340,'P1024.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('reginelu','123456','�f�Y�P',106,'�x�_���j�w��','ù���ָ��|�q1��','0955520520','storiesuntold@gmail.com','A270012591','1994-12-23','F',1,500,'P1025.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('vladpussy','123456','�B���u',106,'�x�_���j�w��','ù���ָ��T�q333��9487��','0957383322','TrumpIsMyBro@gmail.com','VP19521007','1952-10-07','F',1,10,'P1026.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('usaisdead','USAUSA','��t�B',904,'�x�_���j�w��','�H�q���T�q134��9487��','0940439206','ILovePutin@gmail.com','DT19460614','1946-06-14','M',2,-100,'P1027.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('kai9487','123456','������',973,'�Ὤ���N�w�m','�O����52��','0987416423','kitty@gmail.com','U235974118','1973-06-16','F',2,95,'P1028.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('GuanGong','123456','���м�',807,'�������T����','�ؤu��415��','0937282706','guangong@gmail.com','E136859487','1917-01-31','M',3,1000,'P1029.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('tentacool','123','���^�E',116,'�x�_����s��','�������G�q96��15��3��','0987416423','mamaisbest@gmail.com','A119301548','1950-07-13','M',1,-10,'P1030.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
         	VALUES ('walkman','123','������',721,'�x�n���¨���','�j�l��33��','0957963584','ilovemoney@gmail.com','D105095174','1950-10-12','M',2,-99,'P1031.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('liangrandpa','123','�s��',721,' �x�n���¨���','�w�~��79��3��','0912586429','chinesegood@gmail.com','D110724799','1936-8-27','M',2,-10,'P1032.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('chingte','123','��M�w',721,'�x�n���¨���','�j�l��137��1��','0999888777','laichingte@gmail.com','D184618560','1959-10-6','M',2,-10,'P1033.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('english','123','���^��',234,'�s�_���éM��','���e�F���|�q106��10��','0941558778','greatamerica@gmail.com','L219759723','1956-08-31','F',1,-80,'P1034.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('ptt5566','123','56����`',109,'�x�_���H�q��','�H�q���|�q56��56��','0956555666','ptt5566@gmail.com','A129555666','1956-05-06','M',1,-56,'P1035.jpg');
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	        VALUES ('mango','123','���p��',906,'�̪F������m','�̪F������m������60��','0988168168','mango168@gmail.com','T127168168','1988-1-06','M',2,-68,'P1036.jpg');

--Farmer
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000001', 1003, '�p�AA�ؾ�l');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000002', 1004, '�p�AB�طR��~�G');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000003', 1009, '�p�AC��');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000004', 1010, '�p�AD��');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000005', 1011, '�̤p���n��ж�A��');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000006', 1012, '�Ὤ�N�w�͸����[���G��');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('N261870375', 1031, '����g��...�ݽ�她');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('S185803332', 1032, '�s�ݷݤ她');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('J166180504', 1033, '��M�w�]�i�H��她��ȫ}');
--2017/02/13 ��
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000009487', 1027, '��t�B�N�O�g�A����H�]�i�H�b�x�潭�G!');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000009999', 1028, '�����͡A������!');

INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z333666999', 1036, '�̪F���p���A�F����p���R�Y�ڪ��~�G!');


--ProductType

	INSERT INTO ProductType (Type) VALUES ('���G��');
INSERT INTO ProductType (Type) VALUES ('�֪G��');
INSERT INTO ProductType (Type) VALUES ('��G��');
INSERT INTO ProductType (Type) VALUES ('�ߪG��');
INSERT INTO ProductType (Type) VALUES ('�a����');
INSERT INTO ProductType (Type) VALUES ('����');
INSERT INTO ProductType (Type) VALUES ('�ڵ���');
INSERT INTO ProductType (Type) VALUES ('������');
INSERT INTO ProductType (Type) VALUES ('�����');
INSERT INTO ProductType (Type) VALUES ('�G����');
INSERT INTO ProductType (Type) VALUES ('������');
INSERT INTO ProductType (Type) VALUES ('������');
INSERT INTO ProductType (Type) VALUES ('��Ħ��');
INSERT INTO ProductType (Type) VALUES ('��Ħ��');
INSERT INTO ProductType (Type) VALUES ('����');

--ProductStatus
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('�W�[');
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('�U�[');
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('����');

--Product
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusName) 
	VALUES (1003, '�]�߿��T�q�m', '��l', 200, 35, '����', '�a����', '�̤�6����X�f�ܲ��ܦh��', 10, '2017-01-20', '2017-03-20', '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1004, '�̪F���E�p�m', '�R��~�G', 100, 600, '�c', '�֪G��', '�C�c10�礣�����n��', 100, '2016-06-05', '2016-07-20', '2016-07-25', '�U�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1009, 'C', 'C', 100, 600, '�c', '�֪G��', 'C', 100, '2016-06-05', '2016-07-20', '2016-07-25', '�U�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1010, 'D', 'D', 100, 600, '�c', '�֪G��', 'D', 100, '2016-06-05', '2016-07-20', '2016-07-25', '�U�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '�Ὤ���N�w�m', '�լc', 0, 30, '��', '�a����', '�֨ӷm�ʤ��~�̫᪺�c�l��A�̤�10��X�f!!', 10, '2016-08-18', '2016-11-30', '2016-11-30', '�U�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '�ᷦ��', 60, 350, '�c', '�����', '�n�Y�K�y�ᷦ��A10���', 80, '2016-12-05', '2017-05-25', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '�Ὤ���N�w�m', '����', 300, 70, '��', '�ߪG��', '�n�Y�����p����A5��X�f', 10, '2016-12-25', '2017-02-17', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '���wۣ', 60, 350, '�c', '��Ħ��', '�L�~������l�A���ƪ��wۣ', 80, '2017-01-10', '2017-03-25', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '�]�߿��T�q�m', '�h��', 400, 45, '����', '�a����', '�̤�6����X�f�A�A������', 10, '2017-01-18', '2017-05-03', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '�]�߿��T�q�m', 'ī�G', 200, 50, '����', '���G��', '�@�Ѥ@��ī�G�A��ͻ�����', 10, '2017-01-22', '2017-04-21', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '���a��', 35, 500, '�c', '�ڵ���', '���a���@�c20��A�~��X�f', 100, '2017-01-26', '2017-03-18', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '�]�߿��T�q�m', '���', 30, 600, '�c', '�ߪG��', '�|�p�߫O�@�קK�I���A10���', 100, '2017-02-01', '2017-03-31', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '���R��', 75, 300, '�c', '������', '���R��j�^���A�Ф@�_������A', 80, '2017-02-02', '2017-03-25', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '�a�ʸ�', 50, 300, '�c', '������', '�j���q�a�ʸ��A�w��������骽����f', 80, '2017-02-05', '2017-04-05', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '�Ὤ���N�w�m', '���', 20, 800, '�c', '�֪G��', '�L�~�������G�A�O�Ҥj���S�n�Y��', 100, '2017-01-11', '2017-02-28', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '�Ὤ���N�w�m', '�}�ߪG', 200, 280, '��', '��G��', '�L�~�N�O�n�}�ߪG�A�T��X�f��', 20, '2017-01-03', '2017-02-17', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1031, '�x�n���¨���', '�她', 300, 100, '��', '�a����', '���a�۰⤤��`�e§�~���̨Ϊ��u�`���~�A������Y�她��̯�P������`��', 10, '2017-08-10', '2017-10-30', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1032, '�x�n���¨���', '�她', 400, 110, '��', '�a����', '����`�e§�̨Ϊ����§����@�w�n�Ӥ@����!!', 10, '2017-08-20', '2017-09-30', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1033, '�x�n���¨���', '�她', 350, 105, '��', '�a����', '�����ͮ���޲z�B�q�L�w�����G�N��E�{�ҡA�Ҳ��X���G��Ħh�׹��ٱa���̲��������A���O�̥i�w�߭���!', 5, '2017-08-01', '2017-10-05', null, '�W�[');
--2017/02/13 ��
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1027, '�x�_���j�w��', '���Ҷ¾L��', 200, 400, '�c', '�ߪG��', '�a��̨g�A�`�ίŶi�f�L�ߡA�ŭ��O�_�A�ӪŨt���G�޳N�A���B�]���T�~�A���A�����լ����F�`!', 2000, '2017-01-20', '2021-01-20', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1028, '�Ὤ���N�w�m', '���Ī��', 40, 800, '��', '������', '��Ĳ�A���I�Τw�[�������A�f�P�p���B�D�A�A�O�]�����V�b�ڲ����W�R���������|���ƥh�C', 200, '2017-02-09', '2017-05-28', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '�n�뿤�����m', '�_�ɤs����', 60, 400, '�c', '�G����', '���s���Y�ŴN�O�ڭ̪��ūǡA�s�ת�����N���ڭ̪��~��C', 80, '2017-02-11', '2017-05-05', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
    VALUES (1036, '�̪F������m', '�p���~�G', 100, 1000, '�c', '�֪G��', '�F����p�Y�F�~�G�����R�ڤF�C', 100, '2017-02-11', '2017-08-05', null, '�W�[');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
    VALUES (1028, '�Ὤ���N�w�m', '�Ὤ���l', 200, 100, '�c', '�֪G��', '�@�c��32~35���A��7.5�x��C', 100, '2017-02-11', '2017-08-05', null, '�W�[');


--ProductDiscount
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2001,10,15,34 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2002,10,15,540 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2003,5,10,580 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2004,5,10,580 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2005,30,50,29 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2006,10,15,320 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2007,20,35,65 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2008,5,15,330 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2009,20,40,42 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2010,25,40,48 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2011,5,15,480 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2012,5,15,580 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2013,5,20,290 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2014,10,15,280 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2015,3,5,780 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2016,5,10,260 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2017,10,20,95 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2017,20,30,90 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2018,null,null,null );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2019,10,15,103 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2019,15,20,100 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2019,20,25,97 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2019,25,30,95 );


--ProductPic
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2001,'2401.jpg','��l���Ӥ�1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2001,'2402.jpg','��l���Ӥ�2' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,'2403.jpg','�~�G���Ӥ�1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,'2404.jpg','�~�G���Ӥ�2' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2003,'2405.jpg',null );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2004,'2406.jpg',null );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2005,'2407.jpg','�Ħh�������լc' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2006,'2408.jpg','���ᷦ�������' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2007,'2409.jpg','����[�W������' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2008,'2410.jpg','���穱���ƪ��wۣ' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2009,'2411.jpg','�e§�]�ܤj��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2010,'2412.jpg','�@�Ѥ@��ī�G�A��ͻ�����' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2011,'2413.jpg','�b�a�����a��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2012,'2414.jpg','�s�A�{�K�����' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2013,'2415.jpg','�V�Ѱ��R���A������' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2014,'2416.jpg','�a�ʸ���' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2015,'2417.jpg','���e§�W�j��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2016,'2418.jpg','�~�`���ƶ}�ߪG' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2017,'2419.jpg','�S���S�n�Y���她' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2017,'2420.jpg','�s�A�n�Y���她' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2018,'2421.jpg','����̨Φ��§' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2018,'2422.jpg','�������n����Y�L�N���D' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2019,'2423.jpg','�n�Y�她���Ӥj���ing' );
--2017/02/13 ��
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2020,'2424.jpg','���Ҫ��j�]��^�A���Ӥ��Χڧi�D�A�F�a' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2020,'2425.jpg','�S�Ƭݬݶ���s�D�A�N���D�ک�ܸ��泣�ܻ{�u' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2020,'2426.jpg','�ڭ̸ӥ߰����o�����U�u���סA�ç⯸���j��浹��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2020,'2427.jpg','���Ҷ¾L�ߡA���άݴN���D��ڤ@�˱jO��O' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2021,'2428.jpg','�Ϲꪺ�ڡA�N��ڭ̯ѧ@���믫' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2021,'2429.jpg','�����馩�A�O�]����~�誺����n�D' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2021,'2430.jpg','�ӶR�a�A�X�۷�u���ɭԡI' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2022,'2431.jpg','�n��@���եɡA�B�ܳs�������ݱo��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2022,'2432.jpg','�o�˪��n�ܡA������F�A�ڪ��ߧ���' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2022,'2433.jpg','�W�a�S�諸�_�ɤs�ս����A�O�A���F�A�a�^�a�a!' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2023,'2434.jpg','�p���~�G�A�`�o�z��' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2024,'2435.jpg','�Ὤ���l���ѤU' );


--ProductTrackProduct
INSERT INTO TrackProduct (MemberID, ProductID, TrackDate)
	VALUES ( 1001,2001,'2017-01-21' );
--OrderStatus(��Ӫ�)
INSERT INTO OrderStatus (OrderStatusName) values('���I��')
INSERT INTO OrderStatus (OrderStatusName) values('�w�I��')
INSERT INTO OrderStatus (OrderStatusName) values('�X�f��')
INSERT INTO OrderStatus (OrderStatusName) values('�w�X�f')

--Orders
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1003 , 1001 , 100,450,'2017-01-03 20:51:29','2017-01-06 13:20:01','�|��A',235,'�s�_�����M��','�|��A���a',3101, 1 , 1);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1003 , 1002 , 100,550,'2017-01-15 18:20:05','2017-01-20 11:48:32','�|��B',106,'�x�_���j�w��','�|��A���a',3101, 1, null);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1011 , 1005 , 160,860,'2017-01-23 09:02:31','2017-01-25 15:13:21','�|��C',106,'�x�_���j�w��','�|��C���a',3101,null,null);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1011 , 1006 , 160, 860,'2017-03-08 17:42:51','2017-03-09 17:42:51','�|��D',106,'�x�_���j�w��','�|��D���a',3103,null,null);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1012 , 1007 , 100, 800,'2017-01-31 12:42:17','2017-02-01 17:22:34','�|��E',106,'�x�_���j�w��','�|��E���a',3104,1,-1);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1012 , 1008 ,100, 900,'2017-01-10 00:08:53','2017-01-14 15:32:47','�|��F',106,'�x�_���j�w��','�|��F���a',3104,1,1);
--2017/02/13 ��
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1027 , 1026 , 4000,4800,'2017-01-24 20:50:49','2017-01-26 14:40:07','�B���u',235,'�x�_���j�w��','ù���ָ��T�q333��9487��',3104, 10 ,-100);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1028 , 1025 ,400,2000,'2017-02-15 18:20:00','2017-02-20 11:48:50','�f�Y�P',235,'�x�_���j�w��','ù���ָ��|�q1��',3103, 501, null);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1011 , 1024 ,160, 960,'2017-02-23 09:00:37','2017-02-25 15:13:27','���ɴ@',106,'�s�_���T����','�����_��111��',3101,null,null);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1036 , 1035 ,100, 1100,'2017-02-13 09:00:37','2017-02-14 15:13:27','56����`',109,'�x�_���H�q��','�̪F������m������60��',3101,null,null);



--OrderDetail
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3001,2001,'����',35,10,10);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3002,2009,'����',45,10,10);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3003,2006,'�c',350,2,80);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3004,2008,'�c',350,2,80);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3005,2007,'��',70,10,10);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3006,2015,'�c',800,1,100);
--2017/02/13 ��
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3007,2020,'�c',400,2,2000);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3008,2021,'��',800,2,200);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3009,2022,'�c',400,2,80);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3010,2023,'�c',1000,1,100);


--MiscVia
INSERT INTO MiscVia (MiscViaWay) VALUES ('����');
INSERT INTO MiscVia (MiscViaWay) VALUES ('�̤H�Y');
INSERT INTO MiscVia (MiscViaWay) VALUES ('�̤��');

--JPStatus
INSERT INTO JPStatus (JPStatusName) VALUES ('�f�֤�');
INSERT INTO JPStatus (JPStatusName) VALUES ('�w�f��');
INSERT INTO JPStatus (JPStatusName) VALUES ('�w�}��');
INSERT INTO JPStatus (JPStatusName) VALUES ('�w����');
INSERT INTO JPStatus (JPStatusName) VALUES ('�y��');

--JointPurchase
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate, JPLocation, JPStatusID, JPFreight, MiscViaID, Misc) 
	VALUES (1001, '�n����l�X��~3/10�I��', '�T�q�m�W��~~ť���o���l�W�n�Y�W��,�Q�R���H�֤@�_�[�J, �ؼд꺡10�c�������~~~', '2017-01-15', '2017-01-25', '�s�_�����M��',4103,80,4202,20);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1001, '��l�X�ʹ�', '��l�X�ʹμf��', '2017-02-20', '2017-03-20',	'�x�_���j�w��',	4101, 200, 4201, 0);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1002, '��l�X�ʹ�', '��l�X�ʹζ}��', '2017-01-20', '2017-03-20',	'�s�_���O����',	4103, 200, 4201, 0);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '�R�Ӥ她 �ֳt��~~�꺡20���N���o~~����t�X�Ÿ�', '�o�a�她�u���W�n�Y  �Y�F�ٷQ�A�Y �Y�F�ٷQ�A�Y �Y�F�ٷQ�A�Y �Y�F�ٷQ�A�Y �Y�F�ٷQ�A�Y ���֨Ӹ�ΤK!!!', '2017-02-10', '2017-02-17',	'�x�_����s��',	4104, 100, 4202, 10);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '��M�n�Q�Yī�G~�֨Ӥ@�_�Rī�G�t', '�n5��~�X�f~~�ҥH5��N�����o �֨Ӥ@�_�Yī�G���e�t', '2017-03-01', '2017-03-10',	'�x�_����s��',	4103, 0, 4201, 0);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '����X�ʡA�ִ̤�@�c!!!', '�X�ʯ���ִ̤꺡1�c�A�C�c10��A�̦h3�c�N�����o�A�n��n��~~~', '2017-02-28', '2017-03-07',	'�x�_����s��',	4104, 300, 4201, 0);
--2017/02/13 ��
--���ɮפ��|���s��1019��"�ۦb��"�ݨ��t�B������A�M�w���L�X�ʹζ}�U�h~�`��$3600�A��$1600��4�c�L�ߡA$2000���B�O�C
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate, JPLocation, JPStatusID, JPFreight, MiscViaID, Misc) 
	VALUES (1019, '�@�_�R�¾L��!4/15�I��', '�¾L�ߥi�H�C���s�W�g��!~�٬O����f!�ؼд��4�c~�C�H1�c�A�U�u�B�O$500', '2017-02-15', '2017-04-25', '�̪F������m',4104,2000,4202,0);

--JPDetail
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4001, 2001, 6, 10, 1, 35, 10,'����');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4004, 2019, 20, 20, 1, 97, 10,'��');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4005, 2010, 5, 5, 1, 50, 10,'����');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4006, 2009, 1, 3, 1, 60, 10,'����');
--2017/02/13 ��
--�L�ߦX�ʹΦ��ߡA�g�J����椤
--�ݰQ�סG�o�ɭԪ�JPID �쩳�O�}�Ϊ��s���n�O�H�٬O���Ϊ��s���O�H
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4007, 2020, 4, 4, 1, 400, 2000,'�c');


--F2F
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '���B�æw�������X�f','2017-01-31 12:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '���M���F�@���s��(J�ɼӤU���a)','2017-01-31 14:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '�s�_�����M�Ϥ�����753��(�O�H�Ȧ���f)','2017-01-31 16:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '�F�j����','2017-02-25 16:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '�Ҹհ|���f','2017-02-25 17:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '�����k���ժ��f','2017-02-25 18:00');
--2017/02/13
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4007, '�̪F������m�n����143�� (�A�|�j�U��)','2017-03-05 15:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4007, '�x�_���j�w�ϴ_���n���@�q390��14��(�x�_�A�|)','2017-03-12 15:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4007, '�̪F������m������330��(�m���Ҥj���f)','2017-03-19 15:00');

--JPFollower
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1001, 4301, 4001, 100, null, '2011-11-11', 100, 'bank', 12345, 0, 0, '�P�¥D��');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1032, 4302, 4003, 100, null, '2011-12-12', 100, '����H�U', 33333, 0, 0, 'You are my Sunshine');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1030, 4304, 4005, 100, null, '2017-03-31', 100, '�x�_�I��', 74125, 0, 0, '�Ѩ�!!');
--2017/02/13 ��
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
VALUES (1020, 4307, 4007, 400, null, '2017-02-27', 400, '�l�F����', 70624, 0, 500, '$500�B�O���I�g��~�S�̧ڮ��A');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
VALUES (1026, 4308, 4007, 400, null, '2017-02-28', 400, '�ɤs�Ȧ�', 02089, 0, 500, '�ڪ��p�_�����t�u���b�x�W�}��F�ڴ���C���`�z�N�j�o�O�d�A���A�̳o�Ǥp�����R�R�a�°�~');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
VALUES (1022, 4309, 4007, 400, null, '2017-03-01', 400, '�ثn�Ȧ�', 51501, 0, 500, '�Y�i�@�զX�ʡA�@��ؤQ�~�A�Y��@���L�ߡA�@�ר��u�N�C');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1030, 4305, 4004, 100, null, null, null, null, null, 0, 0, '�Ѩ�!!');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1030, 4305, 4007, 100, null, null, null, null, null, 0, 0, '�Ѩ�!!');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1030, 4305, 4001, 100, null, null, null, null, null, 0, 0, '�Ѩ�!!');

--JPFollowerDetail
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4402, 2019, 3, 291);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4403, 2002, 4, 80);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4401, 2007, 9, 180);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4407, 2007, 9, 180);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4408, 2007, 9, 180);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4409, 2007, 9, 180);

--2017/02/13 ��
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4404, 2020, 1, 400);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4405, 2020, 1, 400);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4406, 2020, 1, 400);


--QnA
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	values(1001 ,2001, '�ڷQ�����󦬾ڪ����D...', '�аݦ��ڥi�H�}106�~����? �Y�o�P���U�q�״ڧ����A1��13��e�i�H��f��?', '2016-12-28 08:28:50', '�n���A���z�w��', '2016-12-28 14:28:50','1');
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	values(1002 ,2002, '�Q�а�����U�ХI�ڪ����D...', '�аݧڭn�q7�c�A�w�p��ɥi��f? ����O2800���K�B��?', '2016-12-30 12:18:33', '�z�n...�w�ƨ줸����F', '2016-12-30 18:24:09','1');
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1030 ,2019, null, '�аݶR20�}�i���i�H�馩�h�@�I', '2016-02-03 18:00:42', '�ثe20��������бz�Ѧҧڭ̺����W���Ѫ��馩��', '2016-02-03 18:12:44',1);
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1031 ,2019, null, '�A�����D�A�b��她��', '2016-03-09 19:52:24', null, null,0);
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1011 ,2019, null, '�аݳo��她�j���i�H���h�[', '2016-03-01 21:33:07', '�z�n�A�X�f����i��|�g�A���K�v�T�s�A�����A�ٽкɧ֭��ΡA�P�±z', '2016-03-02 08:22:43',1);
--2017-02/13 ��
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1026 ,2020, '���K�ŹB�ӫX��a?', '�ڻ����t��~���}�F�o��ӥ��v��$2000�B�O����~�n���n���K�B�@�c�Ӳ�����A���q���q���`�z�°�', '2017-01-28 08:30:02', '�����ƻ���D�A�ڤU�Ӥ�f�ŭx�@���˰e���W!', '2017-01-28 20:30:02','1');
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1024 ,2020, '�O�_�ണ�ѹ�ڰӫ~�Ϥ�?', '�A�n�A�C�@�i�ӫ~�Ϥ����O��a���ӤH�ӡA�o�ˤl���I�����D��ګ~��C�O�_�ഫ�¾L�ߪ��Ӥ��W�өO??', '2017-02-01 12:20:50', '�k�H���ƻ�!���n�������D�A�p�ߧڥs�޲z���ʱ��p O��O', '2017-02-02 09:48:07','1');
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1023 ,2021, '�x�_���Ϧh�[��f?', '���o�A�ڦ�j�w�ϡA���ѭq�o�P���H�e�e�o���?����', '2017-02-08 08:30:45', '�z�n!�~���赲���A�Ὤ��q���ö�A�]�\�L�k��C', '2017-02-08 11:30:47','1');
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1020 ,2022, '��_�p�q�ʶR?', '�z�n!^^ť�H�a���_�ɤs�����u���ܦn�Y�A�i�O�ڭ̮a�G�f�W�p�A�Q�R�S�ȶR�F�@�c�Y�����A����O?', '2017-02-16 11:20:50', '�z�n!�ݨӦX�ʥ\�ॿ�n�ມ���z���ݨD�A�ڭ̮a�]�A�γ�!�i�H����L�ȤH�}�Ϋ��i�A�Ϊ̦ۤv�йΡC :D', '2017-02-16 19:48:07','1');



--Violation
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
	values(2002,1001,'�e�Ӫ����O�R��~�G','�ڭq�ʪ��O�R��~�G�A���G�Ӯa���M�e�g�~�G���ڡA�������B�z�@�U','2016-06-20 09:12:07','2016-06-21 10:10:10','�g�d���ݹ�A�w�N�Ӱӫ~�U�[',1);
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, TicketStatue)
	values(2001,1002,'��l���걼�F','��l�e�Ӯɳ��M���걼�F�A�o�O���Y�@���J��o�ر��ΡA�Ӹرi�F�a�I�к޲z���B�z�@�U�A���¡I','2017-01-13 19:22:35',0);
INSERT INTO Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, TicketStatue)
	VALUES(2018,1030,'��������G�A�]���B�z�h�f','�R�F�n�X���她�䤤�@����F�A�����H�L���M�wŪ���^�A�V�L�]�˦��A�����|RRRRRR','2017-02-13 14:32:07',0);
--2017/02/13 ��
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
values(2020,1024,'�o����ӹL��~','�ک�2��1��ɦb��a���ݻP�����W�߰ݬO�_�i�H���Ѱӫ~��ڹϤ��A���G�L�[���k���٫¯٭n��޲z���A�o�O���O�ӶW�L?�гB�z','2017-02-03 09:10:00','2017-02-03 10:10:10','�z�n!�ӷ|���b�O�W���o���g�d�Ҫ��T�H�W�A�w�g�n�D��R���d���ç󴫰ӫ~�Ϥ��C���±z�ϥΫȪA�t�� :)',1);
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
values(2020,1022,'���̤��A�Y�g��!','���N�Q����ȥ]�A�o���������F��F�W����s�x���A�٬��H�@�զѹ��C','2017-03-10 22:19:00','2017-03-10 23:59:10','���洲�ɹC�H�h�A���W����z���ڡC�w�O�ӭ��N�ڰh�A�������i�����G�C :)',1);
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
values(2020,1019,'�o���O�¾L��!!','���׵L�U����!����f�@�i�a�����}�ݡA�����O���尮��!���ǻ��i�H��T�~...','2017-03-11 19:22:35','2017-03-11 23:10:10','�z�n!�P�Τ��w���ΤͤϬM�ӫ~���D�A�ڭ̤w�N��a�I�H���v�B���A������p�A���C�̺C�o��ѴN��b�z���b�ᤤ����h���o�C���±z�ϥΫȪA�t�� :)',1);


--ChatRoom
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1001,1004,'�аݾ�l�@��h�ֿ��H','2016-12-26 08:15:50');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1004,1004,'�@����35����~~','2016-12-26 09:11:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1002,1003,'�~�G���{�f�ܡH�H�H','2016-12-28 18:22:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1003,1002,'�ثe�f�ܥR���A�w��U�q��^^','2016-12-28 20:11:07');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'�b�v','2017-02-09 14:47:52');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'���������H��','2017-02-09 14:48:12');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'�b�v','2017-02-09 14:49:03');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'�b�v','2017-02-09 14:49:04');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'�b�v','2017-02-09 14:49:05');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'�b�v�b�v�b�v�b�v�b�v�b�v�b�v�b�v�b�v�b�v�b�v','2017-02-09 14:50:42');
--2017/02/13 ��
--1027��t�B �w�g���h�p�A��� �b��ѫǤW�� 1026�B���u �Q���~
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1027,1026,'�o�ǥx�W�J�A�~�M�ѯ}�ڪ�ɫ�ǡC','2017-03-12 08:15:50');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1026,1027,'�ګn�䪺�ئ@�W�@���N�b�����ʤF����F�A�H���Ȭw�H�ܦn�F�ܫ°�?','2017-03-12 08:16:10');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1027,1026,'���̤�!�F�o�F�����{����A�F���F�x�W��m�� O��O','2017-03-12 08:22:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1026,1027,'�A�٬O����h�@�h�A���ӧJ���i�L�c��ڳܤU�ȯ��a����C','2017-03-12 09:11:07');


--Msg
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1002,1004,'�аݨ~�G��ɷ|�X�f�H','�̪�n�Q�Y�~�G�A�аݦ�ɦ��f�O�H','2017-01-23 09:07:43',0);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1031,'�аݤj���h�[�ব��f','���U�q�F�A�̮a���她�A�аݤj������ɭԯব��O??�ګܫ���U������!!!','2017-03-08 18:04:11',0);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1032,'�����她�a�F','�A�̦��@���她�Pı�ڥ��N�a�F!!!�W�Ű������S�����D�`���Y!!!�ڭn�D�h�f�B�z!!!���M���|�A��!!!','2017-02-08 11:14:22',1);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1033,'�аݤ���ɭԦ��U�@��f','�ܦn�Y�A�ٷQ�R�A�аݧA�̤���ɭ��٦��f?','2017-01-22 12:22:39',1);	
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1033,1030,'�U�@��她�w�p02/02��f','�P�±z������P���y~~~�U�@��她�N��02/02��f�A������ݭn�w���H�ɻP�ڭ��pô��0.<','2017-01-22 21:55:11',1);	
--2017/02/13 �� 
--1022���p�� �P 1028 ������
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1022,1028,'�ڴd�r!','������A�u�O�Q�����v�H���¾L�ߡA�o���H�F�F���A���F���O�H','2017-03-23 21:07:43',0);
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1028,1022,'�O�ˤߡA�L�ߧڤ]��','�ũn�֧O���F�A�����Q�^�ӧa?���ˤF�A�A��F�N���A�Q�R�����G�]�O�C�ڭ̮a�w�g�b����F�A�æ����n�q���������¾L�ߡA�b�x�W���g�[�رo�_��!�U�Ӥ뻡���w�N��}����F�C','2017-03-24 10:14:26',0);
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1022,1028,'�٬O�p����','���f�f�G�M�O�ڪ����ߡC���p�ɯŤp�A�F�A�ӧڮa�a�C���ڳ̪�R�F�k��i���h���s�A��p�@�_�~���C','2017-03-24 12:14:10',0);
	
--Unit
--INSERT INTO Unit (UnitName) VALUES ('�c');
--INSERT INTO Unit (UnitName) VALUES ('��');
--INSERT INTO Unit (UnitName) VALUES ('��');
--INSERT INTO Unit (UnitName) VALUES ('����');

