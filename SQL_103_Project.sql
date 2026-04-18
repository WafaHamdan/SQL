-- wafa.h457@gmail.com
-- SQL_103 Project

USE SecondaryـEducationـExcellence;

-- إنشاء علاقة بين جداول المعلمين والطلاب (حيث أن المعلم يدرّس أكثر من طالب، والطالب يقوم بتدريسه أكثر من معلم)

-- الجدول الوسيط بين المعلم والطالب (Many-to-Many)

CREATE TABLE Teacher_Student (
    Student_ID INT,
    Teacher_ID INT,
    PRIMARY KEY (Teacher_ID, Student_ID),
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (1, 101);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (2, 101);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (3, 101);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (4, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (5, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (6, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (7, 102);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (8, 102);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (9, 102);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (10, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (11, 104);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (12, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (13, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (14, 109);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (15, 109);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (16, 109);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (17, 110);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (18, 110);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (19, 110);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (20, 108);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (21, 110);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (22, 107);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (23, 107);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (24, 107);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (25, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (26, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (27, 109);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (28, 110);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (29, 110);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (30, 110);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (31, 101);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (32, 101);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (33, 103);-- Humanities
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (34, 105);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (35, 105);-- Scientific
INSERT INTO Teacher_Student (Student_ID, Teacher_ID) VALUES (36, 103);-- Humanities

/* -- لحذف البيانات 
DELETE FROM Teacher_Student 
WHERE Student_ID = 9 AND Teacher_ID = 103;
*/
-- إنشاء علاقة بين جداول المواد والمعلمين (حيث أن المعلم يقوم بتدريس مادة واحدة فقط، والمادة يقوم بتدريسها أكثر من معلم).
-- 
ALTER TABLE Teachers ADD Subject_ID INT; -- إضافة العمود
-- ADD CONSTRAINT: هو "الشرطي" الذي يقف على هذا العمود ويتأكد أن كل رقم يدخل هو رقم صحيح وموجود في جدول المواد.
ALTER TABLE Teachers
ADD CONSTRAINT fk_subject
FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID);

UPDATE Teachers 
SET Subject_ID = 501, Teacher_Name = 'أحمد المنصور'
WHERE Teacher_ID = 101;

UPDATE Teachers
SET Subject_ID = 502, Teacher_Name = 'سارة الشهري'
WHERE Teacher_ID = 102;

UPDATE Teachers
SET Subject_ID = 503, Teacher_Name = 'خالد العتيبي'
WHERE Teacher_ID = 103;

UPDATE Teachers
SET Subject_ID = 504, Teacher_Name = 'نورة القحطاني'
WHERE Teacher_ID = 104;

UPDATE Teachers
SET Subject_ID = 505, Teacher_Name = 'محمد الزهراني'
WHERE Teacher_ID = 105;

UPDATE Teachers
SET Subject_ID = 506, Teacher_Name = 'فاطمة الدوسري'
WHERE Teacher_ID = 106;

UPDATE Teachers
SET Subject_ID = 504, Teacher_Name = 'عبدالعزيز الغامدي'
WHERE Teacher_ID = 107;

UPDATE Teachers
SET Subject_ID = 505, Teacher_Name = 'هند البقمي'
WHERE Teacher_ID = 108;

UPDATE Teachers
SET Subject_ID = 502, Teacher_Name = 'فيصل الشمري'
WHERE Teacher_ID = 109;

UPDATE Teachers
SET Subject_ID = 503, Teacher_Name = 'ريم الحربي'
WHERE Teacher_ID = 110;

-- إنشاء علاقة بين جداول المواد والطلاب (حيث أن الطالب يدرس أكثر مادة، والمادة يدرسها أكثر من طالب).
-- الجدول الوسيط بين الطالب والمادة (Many-to-Many)

CREATE TABLE Student_Subject (
    Student_ID INT,
    Subject_ID INT, 
    PRIMARY KEY (Student_ID, Subject_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID) ON DELETE CASCADE
);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (1, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (2, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (3, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (4, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (5, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (6, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (4, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (5, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (6, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (7, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (8, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (9, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (10,502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (11, 505);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (12, 506);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (13, 506);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (14, 505);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (15, 505);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (16, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (17, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (18, 506);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (19,506);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (20, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (21, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (22, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (23, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (24, 505);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (25, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (26, 503);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (27, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (28, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (29, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (30, 501);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (31, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (32, 504);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (33, 506);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (34, 505);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (35, 502);
INSERT INTO Student_Subject (Student_ID, Subject_ID) VALUES (36, 506);
/* 
DELETE FROM Student_Subject 
WHERE Student_ID = 6 AND Subject_ID = 502;
*/
/*
مفتاح مركب يمنع تسجيل الطالب في نفس المادة مرتين
PRIMARY KEY (Student_ID, Subject_ID)
*/

-- ............................. PROCEDURE ......................
-- تغيير المحدد للسماح بكتابة السميكولون داخل الإجراء
DELIMITER //

CREATE PROCEDURE student_info()
BEGIN
     -- عرض اسم الطالب، واسم المادة، وكافة تفاصيل الجدول الوسيط
SELECT 
    Students.Student_Name, 
    Subjects.Subject_Name, 
    Student_Subject.* FROM Students
    -- الربط مع الجدول الوسيط (البيانات المشتركة)
JOIN Student_Subject ON Students.Student_ID = Student_Subject.Student_ID
-- الربط مع جدول المواد لجلب اسم المادة
JOIN Subjects ON Student_Subject.Subject_ID = Subjects.Subject_ID;

END //

DELIMITER ;

-- Call Procedure
CALL student_info();

-- .................................. VIWE .......................
CREATE VIEW teacher_info AS
SELECT 
    Teachers.teacher_name,     -- اسم المعلم من جدول المعلمين
    Teachers.office_number,    -- رقم المكتب من جدول المعلمين
    Subjects.subject_name      -- اسم المادة من جدول المواد
FROM Teachers
JOIN Subjects ON Teachers.subject_id = Subjects.subject_id;

SELECT * FROM teacher_info; -- عرض الـ View

DROP VIEW teacher_info; -- حذف الـ View

-- ................. INDEX ..............
-- إنشاء index باسم idx_student_name على عمود أسماء الطلاب
CREATE INDEX idx_student_name ON Students(Student_Name);

-- عرض جميع index الموجودة في جدول الطلاب
SHOW INDEX FROM Students;

-- حذف  Index
DROP INDEX idx_student_name ON Students;

