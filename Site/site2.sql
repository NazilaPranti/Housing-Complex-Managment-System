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


INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(6,'Jahangir Alam', '01931046410', 'Businessman');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(7,'Maksud Alam',  '01711232325', 'Businessman');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(8,'Rahima  Sultana', '01521228538', 'Doctor');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(9,'Hakim Khan', '01738242936', 'Retired');
INSERT INTO MEMBER(MemberID,Name, ContactNo, Occupation)VALUES(10,'Abdul Haque',  '01836929836', 'Army' );


INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(6,'A','101', '4','',1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(7,'B1','102','2','',1);
INSERT INTO RESIDENT(MemberID,FlatNo,BuildingNo,NumberOfMember,LeavingDate,Staying)VALUES(8,'B2','102','2',TO_DATE('12/09/2017', 'dd/mm/yyyy'),0);


INSERT INTO NONRESIDENT(MemberID,hasBooked,ADDR) VALUES(9,0,'DHANMONDI');
INSERT INTO NONRESIDENT(MemberID,hasBooked,ADDR) VALUES(10,0,'GULSHAN');

INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(5,102,'B1',1,0,'290','150000','20000','95000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(6,103,'A',0,0,'280','160000','22000','96000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(7,101,'A',1,0,'280','160000','22000','96000');
INSERT INTO BUILDING(BN,BuildingNo,FlatNo,IsOccupied,IsBooked,Capacity,SPRICE,RPRICE,PaidAmount) VALUES(8,102,'B2',0,0,'280','160000','22000','96000');

INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(6,'Jan','2019',6);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(7,'Jan','2019',7);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(8,'Jan','2019',8);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(9,'feb','2019',6);
INSERT INTO RENT(RentID,Month,Year,MemberID) VALUES(10,'feb','2019',7);

INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,Gender,AGE) VALUES(4,'JASIM','01715555445','TEJGAON','security','12000','male',30);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,Gender,AGE) VALUES(5,'Jerin','01714443533','rampura','SECURITY','9000','female',32);
INSERT INTO EMPLOYEE(EmployeeID,Name,ContactNo,Addrs,Position,Salary,Gender,AGE) VALUES(6,'RAhim','01934578901','badda','Security','9000','male',28);

INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(6,'sep','2019',5,'12000');
INSERT INTO PAYROLL(PaymentID,Mnth,YR,EmployeeID,Amount) VALUES(7,'aug','2019',4,'12000');

	
COMMIT;