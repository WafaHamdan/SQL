-- wafa.h457@gmail.com
-- SQL 102
/*
-- **************************************************
-- انشاء جدول للمعلمين
CREATE TABLE Teachers(
Teacher_ID INT PRIMARY KEY,
Teacher_Name VARCHAR(100) NOT NULL,
Birth_Date DATE,
Gender VARCHAR(20),
Email VARCHAR(100) UNIQUE,
Office_Number VARCHAR(20)
);

-- انشاء جدول للمواد
CREATE TABLE Subjects(
Subject_ID INT PRIMARY KEY,
Subject_Name VARCHAR(100) NOT NULL
);

-- انشاء جدول للطلاب 
CREATE TABLE Students(
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(100) NOT NULL,
Birth_Date DATE,
Gender VARCHAR(20),
Enrollment_Date DATE,
Students_email VARCHAR(100)UNIQUE,
Academic_Level VARCHAR(50),
Track VARCHAR(50),
GPA DECIMAL(5,2) -- This is the standard choice for percentages.
);
*/
-- **************************************************


/*

-- إدخال معلومات 30 طالب
-- إضافة عدة أسطر من البيانات للجدول مرة واحدة

INSERT INTO Students (Student_ID, Student_Name, Birth_Date, Gender, Enrollment_Date, Students_email, Academic_Level, Track, GPA) VALUES  
(1, 'Noura Mohammed', '2011-07-10', 'F', '2026-01-09', 'Noura@std.com', '1', 'Scientific', 98.45),
(2, 'Saad Al-Fahad', '2008-03-12', 'M', '2023-01-09', 'saad@std.com', '4', 'Scientific', 91.30),
(3, 'Layan Hassan', '2010-11-04', 'F', '2023-01-09', 'layan@std.com', '2', 'Scientific', 80.90),
(4, 'Omar Yassin', '2007-03-06', 'M', '2022-01-09', 'omar@std.com', '5', 'Humanities', 93.56),
(5, 'Joud Khalid', '2009-03-12', 'F', '2024-01-09', 'joud@std.com', '3', 'Humanities', 79.88),
(6, 'Amal Ibrahim', '2007-04-03', 'F', '2022-01-09', 'amal@std.com', '5', 'Humanities', 89.63),
(7, 'Naif Fahad', '2008-12-11', 'M', '2023-01-09', 'naif@std.com', '4', 'Scientific', 99.15),
(8, 'Bader Nasser', '2009-05-09', 'M', '2024-01-09', 'bader@std.com', '3', 'Scientific', 84.98),
(9, 'Shouq Mohammed', '2008-07-03', 'F', '2023-01-09', 'shouq@std.com', '4', 'Scientific', 77.58),
(10, 'Turki Abdullah', '2007-10-10', 'M', '2022-01-09', 'turki@std.com', '5', 'Humanities', 58.00),
(11, 'Fahad Al-Suwailem', '2008-08-18', 'M', '2023-01-09', 'fahad@std.com', '4', 'Scientific', 83.10),
(12, 'Mayar Saleh', '2009-12-25', 'F', '2023-01-09', 'mayar@std.com', '3', 'Humanities', 86.60),
(13, 'Sattam Raed', '2007-02-11', 'M', '2022-01-09', 'sattam@std.com', '5', 'Humanities', 91.44),
(14, 'Ghada Ali', '2008-03-01', 'F', '2023-01-09', 'ghada@std.com', '4', 'Scientific', 94.14),
(15, 'Deema Waleed', '2010-08-06', 'F', '2025-01-09', 'deema@std.com', '2', 'Scientific', 74.33),
(16, 'Ali Naif', '2011-06-28', 'M', '2026-01-09', 'Ali@std.com', '1', 'Scientific', 60.23),
(17, 'Sultan Fawaz', '2009-04-16', 'M', '2024-01-09', 'sultan@std.com', '3', 'Humanities', 85.55),
(18, 'Tala Faisal', '2010-02-23', 'F', '2025-01-09', 'tala@std.com', '2', 'Humanities', 96.35),
(19, 'Raghad Sultan', '2011-08-22', 'F', '2026-01-09', 'raghad@std.com', '1', 'Humanities', 59.96),
(20, 'Yasser Mounir', '2007-01-30', 'M', '2022-01-09', 'yasser@std.com', '5', 'Scientific', 100.00),
(21, 'Lujain Majid', '2009-11-01', 'F', '2024-01-09', 'lujain@std.com', '3', 'Humanities', 90.60),
(22, 'Rayan Hani', '2008-07-07', 'M', '2023-01-09', 'rayan@std.com', '4', 'Scientific', 75.99),
(23, 'Talal Sami', '2009-11-01', 'M', '2024-01-09', 'talal@std.com', '3', 'Scientific', 80.03),
(24, 'Nouf Mosaad', '2010-07-18', 'F', '2025-01-09', 'nouf@std.com', '2', 'Scientific', 84.13),
(25, 'Wasan Hamad', '2008-02-20', 'F', '2023-01-09', 'wasan@std.com', '4', 'Humanities', 78.83),
(26, 'Abdullah Yousef', '2010-09-11', 'M', '2025-01-09', 'abdullah@std.com', '2', 'Humanities', 54.63),
(27, 'Jawaher Fahad', '2010-09-11', 'F', '2025-01-09', 'jawaher_1@std.com', '2', 'Scientific', 93.51),
(28, 'Mansour Hazem', '2008-04-27', 'M', '2023-01-09', 'mansour@std.com', '4', 'Scientific', 58.13),
(29, 'Sadeem Turki', '2007-01-02', 'F', '2022-01-09', 'sadeem@std.com', '5', 'Scientific', 85.62),
(30, 'Waleed Tariq', '2011-08-10', 'M', '2026-01-09', 'waleed@std.com', '1', 'Scientific', 73.70),
(31, 'Ahmad Al-Zahrani', '2006-05-15', 'M', '2021-09-01', 'ahmad@std.com', '6', 'Scientific', 100.00),
(32, 'Alanoud Al-Otaibi', '2006-02-20', 'F', '2021-09-01', 'alanoud@std.com', '6', 'Scientific', 100.00),
(33, 'Abdulaziz Ghamdi', '2006-11-30', 'M', '2021-09-01', 'aziz6@std.com', '6', 'Humanities', 100.00),
(34, 'Areej Al-Harbi', '2006-08-12', 'F', '2021-09-01', 'areej@std.com', '6', 'Scientific', 100.00),
(35, 'Abdullah Khalid', '2006-03-25', 'M', '2021-09-01', 'abdullah6@std.com', '6', 'Scientific', 100.00),
(36, 'Asma Al-Shehri', '2006-10-05', 'F', '2021-09-01', 'asma@std.com', '6', 'Humanities', 100.00);
-- *****************************************************************************************
--  إدخال معلومات 6 مواد

INSERT INTO Subjects(Subject_ID,Subject_Name)
VALUES 
(501, 'Computer Science'),
(502, 'Mathematics'),
(503, 'English Language'),
(504, 'Physics'),
(505, 'Big Data'),
(506, 'Cybersecurity');

-- *****************************************************************************************

-- إدخال معلومات 10 معلمين
INSERT INTO Teachers (Teacher_ID, Teacher_Name, Birth_Date, Gender, Email, Office_Number) 
VALUES 
(101, 'Ahmed Al-Mansour', '1980-05-12', 'M', 'ahmed@school.com', 'B-12'),
(102, 'Sara Al-Shehri', '1985-08-22', 'F', 'sara@school.com', 'A-05'),
(103, 'Khaled Al-Otaibi', '1978-03-15', 'M', 'khaled@school.com', 'C-01'),
(104, 'Noura Al-Qahtani', '1990-11-30', 'F', 'noura@school.com', 'A-09'),
(105, 'Mohammed Al-Zahrani', '1982-07-19', 'M', 'mohammed@school.com', 'B-03'),
(106, 'Fatima Al-Dossari', '1988-01-25', 'F', 'fatima@school.com', 'D-10'),
(107, 'Abdulaziz Al-Ghamdi', '1975-12-05', 'M', 'aziz@school.com', 'C-04'),
(108, 'Hind Al-Baqami', '1992-06-14', 'F', 'hind@school.com', 'A-02'),
(109, 'Faisal Al-Shammar', '1984-09-09', 'M', 'faisal@school.com', 'B-15'),
(110, 'Reem Al-Harbi', '1987-04-20', 'F', 'reem@school.com', 'D-02');

*/

