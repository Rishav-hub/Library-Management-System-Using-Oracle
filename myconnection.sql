create table Branch
(
	B_ID varchar(5),
	Street varchar(50),
	City varchar(50) not null,
        primary key (B_ID)
);
INSERT INTO Branch VALUES('B01','Colaba','Mumbai');
INSERT INTO Branch VALUES('B02','Mall Road','Shimla');
INSERT INTO Branch VALUES('B03','Connaught Place','New Delhi');
INSERT INTO Branch VALUES('B04','Fort','Mumbai');
INSERT INTO Branch VALUES('B05','Tilak Road','Nagpur');

select * from Branch;

create table Staff
(
	Staff_ID varchar(5),
    	Staff_Branch_ID varchar(5),
	Staff_Name varchar(30) not null,
	Salary numeric(10, 2) check (Salary>=1000),
	Phone varchar(11) not null ,
	Street varchar(50),
       	foreign key (Staff_Branch_ID )
		references Branch(B_ID),
       	 primary key (Staff_ID)
);
INSERT INTO Staff VALUES('S01','B01','Nikhil', 3000.00,'9167180803', 'Colaba');
INSERT INTO Staff VALUES('S02','B05','Akshaya', 3040.00,'9161180803', 'Puri');
INSERT INTO Staff VALUES('S03','B02','Lokesh', 13000.00,'9110180803', 'Circular Road');
INSERT INTO Staff VALUES('S04','B03','Sonu', 373000.00,'9169870803', 'Connaught Place');
INSERT INTO Staff VALUES('S05','B04','Ria', 333000.00,'876180803', 'Fort');
INSERT INTO Staff VALUES('S06','B02','Alia', 333000.00,'9167181233', 'Tilak Road');
INSERT INTO Staff VALUES('S07','B02','Alia', 800.00,'916718233', 'Tilak Road1');



select * from Staff

create table Customer

(
        Reg_id varchar(5),
        Name varchar(50) not null,
        Email_ID varchar(30) check (Email_ID like '%@%.%'),
        City varchar(20),
        Contact varchar(15) unique check (Contact like '0%'),
        primary key(Reg_id)
);

INSERT INTO Customer VALUES('C01','Vibhanshu','9930046@gmail.com', 'New Delhi', '0902011235');
INSERT INTO Customer VALUES('C02','Rishav','rishu@gmail.com', 'Mumbai', '0831314634');
INSERT INTO Customer VALUES('C03','Pratik','pratik@gmail.com', 'Nagpur', '09038541656');
INSERT INTO Customer VALUES('C04','Vedant','ved@yahoo.com', 'Nashik', '087154526');
INSERT INTO Customer VALUES('C05','Raj','raj@yahoo.com', 'Aurangabad',  '0982562365');
INSERT INTO Customer VALUES('C06','Janhavi','janhavi@gmail.com', 'Dadar', '0782562365');
INSERT INTO Customer VALUES('C07','Somu','somu@hotmail.com', 'Thane', '0965812358');
INSERT INTO Customer VALUES('C08','Tanu','tan@redmail.com', 'Kalyan', '0736259665');


select * from Customer;

CREATE TABLE  Publisher(	
         P_ID VARCHAR(5), 
	 P_NAME VARCHAR2(100) NOT NULL, 
	 PRIMARY KEY (P_ID)	
);

INSERT INTO Publisher VALUES('P001','McGraw Hill');
INSERT INTO Publisher VALUES('P012','Techneo');
INSERT INTO Publisher VALUES('P003','Oxford');
INSERT INTO Publisher VALUES('P145','BR Patil');
INSERT INTO Publisher VALUES('P456','S Chand');
INSERT INTO Publisher VALUES('P087','Cengage');
INSERT INTO Publisher VALUES('P324','Black Swan');


create table Books
(
        ID int,
        Publisher_ID varchar(5),
        Title varchar(100),
        Author varchar(50) not null,
        ISBN varchar(30) not null unique,
        No_of_Books int check (No_of_Books >= 0),
        Foreign key (Publisher_ID) references  Publisher(P_ID),
        primary key (ID)
);

