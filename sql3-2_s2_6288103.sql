# Nopparat Pengsuk
# 6288103
# Section 2
USE  tinycollege2;
-- 26
ALTER TABLE professor
ADD email VARCHAR(100);

INSERT INTO professor(EMP_NUM,email)
VALUES 
(105,"arelle.hef@tinycollege.edu"),
(114,"gerald.gra@tinycollege.edu"),
(301,"ismael.osa@tinycollege.edu")
ON DUPLICATE KEY UPDATE
EMP_NUM = VALUES(EMP_NUM), email = VALUES(email);
-- don't use this below --
/*
UPDATE professor SET email = "arelle.hef@tinycollege.edu"
where EMP_NUM = 105;
UPDATE professor SET email = "gerald.gra@tinycollege.edu"
where EMP_NUM = 114;
UPDATE professor SET email = "ismael.osa@tinycollege.edu"
where EMP_NUM = 301;
*/
-- 27
SELECT * FROM student
WHERE month(STU_DOB) = 11;
-- 28
SELECT * FROM student
WHERE DAYOFWEEK(STU_DOB) = 5
ORDER BY DEPT_CODE;
-- 29
SELECT EMP_FNAME,EMP_LNAME, 2020-YEAR(EMP_DOB) AS "Age" FROM professor
WHERE 2020 - YEAR(EMP_DOB) > 75
ORDER BY YEAR(EMP_DOB);
-- 30
SELECT 2020 - MIN(YEAR(STU_DOB)) AS "age" FROM student;
-- 31
SELECT ROUND(AVG(STU_GPA),2) AS "AvgGPA" FROM student
WHERE STU_CLASS = 2 ;
-- 32
SELECT STU_CLASS, ROUND(AVG(STU_GPA),2) AS "AvgGPA" FROM student
GROUP BY STU_CLASS;
-- 33
SELECT DEPT_CODE, ROUND(AVG(STU_GPA),2) AS "AvgGPA" FROM student
GROUP BY DEPT_CODE;
-- 34
SELECT STU_CLASS, COUNT(*) AS "num_stu" FROM student
GROUP BY STU_CLASS;
-- 35
SELECT DEPT_CODE, COUNT(*) AS "num_stu" FROM student
GROUP BY DEPT_CODE;
-- 36
SELECT DEPT_CODE, COUNT(*) AS "num_prof" FROM professor
GROUP BY DEPT_CODE
HAVING COUNT(*) >= 2 
ORDER BY COUNT(*);
-- 37
SELECT DEPT_CODE, COUNT(*) AS "num_stu" FROM student
WHERE STU_GPA > 3
GROUP BY DEPT_CODE 
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;
-- 38
SELECT P.EMP_FNAME,P.EMP_LNAME,P.DEPT_CODE,D.DEPT_NAME,DEPT_ADDRESS FROM professor AS P
INNER JOIN department AS D ON D.DEPT_CODE = P.DEPT_CODE
# INNER JOIN department AS D ON D.EMP_NUM = P.EMP_NUM
LIMIT 8;
-- 39
SELECT S.STU_FNAME, S.STU_LNAME, E.CLASS_CODE FROM student AS S
INNER JOIN enroll AS E ON E.STU_NUM = S.STU_NUM
WHERE S.DEPT_CODE = "CIS" AND E.GRADE = "A"
ORDER BY S.STU_FNAME;
-- 40
SELECT S.STU_FNAME, S.STU_LNAME, COUNT(E.GRADE) AS "num_gradeA" FROM student AS S
INNER JOIN enroll AS E ON E.STU_NUM = S.STU_NUM
WHERE S.DEPT_CODE = "CIS" AND E.GRADE = "A"
GROUP BY S.STU_FNAME, S.STU_LNAME
ORDER BY S.STU_FNAME;
-- 41
SELECT P.EMP_FNAME, P.EMP_LNAME, COUNT(*) AS "num_advisee" FROM professor AS P
INNER JOIN student AS S ON S.EMP_NUM = P.EMP_NUM
GROUP BY P.EMP_FNAME, P.EMP_LNAME 
HAVING COUNT(*) > 3;
-- 42
SELECT class.CLASS_CODE,course.COURSE_CODE,course.COURSE_NAME,course.DEPT_CODE,class.CLASS_TIME FROM class
INNER JOIN course ON class.COURSE_CODE = course.COURSE_CODE
WHERE (course.DEPT_CODE = "CIS" AND course.COURSE_NAME LIKE "Intro.%")
GROUP BY course.COURSE_CODE;
-- 43 
SELECT  D.DEPT_CODE ,D.DEPT_NAME, COUNT(DISTINCT P.EMP_NUM) AS "num_prof", COUNT(DISTINCT S.STU_NUM) AS "num_std", 
ROUND(COUNT(DISTINCT S.STU_NUM)/COUNT(DISTINCT P.EMP_NUM),2) AS "stuprof_ratio" FROM department AS D
INNER JOIN professor AS P ON D.DEPT_CODE = P.DEPT_CODE
INNER JOIN student AS S ON S.DEPT_CODE = D.DEPT_CODE
GROUP BY D.DEPT_CODE
ORDER BY D.DEPT_CODE;
-- 44
SELECT D.DEPT_CODE, D.DEPT_NAME, CONCAT(P.EMP_FNAME," ",P.EMP_LNAME) AS "head_dept" FROM department AS D
JOIN professor AS P ON P.DEPT_CODE = D.DEPT_CODE AND D.EMP_NUM = P.EMP_NUM; 
-- 45
SELECT S.STU_NUM, S.STU_FNAME, S.STU_LNAME, COUNT(E.CREDIT) AS "total_class", SUM(E.CREDIT) AS "total_credit" FROM student AS S
INNER JOIN enroll AS E ON S.STU_NUM = E.STU_NUM
GROUP BY S.STU_NUM
HAVING COUNT(E.CREDIT) >= 6;
