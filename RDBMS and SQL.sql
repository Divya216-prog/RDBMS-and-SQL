use wipro;

create table Employee (
EmployeeId int,
EmployeeName varchar(255),
EmployeeDept varchar(255),
Salary float,
Designation varchar(255)
);

SELECT * FROM employee;

create table Customers (
customerId int,
Firstname varchar(100),
Lastname varchar(100),
PhoneNumber varchar(10),
City varchar(100)
);

select * from Customers;

create table Person(
PersonId int PRIMARY KEY,
Firstname varchar(100),
Lastname varchar(100),
Age float
);
select * from Person;
INSERT INTO Person(PersonId,Firstname,Lastname,Age)VALUES(1,'Divya','Rani',22);

create table Orders(
OrderId int NOT NULL,
OrderNo int NOT NULL,
PersonId int,
PRIMARY KEY(OrderId),
FOREIGN KEY(PersonId) REFERENCES Person(PersonId)
);

select * from Orders;
INSERT INTO Orders(OrderId,OrderNo,PersonId) VALUES(11,5678,1);

INSERT INTO Person(PersonId,Firstname,Lastname,Age)VALUES(2,'Yash','Gowda',22);
INSERT INTO Person(PersonId,Firstname,Lastname,Age)VALUES(3,'Komal','A',22);
INSERT INTO Person(PersonId,Firstname,Lastname,Age)VALUES(4,'Kavana','S',22);

select * from Person 
where PersonId Between 2 and 4;

select * from Person where Firstname like'K%';

select * from Person LIMIT 2;

