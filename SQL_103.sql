-- wafa.h457@gmail.com
-- SQL 103
-- FOREIGN KEY

-- Use Database
USE company;

-- Create table
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
OrderDATE DATE,
Amount DECIMAL(10,2),
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

-- Create table
CREATE TABLE company_1(
Company_Id INT PRIMARY KEY,
Company_Name VARCHAR(150),
Company_City VARCHAR(100)
);

-- ادخال البيانات
INSERT INTO company_1
VALUES 
(10, 'Bag Company', 'Riyadh'),
(11, 'dress Company', 'jeddah'),
(12, 'Shoes Company', 'dammam'),
(13, 'Accessories Company', 'makkah'),
(14, 'T-Shirt Company', 'Riyadh'),
(15, 'Pants Company', 'jeddah');

-- جدول product يكون Company_Id فيه هو FOREIGN KEY
CREATE TABLE Product(
Product_Id INT NOT NULL,
Product_Name VARCHAR(225),
Company_Id INT,
PRIMARY KEY (Product_Id),
FOREIGN KEY (Company_Id) REFERENCES company_1(Company_Id)
);
/*
--  لنفترض أن لدينا جدول Products ونريد التعديل عليه وإضافة FOREIGN KEY بالشكل التالي

ALTER TABLE Products
ADD FOREIGN KEY (Company_Id) REFERENCES company(Company_Id);
*/
/*
-- ................... مفهوم العلاقات ..................
/* One to One (1:1) relationship occurs when a record 
in one table is associated with exactly one record in another tab.

One to Many relationship exists when a single record in one table (the "Parent" or "One" side) 
can be associated with multiple records in another table (the "Child" or "Many" side.

 Many to Many relationship occurs when multiple records in one table are associated with 
 multiple records in another.

*/
-- ................ JOINS ..................

-- INNER JOIN is used to combine rows from two or more tables based on a related column between them.
SELECT Customers.CustomerName, Orders.OrderID,Orders.Amount
FROM Customers
INNER JOIN Orders
on Customers.CustomerID = Orders.CustomerID;

-- LEFT OUTER JOINS returns all records from the left table and the matched records from the right table.
SELECT Customers.CustomerName, Orders.OrderID,Orders.Amount
FROM Customers
LEFT JOIN Orders
on Customers.CustomerID = Orders.CustomerID;

-- LEFT OUTER JOINS returns all records from the left table and the matched records from the right table.
SELECT Customers.CustomerName, Orders.OrderID,Orders.Amount
FROM Customers
LEFT JOIN Orders
on Customers.CustomerID = Orders.CustomerID;

-- RIGHT OUTER JOINS returns all records from the right table and the matched records from the left table.
SELECT Customers.CustomerName, Orders.OrderID,Orders.Amount
FROM Customers
RIGHT JOIN Orders
on Customers.CustomerID = Orders.CustomerID;

/*
-- CROSS JOINS produces a Cartesian Product of two tables. This means it combines every row from the first table with every row from the second table.
SELECT * // ويتم ذكر الأعمدة التي تريد إظهارها.
FROM table1 // وتذكر الجدول الأول.
CROSS JOIN table2; // ثم تذكر الجدول الثاني.
    
SELECT Colors.ColorName, Size.SizeName
FROM Sizes
CROSS JOIN Colors

-- NATURAL JOIN  automatically combines rows from two or more tables based on columns with the same name and data type.

SELECT * [column_name | *]
FROM table_Name1
NATURAL JOIN table_Name2; 
*/

-- ................ View ..................
-- يعرض بيانات محددة. لايخزن البيانات ولكن يسهل الوصول لها

-- Create VIWE
USE SecondaryـEducationـExcellence;
CREATE VIEW passed_students
AS
SELECT Student_Name, GPA
FROM Students
WHERE GPA >= 85.00;

SELECT * FROM passed_students;
-- ............................................

-- حذف VIEW
DROP VIEW passed_students;

-- ....................INDEXES.......................

/*
Clustered indexes sort and store the data rows in the table or view based on their key values.

Non-clustered index in SQL is a database structure that speeds up data 
retrieval by creating a separate list of pointers to the actual data
*/

-- إنشاء INDEXES
CREATE INDEX TeacherName
ON Teachers(Teacher_Name);

-- SHOW INDEXES عرض
SHOW INDEX FROM Teachers;

-- DROP INDEXES
DROP INDEX TeacherName ON Teachers;

-- ................... PROCEDURES ..................
/*
Stored procedure is a prepared block of SQL code that you save in the database 
so it can be reused multiple times by simply calling its name.
*/

-- Create PROCEDURE
delimiter //
CREATE PROCEDURE display_Subject()
BEGIN
SELECT * FROM Subjects;
END //

-- Call PROCEDURE
CALL display_Subject();

