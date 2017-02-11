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
--DROP TABLE ProductStatus
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
	MemberPic varchar(100),
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
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('a001','password','會員A',235,'新北市中和區','會員A的家','0911111111','memberA@gmail.com','A111111111','1990-01-01','M',1,0,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('b001','password','會員B',106,'台北市大安區','會員B的家','0922222222','memberB@gmail.com','B222222222','1988-02-02','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('c002','password','小農A',367,'苗栗縣三義鄉','小農A的家','0933333333','memberA@gmail.com','A333333333','1944-04-04','M',2,100,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('d002','password','小農B',904,'屏東縣九如鄉','小農B的家','0944444444','memberB@gmail.com','B444444444','1955-05-05','M',2,30,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('c001','password','會員C',106,'台北市大安區','會員C的家','0933333333','memberB@gmail.com','C222222222','1988-02-02','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('d001','password','會員D',106,'台北市大安區','會員D的家','0944444444','memberB@gmail.com','D222222222','1988-02-02','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('e001','password','會員E',106,'台北市大安區','會員E的家','0955555555','memberB@gmail.com','E222222222','1988-02-02','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('f001','password','會員F',106,'台北市大安區','會員F的家','0966666666','memberB@gmail.com','F222222222','1988-02-02','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('c002','password','小農C',367,'苗栗縣三義鄉','小農C的家','0933333333','memberC@gmail.com','C333333333','1944-04-04','M',2,100,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('d002','password','小農D',904,'屏東縣九如鄉','小農D的家','0944444444','memberD@gmail.com','D444444444','1955-05-05','M',2,30,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('micky','123','米小鼠',555,'南投縣魚池鄉','埔尾路215號','0912345678','micky@gmail.com','M125943647','1962-08-25','M',2,126,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('kitty','123','凱蒂貓',973,'花蓮縣吉安鄉','慈雲路52號','0987416423','kitty@gmail.com','U235974118','1973-06-16','M',2,95,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	values ('sunmary', '123', '孫小美', 206, '基隆市七堵區', '福一街172巷22號', '0912766281', 'sunmary@gmail.com', 'C223456724', '1988-10-08', 'F',1, 25,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	values ('arrtuu', '123', '張阿土', 950, '台東縣台東市', '青海路二段581巷', '0933268953', 'arrtuu@gmail.com', 'V116456724', '1963-05-30', 'M',2, 130,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	values ('missmoney', '123', '錢夫人', 106, '台北市大安區', '臨江街40巷65號3樓', '0957923581', 'missmoney@gmail.com', 'A213583216', '1976-05-20', 'F',1, 32,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('p001','iloveopen','open將',654,'雲林縣四湖鄉','open將之家','0977777777','open@gmail.com','O177777777','1966-06-06','M',2,30,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('p002','ilovedoraemon','哆啦A夢',840,'高雄市大樹區','哆啦A夢之家','0988888888','doraemon@gmail.com','E133333333','1978-09-03','M',2,65,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('p003','ilovesonic','音速小子',238,'新北市樹林區','音速小子之家','0999000123','sonic@gmail.com','F133333333','1987-08-05','M',1,53,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('skyYo','123456','石在天',906,'屏東縣高樹鄉','中央路96號','0908997955','strongyo@gmail.com','A136854479','1988-08-08','M',1,100,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('draconicwu','123456','巫正龍',221,'新北市汐止區','新台五路一段866號','0970579136','draconicwu@gmail.com','F136854132','1996-12-23','M',1,0,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('verysilent','123456','沈曉真',266,'宜蘭縣三星鄉','尚武村健富路二段704號','0979254186','truesilence50@gmail.com','G236854479','1987-07-04','F',2,105,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('littleli','123456','李小倩',110,'台北市信義區','松山路999號','0971270920','chienchien999@gmail.com','F206854185','1998-03-06','F',2,299,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('furry','123456','陸羽晨',106,'台北市大安區','建國南路二段79巷100號','0974180520','thisrealmneedsme@gmail.com','F276854479','1992-01-01','F',1,240,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('shinhuei','123456','陳玉婷',241,'新北市三重區','中正北路111號','0947240785','tintinyuli@gmail.com','F243054423','1987-09-06','F',1,340,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('reginelu','123456','呂若仙',106,'台北市大安區','羅斯福路四段1號','0955520520','storiesuntold@gmail.com','A270012591','1994-12-23','F',1,500,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('vladpussy','123456','丁普席',106,'台北市大安區','羅斯福路三段333巷9487號','0957383322','TrumpIsMyBro@gmail.com','VP19521007','1952-10-07','F',1,10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('usaisdead','USAUSA','唐川伯',904,'台北市大安區','信義路三段134巷9487號','0940439206','ILovePutin@gmail.com','DT19460614','1946-06-14','M',2,-100,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('kitty','123456','杞蒂凱',973,'花蓮縣吉安鄉','慈雲路52號','0987416423','kitty@gmail.com','U235974118','1973-06-16','F',2,95,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('GuanGong','123456','關羽歐',807,'高雄市三民區','建工路415號','0937282706','guangong@gmail.com','E136859487','1917-01-31','M',3,1000,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('tentacool','123','馬英九',116,'台北市文山區','興隆路二段96巷15號3樓','0987416423','mamaisbest@gmail.com','A119301548','1950-07-13','M',1,-10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('walkman','123','陳水扁',721,'台南市麻豆區','磚子井33號','0957963584','ilovemoney@gmail.com','D105095174','1950-10-12','M',2,-99,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('liangrandpa','123','連戰',721,' 台南市麻豆區','安業里79之3號','0912586429','chinesegood@gmail.com','D110724799','1936-8-27','M',2,-10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('chingte','123','賴清德',721,'台南市麻豆區','磚子井137之1號','0999888777','laichingte@gmail.com','D184618560','1959-10-6','M',2,-10,null);
INSERT INTO Member (Account, Password, Name, PostalCode, District, Address, Phone, Email, IDNumber, BirthDate, Gender, IDType, Rating, MemberPic)
	VALUES ('english','123','蔡英文',234,'新北市永和區','環河東路四段106號10樓','0941558778','greatamerica@gmail.com','L219759723','1956-08-31','F',1,-80,null);

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
	VALUES ('Z000000006', 1012, '花蓮吉安凱蒂貓觀光果園');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('N261870375', 1031, '阿扁貪汙...兼賣文旦');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('S185803332', 1032, '連爺爺文旦');
INSERT INTO Farmer (FarmerID, MemberID,	FarmerIntro)
	VALUES ('J166180504', 1033, '賴清德也可以賣文旦喔糾咪');

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
INSERT INTO ProductType (Type) VALUES ('菌藻類');
INSERT INTO ProductType (Type) VALUES ('豆類');

--ProductStatus
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('上架');
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('下架');
--INSERT INTO ProductStatus (ProductStatusName) VALUES ('封鎖');

--Product
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, ProductStatusName) 
	VALUES (1003, '苗栗縣三義鄉', '橘子', 200, 35, '公斤', '柑橘類', '最少6公斤出貨很甜很多汁', 10, '2017-01-20', '2017-03-20', '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1004, '屏東縣九如鄉', '愛文芒果', 100, 600, '箱', '核果類', '每箱10斤不甜不要錢', 100, '2016-06-05', '2016-07-20', '2016-07-25', '下架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1009, 'C', 'C', 100, 600, '箱', '核果類', 'C', 100, '2016-06-05', '2016-07-20', '2016-07-25', '下架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1010, 'D', 'D', 100, 600, '箱', '核果類', 'D', 100, '2016-06-05', '2016-07-20', '2016-07-25', '下架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '花蓮縣吉安鄉', '白柚', 0, 30, '斤', '柑橘類', '快來搶購今年最後的柚子喔，最少10斤出貨!!', 10, '2016-08-18', '2016-11-30', '2016-11-30', '下架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '南投縣魚池鄉', '花椰菜', 60, 350, '箱', '花菜類', '好吃便宜花椰菜，10斤裝', 80, '2016-12-05', '2017-05-25', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '花蓮縣吉安鄉', '葡萄', 300, 70, '斤', '漿果類', '好吃的巨峰葡萄，5斤出貨', 10, '2016-12-25', '2017-02-17', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '南投縣魚池鄉', '金針菇', 60, 350, '箱', '菌藻類', '過年火鍋圍爐，必備金針菇', 80, '2017-01-10', '2017-03-25', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '苗栗縣三義鄉', '柳橙', 400, 45, '公斤', '柑橘類', '最少6公斤出貨，鮮甜美味', 10, '2017-01-18', '2017-05-03', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '苗栗縣三義鄉', '蘋果', 200, 50, '公斤', '仁果類', '一天一天蘋果，醫生遠離我', 10, '2017-01-22', '2017-04-21', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '南投縣魚池鄉', '馬鈴薯', 35, 500, '箱', '根菜類', '馬鈴薯一箱20斤，年後出貨', 100, '2017-01-26', '2017-03-18', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1003, '苗栗縣三義鄉', '草莓', 30, 600, '箱', '漿果類', '會小心保護避免碰撞，10斤裝', 100, '2017-02-01', '2017-03-31', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '南投縣魚池鄉', '高麗菜', 75, 300, '箱', '葉菜類', '高麗菜大跌價，請一起幫幫菜農', 80, '2017-02-02', '2017-03-25', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1011, '南投縣魚池鄉', '地瓜葉', 50, 300, '箱', '葉菜類', '大分量地瓜葉，歡迎機關團體直接批貨', 80, '2017-02-05', '2017-04-05', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '花蓮縣吉安鄉', '櫻桃', 20, 800, '箱', '核果類', '過年應景水果，保證大顆又好吃喔', 100, '2017-01-11', '2017-02-28', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1012, '花蓮縣吉安鄉', '開心果', 200, 280, '斤', '堅果類', '過年就是要開心果，三斤出貨喔', 20, '2017-01-03', '2017-02-17', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1031, '台南市麻豆區', '文旦', 300, 100, '顆', '柑橘類', '產地自售中秋節送禮品味最佳的季節產品，邊賞月邊吃文旦～最能感受中秋節氣息', 10, '2017-08-10', '2017-10-30', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1032, '台南市麻豆區', '文旦', 400, 110, '顆', '柑橘類', '中秋節送禮最佳的伴手禮～賞月一定要來一顆啦!!', 10, '2017-08-20', '2017-09-30', null, '上架');
INSERT INTO Product (SellerID, Origin, ProductName, Inventory, Price, Unit, ProductTypeName, ProductIntro, Freight, AddDate, RemoveEstDate, RemoveDate, ProductStatusName) 
	VALUES (1033, '台南市麻豆區', '文旦', 350, 105, '顆', '柑橘類', '堅持草生栽培管理且通過安全蔬果吉園圃認證，所產出的果實汁多肉嫩還帶有甘甜的滋味，消費者可安心食用!', 5, '2017-08-01', '2017-10-05', null, '上架');

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
	VALUES ( 2001,'2401.jpg','橘子的照片1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2001,'2402.jpg','橘子的照片2' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,'2403.jpg','芒果的照片1' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2002,'2404.jpg','芒果的照片2' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2003,'2405.jpg',null );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2004,'2406.jpg',null );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2005,'2407.jpg','汁多味美的白柚' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2006,'2408.jpg','綠色花椰菜抗癌喔' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2007,'2409.jpg','葡萄架上的葡萄' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2008,'2410.jpg','火鍋店必備金針菇' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2009,'2411.jpg','送禮也很大方' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2010,'2412.jpg','一天一天蘋果，醫生遠離我' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2011,'2413.jpg','在地的馬鈴薯' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2012,'2414.jpg','新鮮現摘的草莓' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2013,'2415.jpg','冬天高麗菜鮮甜美味' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2014,'2416.jpg','地瓜葉田' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2015,'2417.jpg','櫻桃送禮超大方' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2016,'2418.jpg','年節必備開心果' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2017,'2419.jpg','又甜又好吃的文旦' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2017,'2420.jpg','新鮮好吃的文旦' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2018,'2421.jpg','中秋最佳伴手禮' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2018,'2422.jpg','不甜不要錢～吃過就知道' );
INSERT INTO ProductPic ( ProductID, PictureName,PictureIntro)
	VALUES ( 2019,'2423.jpg','好吃文旦跳樓大拍賣ing' );

--ProductTrackProduct
INSERT INTO TrackProduct (MemberID, ProductID, TrackDate)
	VALUES ( 1001,2001,'2017-01-21' );
INSERT INTO OrderStatus (OrderStatusName) values('未付款')
INSERT INTO OrderStatus (OrderStatusName) values('已付款')
INSERT INTO OrderStatus (OrderStatusName) values('出貨中')
INSERT INTO OrderStatus (OrderStatusName) values('已出貨')

--Orders
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1001 , 1003 , 200,900,'2017-01-03 20:51:29','2017-01-06 13:20:01','會員A',235,'新北市中和區','會員A的家',3104, 1 , 1);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1001 , 1003 , 200,1400,'2017-01-15 18:20:05','2017-01-20 11:48:32','會員A',235,'新北市中和區','會員A的家',3103, 1, null);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1002 , 1003 ,400, 2550,'2017-01-23 09:02:31','2017-01-25 15:13:21','會員B',106,'台北市大安區','會員B的家',3101,null,null);
INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1030 , 1031 ,80, 800,'2017-03-08 17:42:51',null,'馬英九',116,'台北市文山區','興隆路二段96巷15號3樓',3103,null,null);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1030 , 1032 ,50, 550,'2017-01-31 12:42:17','2017-02-01 17:22:34','馬英九',116,'台北市文山區','興隆路二段96巷15號3樓',3104,1,-1);
 INSERT INTO Orders ( SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller)
	VALUES (1030 , 1033 ,30, 630,'2017-01-10 00:08:53','2017-01-14 15:32:47','馬英九',116,'台北市文山區','興隆路二段96巷15號3樓',3104,1,1);

