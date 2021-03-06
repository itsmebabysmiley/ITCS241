# Nopparat Pengsuk
# 6288103
# Section 2

use `tinycollege`;
-- 1
SELECT CONCAT(EMP_FNAME,' ',EMP_LNAME), 2020 - YEAR(EMP_DOB) AS "AGE" FROM professor 
ORDER BY YEAR(EMP_DOB) ASC 
LIMIT 10;
-- 2
SELECT ROUND(AVG(STU_GPA),2) AS "Average CIS GPA" FROM student WHERE DEPT_CODE = "CIS";
-- 3
SELECT COUNT(CRS_CREDIT) AS "# OF COURSE" FROM course
WHERE CRS_CREDIT = 3 AND DEPT_CODE IN ("CIS","MATH","ENG","BIOL");
-- 4
SELECT DEPT_CODE, COUNT(STU_NUM) AS "Total # of Students" FROM student
WHERE DEPT_CODE IN ("CIS", "MATH", "BIOL", "ENG")
GROUP BY DEPT_CODE ;
-- 5
SELECT DEPT_CODE, ROUND(AVG(STU_GPA),2) AS  "Average GPA" FROM student
GROUP BY DEPT_CODE
ORDER BY ROUND(AVG(STU_GPA),2) DESC;
-- 6
SELECT DEPT_CODE, ROUND(AVG(STU_GPA),2) AS  "Average GPA" FROM student
GROUP BY DEPT_CODE
HAVING ROUND(AVG(STU_GPA),2) > 3.00
ORDER BY ROUND(AVG(STU_GPA),2) DESC;
-- 7 
SELECT STU_CLASS, COUNT(STU_CLASS) AS "Total students", AVG(STU_GPA) AS "Average GPA" FROM student
WHERE STU_GPA IS NOT NULL
GROUP BY STU_CLASS;
-- 8 
SELECT STU_NUM, CONCAT(STU_FNAME,' ',STU_LNAME) AS "student", CONCAT(P.EMP_FNAME,' ',P.EMP_LNAME) AS "advisor" FROM student
INNER JOIN professor AS P 
ON student.EMP_NUM = P.EMP_NUM AND (P.EMP_FNAME LIKE "P%" OR P.EMP_FNAME LIKE "A%")
ORDER BY CONCAT(P.EMP_FNAME,' ',P.EMP_LNAME) ASC;
-- 9
SELECT P.EMP_NUM,P.DEPT_CODE,CONCAT(P.EMP_FNAME," ",P.EMP_LNAME) AS "professor", COUNT(P.EMP_NUM) AS "Total classes" FROM professor AS P
JOIN class AS C		ON P.EMP_NUM = C.EMP_NUM
GROUP BY P.EMP_NUM,P.DEPT_CODE
HAVING COUNT(P.EMP_NUM) > 3 AND P.DEPT_CODE = "CIS"
ORDER BY COUNT(P.EMP_NUM) DESC;
-- 10
SELECT s.STU_FNAME, s.STU_LNAME, c.CLASS_CODE,e.GRADE,c.COURSE_CODE FROM student as s
JOIN enroll as e on s.STU_NUM = e.STU_NUM
JOIN class as c on e.CLASS_CODE = c.CLASS_CODE
where c.COURSE_CODE like "cis%"
order by c.COURSE_CODE, e.GRADE;

