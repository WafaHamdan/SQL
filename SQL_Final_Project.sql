-- Wafa ALshehri
-- wafa.h457@gmail.com
-- Final SQL Project

-- ....... ER Diagram .....
-- الكيانات (Entities) والأعمدة (Attributes)
/*
............................. Entities: 
1.  المستخدم (User):
............................. Attributes:
- User_ID:(PK).
- Email.
- Usernam
- Bio.
- Profile_Pic
- Created_At -- وقت انشاء الحساب

............................. Entities: 
2.  التغريدة (Tweet)
............................. Attributes:
- Tweet_ID (PK)
- Content
- Created_At  -- وقت النشر
- User_ID (FK)

............................. Entities: 
3. Comment
............................. Attributes:
- Comment_ID (PK)
- Content
- Created_At
- User_ID (FK)
- Tweet_ID (FK)

............................. Entities: 
4. Like - جدول وسيط
............................. Attributes:
- User_ID (FK)
- Tweet_ID (FK)

............................. Entities: 
5. المتابعة (Follows) - جدول وسيط
............................. Attributes:
- Follower_ID (FK)
- Following_ID (FK)

............................. Entities: 
6. Retweets
............................. Attributes:

- Retweet_ID (PK)
- User_ID (FK)
- Tweet_ID (FK)
- Retweet_At

-- ............. Relationships .........
User → Tweet (1:M)
User → Tweet (M:N) عبر Likes
User → Tweet (M:N) عبر Retweets
User → User (M:N) عبر Follows
Tweet → Comment (1:M)
User → Comment (1:M)

-- ..................................
*/

-- 1. إنشاء قاعدة البيانات
CREATE DATABASE Twitter_Project;
USE Twitter_Project;

-- ..................... إنشاء الجداول ........................

-- 1. جدول المستخدمين (يحتوي على البيانات الأساسية والتشفير)
CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password BINARY(64) NOT NULL, -- لتخزين كلمة المرور المشفرة
    Bio TEXT,
    Profile_Pic VARCHAR(255),-- (URL) رابط الصورة
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- إضافة الوقت تلقائياً
);

-- جدول التغريدات
CREATE TABLE Tweets (
    Tweet_ID INT PRIMARY KEY AUTO_INCREMENT,
    Content VARCHAR(280) NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

-- جدول المتابعة (علاقة Many-to-Many)
CREATE TABLE Follows (
    Follower_ID INT,
    Following_ID INT,
    PRIMARY KEY (Follower_ID, Following_ID),
    FOREIGN KEY (Follower_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Following_ID) REFERENCES Users(User_ID)
);

-- جدول الإعجابات
CREATE TABLE Likes (
    User_ID INT,
    Tweet_ID INT,
    PRIMARY KEY (User_ID, Tweet_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Tweet_ID) REFERENCES Tweets(Tweet_ID)
);

-- جدول إعادة التغريد
CREATE TABLE Retweets (
    Retweet_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Tweet_ID INT,
    Retweet_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Tweet_ID) REFERENCES Tweets(Tweet_ID)
);

-- ............................. إنشاء الـ Procedures .............................

-- 1. Procedure لإنشاء حساب جديد وتشفير كلمة المرور
DELIMITER //

CREATE PROCEDURE createAccount(
    IN p_email VARCHAR(100),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(100),
    IN p_bio TEXT,
    IN p_pic VARCHAR(255)
)
BEGIN
    INSERT INTO Users (Email, Username, Password, Bio, Profile_Pic)
    VALUES (
        p_email, 
        p_username, 
        UNHEX(SHA2(p_password, 256)), -- استخدام SHA2 بدلاً من MD5 للأمان ولتجنب الخطأ
        p_bio, 
        p_pic
    );
END //

DELIMITER ;

-- 2. Procedure للمتابعة باستخدام أسماء المستخدمين
DELIMITER //
CREATE PROCEDURE User_Follow(
    IN p_my_username VARCHAR(50),
    IN p_target_username VARCHAR(50)
)
BEGIN
    DECLARE v_my_id INT;
    DECLARE v_target_id INT;

    -- البحث عن الأرقام التسلسلية (IDs) بناءً على الأسماء
    SELECT User_ID INTO v_my_id FROM Users WHERE Username = p_my_username;
    SELECT User_ID INTO v_target_id FROM Users WHERE Username = p_target_username;

    -- الإضافة لجدول المتابعة
    INSERT INTO Follows (Follower_ID, Following_ID) VALUES (v_my_id, v_target_id);
END //
DELIMITER ;

-- ............................. تعبئة البيانات وعرضها .............................

-- إضافة مستخدمين باستخدام الـ Procedure (كلمات المرور ستشفر تلقائياً)
CALL createAccount('wafa.h@gmail.com', 'Wafa_H', 'Secret123', 'SQL Expert & AI ', 'wafa_pic.jpg');
CALL createAccount('sara@tech.com', 'Sara_Dev', 'Password456', 'I love coding!', 'sara_pic.jpg');
CALL createAccount('ahmed@web.com', 'Ahmed_99', 'Welcome789', 'Junior Developer', 'ahmed_pic.jpg');
CALL createAccount('Zina.z@gmail.com', 'Zina_12', 'A589zia12', 'Freelancer ', 'Zina_pic.jpg');
CALL createAccount('Faisal@gmail.com', 'Faisal_al', 'Pass3679fa', 'Data analyst', 'sara_pic.jpg');
CALL createAccount('Khaled@gmail.com', 'Khaled_87', 'travel00345', 'Travel the world', 'Khaled_pic.jpg');
-- تنفيذ عملية متابعة (سارة تتابع وفاء)
CALL User_Follow('Sara_Dev', 'Wafa_H');
CALL User_Follow('Ahmed_99', 'Wafa_H');
CALL User_Follow('Faisal_al', 'Khaled_87');
CALL User_Follow('Khaled_87', 'Faisal_al');

-- إضافة تغريدات
INSERT INTO Tweets (Content, User_ID) VALUES ('هذا مشروعي  تويتر الذي انتهيت منه اليوم', 1);
INSERT INTO Tweets (Content, User_ID) VALUES ('اليوم عملت على إنشاء ER Diagram', 1);
INSERT INTO Tweets (Content, User_ID) VALUES ('SQL  لغة البيانات .', 2);
INSERT INTO Tweets (Content, User_ID) VALUES ('Traveling is more than just a hobby.', 6);
INSERT INTO Tweets (Content, User_ID) VALUES ('Tableau and Power BI are the best data visualization tools to visualize your data.', 5);

-- ............................. عرض المخرجات .............................

-- عرض جميع المستخدمين
SELECT User_ID, Username, Email, Password, Created_At FROM Users;

-- عرض عدد التغريدات لمستخدم واحد فقط
SELECT Users.Username, COUNT(Tweets.Tweet_ID) AS Number_of_Tweets
FROM Users
JOIN Tweets ON Users.User_ID = Tweets.User_ID
WHERE Users.Username = 'Wafa_H'
GROUP BY Users.Username;