--OrderDetail
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3001,2001,'公斤',35,20,200);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3002,2002,'箱',600,2,200);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3003,2001,'公斤',35,10,100);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3003,2002,'箱',600,3,300);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3004,2017,'顆',100,8,10);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3005,2018,'顆',100,5,10);
Insert into OrderDetail (OrderID, ProductID, Unit, UnitPrice, OrderQuantity, UnitFreight)values (3006,2019,'顆',105,6,5);

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
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '買個文旦 快速團~~湊滿20顆就衝囉~~不能配合勿跟', '這家文旦真的超好吃  吃了還想再吃 吃了還想再吃 吃了還想再吃 吃了還想再吃 吃了還想再吃 趕快來跟團八!!!', '2017-02-10', '2017-02-17',	'台北市文山區',	4104, 100, 4202, 10);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '突然好想吃蘋果~快來一起買蘋果ㄅ', '要5斤才出貨~~所以5斤就不收囉 快來一起吃蘋果美容ㄅ', '2017-03-01', '2017-03-10',	'台北市文山區',	4103, 0, 4201, 0);
INSERT INTO JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate,	JPLocation,	JPStatusID,	JPFreight, MiscViaID, Misc)
	VALUES (1030, '草莓合購，最少湊一箱!!!', '合購草莓最少湊滿1箱，每箱10斤，最多3箱就不收囉，要跟要快~~~', '2017-02-28', '2017-03-07',	'台北市文山區',	4104, 300, 4201, 0);

