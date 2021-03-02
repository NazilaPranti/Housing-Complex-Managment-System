clear screen;

DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE RESIDENT CASCADE CONSTRAINTS;
DROP TABLE NONRESIDENT CASCADE CONSTRAINTS;
DROP TABLE RENT CASCADE CONSTRAINTS;
DROP TABLE BOOKING CASCADE CONSTRAINTS;
DROP TABLE BUILDING CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE PAYROLL CASCADE CONSTRAINTS;


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
        RPRICE VARCHAR2(5),
        PaidAmount varchar2(10),
	PRIMARY KEY (BN));



CREATE TABLE EMPLOYEE(
	EmployeeID INT,
	Name VARCHAR2(5) ,
	ContactNo VARCHAR(11),
	Addrs VARCHAR2(8),
	Position VARCHAR2(8),
	Salary INT,
        Gender char(8),
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


INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(1,'Ajijul Haque','01711732583', 'Doctor');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(2,'Maksud Alam',  '01711232325', 'Businessman');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(3,'Rahima  Sultana', '01521228538', 'Doctor');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(4,'Abdul Haque',  '01836929836', 'Army' );


INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(1,'A','101', '4','',1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(2,'B','102','2','',1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(3,'A','102','2',TO_DATE('12/01/2016', 'dd/mm/yyyy'),0);


INSERT INTO NONRESIDENT(MemberID,hasBooked,ADDR) VALUES(4,0,'DHANMONDI');


INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(1,101,'A',1,1,'300','100000','20000','98000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(2,101,'B',0,0,'320','150000','25000','97000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(3,102,'B',1,1,'280','90000','15000','94000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(4,102,'A',0,0,'290','95000','14000','93000');



INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(1,'Jan','2019',1);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(2,'Jan','2019',2);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(3,'feb','2019',1);


INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,gender,AGE) VALUES(1,'Hasan','01715555555','Badda','Security','12000','male',30);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,gender,AGE) VALUES(2,'Jerin','0171444444','Badda','Security','9000','female',28);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,gender,AGE) VALUES(3,'Helal','0171333333','Rampura','Security','9000','male',24);

INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(1,'sep','2019',1,'12000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(2,'aug','2019',1,'12000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(3,'mar','2019',2,'9000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(4,'dec','2018',3,'9000');


	
COMMIT;