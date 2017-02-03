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
DROP TABLE ProductStatus
DROP TABLE Farmer
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
)
GO

CREATE TABLE Farmer (
	FarmerID varchar(10) PRIMARY KEY NOT NULL, 
	MemberID int REFERENCES Member(MemberID) NOT NULL,
	FarmerIntro varchar(600),
)
GO

CREATE TABLE ProductType(
	ProductTypeID int IDENTITY(2101,1) NOT NULL PRIMARY KEY,
	Type nvarchar(10),
)
GO

CREATE TABLE ProductStatus(
	ProductStatusID int IDENTITY(2501,1) NOT NULL PRIMARY KEY,
	ProductStatusName nvarchar(10),
)
GO

CREATE TABLE Product(
	ProductID int IDENTITY(2001,1) NOT NULL PRIMARY KEY,
	SellerID int REFERENCES Member (MemberID) NOT NULL,
	Origin nvarchar(10),
	ProductName nvarchar(40),
	Inventory int,
	Price int,
	Unit varchar(10),
	ProductTypeID int REFERENCES ProductType(ProductTypeID),
	ProductIntro nvarchar(600),
	Freight int,
	AddDate datetime,
	RemoveEstDate datetime,
	RemoveDate datetime,
	ProductStatusID int REFERENCES ProductStatus(ProductStatusID),
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
	ShipPostalCode char(3),
	ShipDistrict nchar(10),
	ShipAddress nvarchar(50) ,
	OrderStatusID int REFERENCES OrderStatus (OrderStatusID),
	RatingBuyer int,
	RatingSeller int,
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
	ReportedID int REFERENCES Member (MemberID) NOT NULL, 
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
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('a001','password','會員A',235,'新北市中和區','會員A的家','0911111111','memberA@gmail.com','A111111111','1990-01-01','M',1,0);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('b001','password','會員B',106,'台北市大安區','會員B的家','0922222222','memberB@gmail.com','B222222222','1988-02-02','F',1,10);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('c002','password','小農A',367,'苗栗縣三義鄉','小農A的家','0933333333','memberA@gmail.com','A333333333','1944-04-04','M',2,100);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('d002','password','小農B',904,'屏東縣九如鄉','小農B的家','0944444444','memberB@gmail.com','B444444444','1955-05-05','M',2,30);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('c001','password','會員C',106,'台北市大安區','會員C的家','0933333333','memberB@gmail.com','C222222222','1988-02-02','F',1,10);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('d001','password','會員D',106,'台北市大安區','會員D的家','0944444444','memberB@gmail.com','D222222222','1988-02-02','F',1,10);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('e001','password','會員E',106,'台北市大安區','會員E的家','0955555555','memberB@gmail.com','E222222222','1988-02-02','F',1,10);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('f001','password','會員F',106,'台北市大安區','會員F的家','0966666666','memberB@gmail.com','F222222222','1988-02-02','F',1,10);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('c002','password','小農C',367,'苗栗縣三義鄉','小農C的家','0933333333','memberC@gmail.com','C333333333','1944-04-04','M',2,100);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('d002','password','小農D',904,'屏東縣九如鄉','小農D的家','0944444444','memberD@gmail.com','D444444444','1955-05-05','M',2,30);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('micky','123','米小鼠',555,'南投縣魚池鄉','埔尾路215號','0912345678','micky@gmail.com','M125943647','1962-08-25','M',2,126);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating)
	VALUES ('kitty','123','凱蒂貓',973,'花蓮縣吉安鄉','慈雲路52號','0987416423','kitty@gmail.com','U235974118','1973-06-16','M',2,95);



--Farmer
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000001', 1003, '小農A種橘子');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000002', 1004, '小農B種愛文芒果');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000003', 1009, '小農C種');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000004', 1010, '小農D種');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000005', 1011, '米小鼠南投田園農莊');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('Z000000005', 1012, '花蓮吉安凱蒂貓觀光果園');

--ProductType
INSERT INTO ProductType (Type) VALUES ('仁果類');
INSERT INTO ProductType (Type) VALUES ('核果類');
INSERT INTO ProductType (Type) VALUES ('堅果類');
INSERT INTO ProductType (Type) VALUES ('漿果類');
INSERT INTO ProductType (Type) VALUES ('柑橘類');
INSERT INTO ProductType (Type) VALUES ('瓜類');
INSERT INTO ProductType (Type) VALUES ('根菜類');
INSERT INTO ProductType (Type) VALUES ('莖菜類');
INSERT INTO ProductType (Type) VALUES ('花菜類');
INSERT INTO ProductType (Type) VALUES ('果菜類');
INSERT INTO ProductType (Type) VALUES ('葉菜類');
INSERT INTO ProductType (Type) VALUES ('香辛類');
INSERT INTO ProductType (Type) VALUES ('菌藻類');