USE SecondaryـEducationـExcellence;
-- .................. إنشاء الجداول الجديدة (Data Definition) ..............

-- إنشاء جدول الطلاب المتفوقين (GPA > 90)
CREATE TABLE Top_Students AS
SELECT * FROM Students
WHERE GPA > 90;

-- إنشاء جدول الطلاب غير المجتازين (GPA < 60)
CREATE TABLE Failing_Students AS
SELECT * FROM Students
WHERE GPA < 60;

-- ........................ استعلامات البحث والتصفية (Filtering)................

-- عرض أسماء الطلاب التي تبدأ بحرف A
SELECT Student_Name FROM Students
WHERE Student_Name LIKE 'A%';

-- عرض أسماء الطلاب التي تتكون من 4 خانات
SELECT Student_Name FROM Students
WHERE Student_Name LIKE '____ %';

-- تطبيق AVG, MAX, MIN على المعدل التراكمي
SELECT 
AVG(GPA) AS Average_GPA, 
MAX(GPA) AS Highest_GPA, 
MIN(GPA) AS Lowest_GPA 
FROM Students;

-- حصر وعرض أسماء الطلاب المتفوقين في المستوى السادس الحاصلين على معدل تراكمي يساوي 100
SELECT Student_Name FROM Students
WHERE Academic_Level = '6' AND GPA = 100;

-- طلاب المستوى الأول (أعمارهم بين 15 و 16 سنة): (يتم حساب العمر بطرح سنة الميلاد من السنة الحالية 2026)

SELECT Student_Name FROM Students
WHERE Academic_Level = '1' 
AND (2026 - YEAR(Birth_Date)) BETWEEN 15 AND 16;

--  عدد الطلاب في المستوى 2
SELECT COUNT(*) AS Student_Count_Level_2 
FROM Students
WHERE Academic_Level = '2';

-- استعراض المسارات بدون تكرار
SELECT DISTINCT Track FROM Students;

-- ........................... الدوال النصية والرقمية (Functions)..........................

-- عرض أسماء المواد بالأحرف الكبيرة (Upper Case)
SELECT UPPER(Subject_Name) AS Subject_Name_UPPER 
FROM Subjects;

-- المتوسط الحسابي مقرباً لأصغر عدد صحيح (FLOOR)
SELECT FLOOR(AVG(GPA)) AS Rounded_Down_Average 
FROM Students;

-- تبديل M و F إلى الكلمات الكاملة (REPLACE)

SELECT 
Student_Name,
REPLACE(REPLACE(Gender, 'M', 'Male'), 'F', 'Female') AS Gender
FROM Students;

-- .............................................................
-- زيادة 5 درجات للطلاب الذين معدلهم أقل من 60
UPDATE Students
SET GPA = GPA + 5
WHERE GPA < 60;

SELECT * FROM Students;
