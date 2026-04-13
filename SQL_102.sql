-- Wafa Alshehri
-- التعامل مع البيانات ٢ | 2 Data CRUD

-- LIKE يستخدم فقط مع الحقول النصية
-- LIKE  used in a WHERE clause to search for a specified pattern within a column's text data

USE company; 
SELECT * FROM Employee
WHERE Employee_name LIKE 'A%'; -- Filter records to find all employee names that start with the letter "A"
-- ........
SELECT * FROM Employee
WHERE Employee_name LIKE '%D';  -- Filter records to find all employee names that end with the letter "D"
-- ........
USE company; 
SELECT * FROM Employee
WHERE Employee_name LIKE 'A__'; -- Finds values starting with "A". Underscore for exactly two characters long

-- ..................................................
-- Distinct.  الاستعلام عن بيانات خالية من التكرار
-- Distinct to return only unique values from a database table

SELECT Distinct Employee_name
FROM Employee;
-- ..................................................
-- The AS command is used to rename a column or table with an alias
-- An alias only exists for the duration of the query.
-- تُستخدم AS لإنشاء اسم مستعار (Alias) مؤقت لعمود أو جدول في الاستعلام

SELECT Employee_name AS Ename
FROM Employee;
-- .......
SELECT 
Employee_salary*12 AS 'Annual Salary'
FROM Employee;
-- ..................................................
-- نسخ البيانات من جدول وإضافتها في جدول آخر

CREATE TABLE Manager
SELECT * FROM Employee WHERE Employee_salary >= 5500;

SELECT Employee_salary FROM Manager;
-- ..................................................

-- GROUP BY عرض البيانات كمجموعات

SELECT Employee_salary FROM Employee GROUP BY Employee_salary;

-- ..................................................
-- Aggregate functions: perform a calculation on a set of values from multiple rows and return a single summary value.
--  حساب متوسط قيم العمود بواسطة الدالة ()AVG

-- لمعرفة متوسط رواتب الموظفيين
SELECT AVG(Employee_salary)
FROM Employee;
-- ............

--  الاستعلام عن أكبر قيمة في العمود بواسطة الدالة ()MAX
-- لعرض اعلى راتب من رواتب الموظفيين 

SELECT MAX(Employee_salary) 
FROM Employee;

-- ...............

--  الاستعلام عن أصغر قيمة في العمود بواسطة الدالة ()MIN
-- لعرض اقل راتب من رواتب الموظفيين

SELECT MIN(Employee_salary) 
FROM Employee;
-- ...............
-- حساب ناتج جمع قيم العمود بواسطة الدالة ()SUM

SELECT SUM(Employee_bonus) 
FROM Employee;
-- ...............
--  حساب عدد أسطر الجدول بواسطة الدالة ()COUNT

SELECT COUNT(id) 
FROM Employee;
-- ..................................................

--  Numeric functions وأمثلة على بعض الدوال الرقمية
-- POW(base, exponent) 
-- POW() function returns the value of a number raised to the power of another number.

SELECT POW(3,2);

-- ABS() function returns the absolute value of a numeric expression,
-- effectively converting negative numbers into positive.

SELECT ABS(-4);

-- DIV قسمة

SELECT 18 DIV 2;

-- ..................................................

-- String functions
-- ASCII() function in SQL returns the numeric ASCII code value for the first (leftmost) character of a string.

SELECT ASCII('A');
-- ................

-- LOWER() convert all uppercase characters in a string to lowercas.

SELECT LOWER('APPLE');

-- UPPER() converts a string to upper-case.

SELECT UPPER('apple');

-- ..................................................
--  Date functions
-- NOW() تعيد التاريخ و الوقت الحاليين لحظة التنفيذ.
-- CURDATE() تعيد تاريخ اليوم فقط.
-- CURTIME() تعيد الوقت الحالي فقط .

SELECT 
NOW() AS 'Date & Time',
CURDATE() AS 'Current Date',
CURTIME() AS 'Current Time';
-- ...................

-- YEAR(date) تعيد سنة التاريخ 
-- MONTH(date) تعيد رقم الشهر
-- DAY(date) تعيد اليوم 

SELECT join_date,
year(join_date) AS 'YEAR',
month(join_date) AS 'MONTH',
day(join_date) AS 'DAY'
FROM Employee;