--ProductStatus
INSERT INTO ProductStatus (ProductStatusName) VALUES ('上架');
INSERT INTO ProductStatus (ProductStatusName) VALUES ('下架');
INSERT INTO ProductStatus (ProductStatusName) VALUES ('封鎖');

--Product
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1003, '苗栗縣三義鄉', '橘子', 200, 35, '公斤', 2105, '最少6公斤出貨很甜很多汁', 10, '2017-01-20', '2017-03-20', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1004, '屏東縣九如鄉', '愛文芒果', 100, 600, '箱', 2102, '每箱10斤不甜不要錢', 100, '2016-06-05', '2016-07-25', 2502);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1009, 'C', 'C', 100, 600, '箱', 2102, 'C', 100, '2016-06-05', '2016-07-25', 2502);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1010, 'D', 'D', 100, 600, '箱', 2102, 'D', 100, '2016-06-05', '2016-07-25', 2502);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1012, '花蓮縣吉安鄉', '白柚', 0, 30, '斤', 2105, '快來搶購今年最後的柚子喔，最少10斤出貨!!', 10, '2016-08-18', '2016-11-31', 2502);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1011, '南投縣魚池鄉', '豆芽菜', 300, 250, '箱', 2111, '鮮脆可口的豆芽菜，長期供應', 80, '2016-12-05', '2017-05-25', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1012, '花蓮縣吉安鄉', '葡萄', 300, 70, '斤', 2102, '好吃的巨峰葡萄，5斤出貨', 10, '2016-12-25', '2017-02-17', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1011, '南投縣魚池鄉', '金針菇', 75, 350, '箱', 2111, '過年火鍋必備金針菇，10斤裝', 80, '2017-01-10', '2017-03-25', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1003, '苗栗縣三義鄉', '柳橙', 400, 45, '公斤', 2105, '最少6公斤出貨，鮮甜美味', 10, '2017-01-18', '2017-05-03', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1003, '苗栗縣三義鄉', '蘋果', 200, 50, '公斤', 2102, '最少5公斤出貨，鬆脆好吃喔', 10, '2017-01-22', '2017-04-21', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1011, '南投縣魚池鄉', '馬鈴薯', 35, 500, '箱', 2107, '馬鈴薯一箱20斤，年後出貨', 100, '2017-01-26', '2017-03-18', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1003, '苗栗縣三義鄉', '草莓', 30, 600, '箱', 2104, '會小心保護避免碰撞，10斤裝', 100, '2017-02-01', '2017-03-31', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1011, '南投縣魚池鄉', '高麗菜', 75, 300, '箱', 2111, '高麗菜大跌價，請一起幫幫菜農', 80, '2017-02-02', '2017-03-25', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1011, '南投縣魚池鄉', '地瓜葉', 50, 300, '箱', 2111, '大分量地瓜葉，歡迎機關團體直接批貨', 80, '2017-02-05', '2017-04-05', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1012, '花蓮縣吉安鄉', '櫻桃', 20, 800, '箱', 2102, '過年應景水果，保證大顆又好吃喔', 100, '2017-01-11', '2017-02-28', 2501);
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeID, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusID) 
	VALUES (1012, '花蓮縣吉安鄉', '開心果', 200, 280, '斤', 2102, '過年就是要開心果，三斤出貨喔', 20, '2017-01-03', '2017-02-17', 2501);




--ProductDiscount
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2001,10,15,540 );
INSERT INTO ProductDiscount (ProductID, MinThreshold, MaxThreshold,DiscountPrice)
	VALUES ( 2002,10,15,34 );

--ProductPic
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2001,null,'橘子的照片1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2001,null,'橘子的照片2' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,null,'芒果的照片1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,null,'芒果的照片2' );

--ProductTrackProduct
INSERT INTO TrackProduct (MemberID, ProductID, TrackDate)
	VALUES ( 1001,2001,'2017-01-21' );
INSERT INTO OrderStatus (OrderStatusName) values('未付款')
INSERT INTO OrderStatus (OrderStatusName) values('已付款')
INSERT INTO OrderStatus (OrderStatusName) values('出貨中')
INSERT INTO OrderStatus (OrderStatusName) values('已出貨')

