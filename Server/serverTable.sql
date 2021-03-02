clear screen;


DROP TABLE RESIDENT CASCADE CONSTRAINTS;
DROP TABLE NONRESIDENT CASCADE CONSTRAINTS;
DROP TABLE BOOKING CASCADE CONSTRAINTS;
DROP TABLE BUILDING CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE PAYROLL CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE RENT CASCADE CONSTRAINTS;



CREATE TABLE MEMBER(
	MemberID INT ,
	Name VARCHAR(30),
	ContactNo VARCHAR2(11),
	Occupation VARCHAR2(20),
	PRIMARY KEY(MemberID));



CREATE TABLE RESIDENT(
	MemberID INT ,
	FlatNo  VARCHAR(4),
	BuildingNo VARCHAR(4),
	NumberOfMember INT ,
	LeavingDate DATE DEFAULT null,
	staying INT,
	PRIMARY KEY(MemberID),
	FOREIGN KEY (MemberID) REFERENCES MEMBER (MemberID));



CREATE TABLE NONRESIDENT(
	MemberID INT,
	hasBooked INT ,
	ADDR  VARCHAR(20),
	PRIMARY KEY(MemberID),
	FOREIGN KEY (MemberID) REFERENCES MEMBER (MemberID)) ;



CREATE TABLE RENT(
	RentID INT,
	Month VARCHAR2(10) ,
	Year INT,
	MemberID INT,	
        PRIMARY KEY(RentID),
	FOREIGN KEY (MemberID) REFERENCES RESIDENT(MemberID));

CREATE TABLE BOOKING
(
	MemberID INT,
	Sell CHAR(4),
	FlatNo  VARCHAR(4) ,
	BuildingNo VARCHAR(4),
	BookingDate DATE,
	PRIMARY KEY(MemberID),
	FOREIGN KEY (MemberID) REFERENCES NONRESIDENT  (MemberID));


CREATE TABLE BUILDING(
        BN INT,
	BuildingNo INT,
	FlatNo VARCHAR2(4),
	IsOccupied INT ,
	IsBooked INT,
	Capacity INT,
	SPRICE VARCHAR2(10),
        PRICE VARCHAR2(5),
        PaidAmount varchar2(10),
	PRIMARY KEY (BN));



CREATE TABLE EMPLOYEE(
	EmployeeID INT,
	Name VARCHAR2(5) ,
	ContactNo VARCHAR(11),
	Addrs VARCHAR2(8),
	Position VARCHAR2(8),
        Gender char(8),
        Salary INT,
        AGE INT,
        PRIMARY KEY(EmployeeID));



CREATE TABLE PAYROLL(
	PaymentID INT,
	Mnth VARCHAR2(4) ,
	YR INT,
	EmployeeID INT,
	Amount INT,
        PRIMARY KEY(PaymentID),
	FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID));




INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(11,'Manis','01711732583', 'Doctor');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(12,'Ketan',  '01711232325', 'Businessman');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(13,'Sharmin', '01521228538', 'Doctor');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(14,'Robin',  '01836929836', 'Army' );


INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(11,'A','101', '4','',1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(12,'B','102','2',TO_DATE('13/07/2016', 'dd/mm/yyyy'),1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(13,'A','103','2',TO_DATE('10/07/2016', 'dd/mm/yyyy'),0);


INSERT INTO NONRESIDENT(MemberID,hasBooked,ADDR) VALUES(14,0,'KURIL');


INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,PRICE) VALUES(11,104,'A',1,0,'150','50000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,PRICE) VALUES(12,105,'B',0,0,'100','15000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,PRICE) VALUES(13,106,'B',0,1,'200','90000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,PRICE) VALUES(14,107,'A',1,1,'250','95000');



INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(11,'Jan','2019',11);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(12,'Jan','2019',12);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(13,'feb','2019',13);


INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Gender,Salary,Age) VALUES(11,'Amir','01715556755','Kuril','Guard','Male','12000',26);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Gender,Salary,Age) VALUES(12,'Jahan','0171098444','Rampura','Guard','Female','9000',35);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Gender,Salary,Age) VALUES(13,'Hamim','01713678333','Savar','Maid','Male','9000',20);

INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(11,'sep','2019',11,'22000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(12,'aug','2019',12,'20000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(13,'mar','2019',13,'1900');
	
COMMIT;