--JPDetail
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4001, 2001, 6, 10, 1, 35, 10,'公斤');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4004, 2019, 20, 20, 1, 97, 10,'顆');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4005, 2010, 5, 5, 1, 50, 10,'公斤');
INSERT INTO JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight,JPUnit) 
	VALUES (4006, 2009, 1, 3, 1, 60, 10,'公斤');

--F2F
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '捷運永安市場站出口','2017-01-31 12:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '中和遠東世紀廣場(J棟樓下全家)','2017-01-31 14:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4001, '新北市中和區中正路753號(板信銀行門口)','2017-01-31 16:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '政大麥側','2017-02-25 16:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '考試院門口','2017-02-25 17:00');
INSERT INTO F2FDetail (JPID, F2FPlace, F2FTime) VALUES (4004, '景美女中校門口','2017-02-25 18:00');

--JPFollower
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1001, 4301, 4001, 100, null, '2011-11-11', 100, 'bank', 12345, 0, 0, '感謝主購');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1032, 4302, 4003, 100, null, '2011-12-12', 100, '中國信託', 33333, 0, 0, 'You are my Sunshine');
INSERT INTO JPFollower (MemberID, F2FID, JPID, TotalPrice, RemittanceStatus, RemittanceDate, Remittance, RemittanceBank, RemittanceAcc, Misc, SplitFreight, Notes) 
	VALUES (1030, 4304, 4005, 100, null, '2017-03-31', 100, '台北富邦', 74125, 0, 0, '天使!!');