--Orders
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1001 , 1003 , 200,900,'2017-01-03 20:51:29','2017-01-06 13:20:01','會員A',235,'新北市中和區','會員A的家',3104, 5 , 5);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1001 , 1003 , 200,1400,'2017-01-15 18:20:05','2017-01-20 11:48:32','會員A',235,'新北市中和區','會員A的家',3103, 5, null);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1002 , 1003 ,400, 2550,'2017-01-23 09:02:31','2017-01-25 15:13:21','會員B',106,'台北市大安區','會員B的家',3101,null,null);

--OrderDetail
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3001,2001,'公斤',35,20,200);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3002,2002,'箱',600,2,200);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3003,2001,'公斤',35,10,100);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3003,2002,'箱',600,3,300);

--MiscVia
INSERT INTO MiscVia (MiscViaWay) VALUES ('不收');
INSERT INTO MiscVia (MiscViaWay) VALUES ('依人頭');
INSERT INTO MiscVia (MiscViaWay) VALUES ('依比例');

--JPStatus
INSERT INTO JPStatus (JPStatusName) VALUES ('審核中');
INSERT INTO JPStatus (JPStatusName) VALUES ('已審核');
INSERT INTO JPStatus (JPStatusName) VALUES ('已開團');
INSERT INTO JPStatus (JPStatusName) VALUES ('已成團');
INSERT INTO JPStatus (JPStatusName) VALUES ('流團');

--JointPurchase
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate, JPLocation, JPStatusID, JPFreight, MiscViaID, Misc) 
	VALUES (1001, '好ㄘ橘子合購~3/10截止', '三義鄉名產~~聽說這批橘子超好吃超甜,想買的人快一起加入, 目標湊滿10箱拼折價喔~~~', '2017-01-15', '2017-01-25', '新北市中和區',4101,80,4202,20);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1001, '橘子合購團', '橘子合購團審核', '2017-02-20', '2017-03-20',	'台北市大安區',	4101, 200, 4201, 0);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1002, '橘子合購團', '橘子合購團開團', '2017-01-20', '2017-03-20',	'新北市板橋區',	4103, 200, 4201, 0);

--JPDetail
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight) 
	VALUES (4001, 2001, 6, 10, 1, 35, 10);

--F2F
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '捷運永安市場站出口','2017-01-31 12:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '中和遠東世紀廣場(J棟樓下全家)','2017-01-31 14:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '新北市中和區中正路753號(板信銀行門口)','2017-01-31 16:00');

--JPFollower
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1001, 4301, 4001, 100, null, '2011-11-11', 100, 'bank', 12345, 0, 0, 'haha');

--QnA
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1001 ,2001, '我想問關於收據的問題...', '請問收據可以開106年的嗎? 若這星期下訂匯款完成，1月13日前可以到貨嗎?', '2016-12-28 08:28:50', '好的，幫您安排', '2016-12-28 14:28:50','1');
insert into QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
values(1002 ,2002, '想請問關於下標付款的問題...', '請問我要訂7箱，預計何時可到貨? 價格是2800元免運嗎?', '2016-12-30 12:18:33', '您好...安排到元旦後了', '2016-12-30 18:24:09','1');

--Violation
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
values(1004,1001,'送來的不是愛文芒果','我訂購的是愛文芒果，結果商家竟然送土芒果給我，請幫忙處理一下','2016-06-20 09:12:07','2016-06-21 10:10:10','經查證屬實，已將該商品下架',1);
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, TicketStatue)
values(1003,1002,'橘子全爛掉了','橘子送來時竟然全爛掉了，這是我頭一次遇到這種情形，太誇張了吧！請管理員處理一下，謝謝！','2017-01-13 19:22:35',0);


--ChatRoom
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1001,1004,'請問橘子一斤多少錢？','2016-12-26 08:15:50');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1004,1004,'一公斤35元喔~~','2016-12-26 09:11:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1002,1003,'芒果有現貨嗎？？？','2016-12-28 18:22:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1003,1002,'目前貨很充足，歡迎下訂喔^^','2016-12-28 20:11:07');

--Msg
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1002,1004,'請問芒果何時會出貨？','最近好想吃芒果，請問何時有貨呢？','2017-01-23 09:07:43',0);
	
--Unit
--INSERT INTO Unit (UnitName) VALUES ('箱');
--INSERT INTO Unit (UnitName) VALUES ('顆');
--INSERT INTO Unit (UnitName) VALUES ('斤');
--INSERT INTO Unit (UnitName) VALUES ('公斤');