INSERT INTO Books VALUES(1001,'P003','DICTIONARY', 'ANTHONY ANDRUS','1234-4587-890-02', 20);
INSERT INTO Books VALUES(6023,'P012','DBMS', 'STEPHAN ROGERS', '2365-5698-21-230', 34);
INSERT INTO Books VALUES(3125,'P001','B.E.E', 'BALLANIS', '890-4569-7892-15',56 );
INSERT INTO Books VALUES(4659,'P456','SOCIAL STUDIES', 'H. TAUB', '6597-985-1475-88', 67);
INSERT INTO Books VALUES(5365,'P012','BIG DATA ANALYTICS', 'SARVESH TALE', '1658-987-7894-87', 78);
INSERT INTO Books VALUES(6951,'P003','TELL TALES', 'RK NARAYAN', '3210-789-48-4562', 89);
INSERT INTO Books VALUES(9999,'P087','JEE PREP', 'HC VERMA','8945-321-96-5841', 69);
INSERT INTO Books VALUES(2587,'P012','CHEMISTRY', 'SD SHETE', '9456-84-152-4587', 76);
INSERT INTO Books VALUES(6985,'P324','HISTORY', 'RAVI MADHAVI', '7452-654-364-111', 2);
INSERT INTO Books VALUES(7841,'P001','IMAGE PROCESSING', 'ALAN OPPENHEIM', '3256-56-125-4582', 12);
INSERT INTO Books VALUES(3458,'P003','MATHEMATICS', 'PETER GOMES', '0215-7894-65-324', 25);
INSERT INTO Books VALUES(2002,'P324','GEOGRAPHY', 'MUKTA PATIL', '789-9874-654-214', 35);
INSERT INTO Books VALUES(1287,'P012','LET US C', 'Y KANETKAR', '3025-456-458-364', 15);
INSERT INTO Books VALUES(9502,'P087','NEET PREP', 'DR. SUSHIL TAMBE', '458-125-985-4580', 27);
INSERT INTO Books VALUES(4589,'P001','CRYPTOGRAPHY', 'MINAL KAUR', '584-6523-156-589', 21);

select * from Books;

Create  table Issue
(
   Cust_id varchar(5),
   Book_id int,
   Issue_date date,
    Return_date date,
    B_ID varchar(5),
    S_id varchar(5),
   foreign key (B_ID) references Branch(B_ID),
   foreign key (Cust_id) references Customer(Reg_id),
   foreign key (Book_id) references Books(ID),
   foreign key (S_id) references Staff(Staff_ID),
   primary key (Cust_id, Book_id, Issue_date,B_ID)
);

INSERT INTO Issue VALUES('C01',4589,'06-Aug-2019','13-Aug-2019','B02',NULL);
INSERT INTO Issue VALUES('C02',1001,'07-Nov-2019','14-Nov-2019','B01','S02');
INSERT INTO Issue VALUES('C03',3458,'23-Jan-2019','30-Jan-2019','B03','S06');
INSERT INTO Issue VALUES('C02',2002,'17-Jun-2019','24-Jun-2019','B04',NULL);
INSERT INTO Issue VALUES('C04',2587,'18-Jul-2019','25-Jul-2019','B05','S06');
INSERT INTO Issue VALUES('C05',9999,'16-Jul-2019','23-Jul-2019','B05',NULL);
INSERT INTO Issue VALUES('C08',7841,'20-Nov-2020','27-Nov-2020','B02','S03');
INSERT INTO Issue VALUES('C06',1287,'23-Jul-2020','30-Jul-2020','B02',NULL);
INSERT INTO Issue VALUES('C06',9502,'16-Dec-2020','23-Dec-2020','B01','S01');
INSERT INTO Issue VALUES('C07',9999,'30-Jul-2020','7-Aug-2020','B01',NULL);
INSERT INTO Issue VALUES('C08',7841,'28-Jan-2021','4-Feb-2021','B03','S01');