--JPFollowerDetail
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4402, 2019, 3, 291);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4403, 2002, 4, 80);
INSERT INTO JPFollowerDetail (JPFollowerID, ProductID, Quantity, Price) VALUES (4401, 2007, 9, 180);

--QnA
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	values(1001 ,2001, '我想問關於收據的問題...', '請問收據可以開106年的嗎? 若這星期下訂匯款完成，1月13日前可以到貨嗎?', '2016-12-28 08:28:50', '好的，幫您安排', '2016-12-28 14:28:50','1');
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	values(1002 ,2002, '想請問關於下標付款的問題...', '請問我要訂7箱，預計何時可到貨? 價格是2800元免運嗎?', '2016-12-30 12:18:33', '您好...安排到元旦後了', '2016-12-30 18:24:09','1');
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1030 ,2019, null, '請問買20ㄎ可不可以折扣多一點', '2016-02-03 18:00:42', '目前20顆的價格請您參考我們網站上提供的折扣喔', '2016-02-03 18:12:44',1);
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1031 ,2019, null, '你媽知道你在賣文旦嗎', '2016-03-09 19:52:24', null, null,0);
INSERT INTO QnA(QueryID, ProductID, QnATitle, QnAContent, QueryDate, ReQnA, ReDate, ReStatus)
	VALUES(1011 ,2019, null, '請問這批文旦大概可以放到多久', '2016-03-01 21:33:07', '您好，出貨後約可放四週，未免影響新鮮風味，還請盡快食用，感謝您', '2016-03-02 08:22:43',1);