select * from Issue;

drop table Issue;

select i.book_ID,b.Title from ISSUE i, Books b  where Issue_date between '1-aug-2019' and '31-dec-2020' and i.book_id=b.ID  order by book_Id;

select  A.S_id, count((A.Book_id))
from ISSUE A
group by A.S_id
having A.S_id in (
 select B.Staff_ID
 from Staff B
 where B.Salary >= 3000
)

update Staff
set Salary = Salary+4000
where Salary < (
	select avg(Salary)
	from Staff
    
) and Staff_Branch_ID='B02' OR Staff_Branch_ID='B03'

savepoint A
commit

select * from Staff;

select Staff.Staff_Name, Branch.City 
from Branch
left join Staff 
on Staff.Street= Branch.Street

select Staff.Staff_Name, Branch.City 
from Branch
right  join Staff 
on Staff.Street= Branch.Street

select Staff.Staff_Name, Branch.City 
from Branch
inner join Staff 
on Staff.Street= Branch.Street

SELECT *
from Branch
natural join Staff 

SELECT Staff.Staff_Name, Branch.Street FROM
Staff FULL OUTER JOIN Branch
ON Staff.Staff_Name = Branch.Street;

select Book_ID, books.Title
from issue inner join books on issue.Book_id = Books.id
where Book_ID in (
 select B.ID
 from Books B, Publisher
 where B.Publisher_ID = Publisher.P_ID and upper(Publisher.P_Name) like (upper('C%'))
);

Alter Table Branch 
rename column Street to Branch_Street;

CREATE VIEW Staff_View AS  
SELECT Issue.Cust_ID,Customer.Name, Books.ID, Books.Title, Issue.Book_id, Issue.Issue_Date, Issue.Return_date, Customer.Email_ID,Customer.Contact
FROM Issue, Customer, Books  
WHERE Issue.Book_id=Books.ID and Issue.Cust_ID=Customer.Reg_id;  

Select * from Staff_View;

CREATE VIEW Customer_View AS  
SELECT Books.Title,Books.Author,Books.No_of_Books,Publisher.P_Name
FROM Publisher, Books
WHERE Publisher.P_ID=Books.Publisher_ID;

Select * from Customer_View;

CREATE VIEW Admin_View AS  
SELECT *
FROM Staff,Branch 
WHERE Staff.Staff_Branch_ID=Branch.B_ID;

Select * from Admin_View;

select Title from Books 
GROUP BY Publisher_ID
having count(No_of_Books)>25;

select  A.S_ID,
count((A.BOOK_ID))
from ISSUE A
group by A.S_ID
having A.S_ID in (
select B.Staff_ID
from Staff B
where B.salary > 7000)

select Staff_ID, Staff_name, salary
from Staff
where salary > (
select avg(salary)
from Staff
)

select count(distinct(Book_ID))
from issue

select B.B_ID, B.City
from branch B inner join Staff E on B.B_ID = E.Staff_Branch_ID
group by B.B_ID, B.city
having avg(salary) > all(
select salary
from Staff Y
where Y.Staff_ID = 'S02' and Y.Staff_ID = 'S04' and Y.Staff_ID='S05' and Y.Staff_ID = 'S06'
)

select B.B_ID, B.City
from branch B inner join Staff E on B.B_ID = E.Staff_Branch_ID
group by B.B_ID, B.city
having avg(salary) > some(
select salary
from Staff Y
where Y.Staff_ID = 'S02' or Y.Staff_ID = 'S04' or Y.Staff_ID='S05' or Y.Staff_ID = 'S06'
)

select Title, No_of_Books
from (select Title, avg(No_of_Books) as No_of_Books
from Books
group by Title)
where No_of_Books > 25;

SELECT COUNT(ID), Publisher_ID
FROM Books
GROUP BY Publisher_ID
having COUNT(ID) >= 3;

drop table Issue;
drop table Books;
drop table Publisher;
drop table Customer;
drop table Staff;
drop table Branch;

Delete from Staff where Staff_Branch_ID='B05';