--Violation
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, ProcessDate, TicketResult, TicketStatue)
	values(1004,1001,'送來的不是愛文芒果','我訂購的是愛文芒果，結果商家竟然送土芒果給我，請幫忙處理一下','2016-06-20 09:12:07','2016-06-21 10:10:10','經查證屬實，已將該商品下架',1);
insert into Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, TicketStatue)
	values(1003,1002,'橘子全爛掉了','橘子送來時竟然全爛掉了，這是我頭一次遇到這種情形，太誇張了吧！請管理員處理一下，謝謝！','2017-01-13 19:22:35',0);
INSERT INTO Violation(ReportedID, ReporterID, VioTitle, VioContent, CreateDate, TicketStatue)
	VALUES(1030,1032,'收到爛水果，也不處理退貨','買了好幾顆文旦其中一顆爛了，站內信他竟然已讀不回，敲他也裝死，怒檢舉RRRRRR','2017-02-13 14:32:07',0);


--ChatRoom
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1001,1004,'請問橘子一斤多少錢？','2016-12-26 08:15:50');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1004,1004,'一公斤35元喔~~','2016-12-26 09:11:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1002,1003,'芒果有現貨嗎？？？','2016-12-28 18:22:30');
insert into ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	values(1003,1002,'目前貨很充足，歡迎下訂喔^^','2016-12-28 20:11:07');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'在ㄇ','2017-02-09 14:47:52');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'有收站內信嗎','2017-02-09 14:48:12');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'在ㄇ','2017-02-09 14:49:03');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'在ㄇ','2017-02-09 14:49:04');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'在ㄇ','2017-02-09 14:49:05');
INSERT INTO ChatRoom(WriterID, ReaderID, ChatMsgContent, ChatMsgTime)
	VALUES(1030,1032,'在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ在ㄇ','2017-02-09 14:50:42');

--Msg
insert into Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
values(1002,1004,'請問芒果何時會出貨？','最近好想吃芒果，請問何時有貨呢？','2017-01-23 09:07:43',0);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1031,'請問大概多久能收到貨','剛剛下訂了你們家的文旦，請問大概什麼時候能收到呢??我很急拜託幫幫忙!!!','2017-03-08 18:04:11',0);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1032,'有顆文旦壞了','你們有一顆文旦感覺根本就壞了!!!超級乾完全沒水份非常難吃!!!我要求退貨處理!!!不然檢舉你喔!!!','2017-02-08 11:14:22',1);
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1030,1033,'請問什麼時候有下一批貨','很好吃，還想買，請問你們什麼時候還有貨?','2017-01-22 12:22:39',1);	
INSERT INTO Msg(MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus)
	VALUES(1033,1030,'下一批文旦預計02/02到貨','感謝您的支持與鼓勵~~~下一批文旦將於02/02到貨，有任何需要歡迎隨時與我們聯繫喔0.<','2017-01-22 21:55:11',1);	
	
--Unit
--INSERT INTO Unit (UnitName) VALUES ('箱');
--INSERT INTO Unit (UnitName) VALUES ('顆');
--INSERT INTO Unit (UnitName) VALUES ('斤');
--INSERT INTO Unit (UnitName) VALUES ('公斤');

