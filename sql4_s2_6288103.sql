/**
- Nopparat Pengsuk
- Section 2
- 6288103
*/
# Q1
SELECT class.CLASS_CODE, course.COURSE_NAME, p.EMP_FNAME, p.EMP_LNAME, COUNT(*) AS "NUM_STU" FROM class
JOIN course ON course.COURSE_CODE = class.COURSE_CODE
JOIN professor AS p ON p.EMP_NUM = class.EMP_NUM
JOIN enroll AS e ON e.CLASS_CODE = class.CLASS_CODE
where class.CLASS_SECTION = 3
GROUP BY class.CLASS_CODE;

#Q2
SELECT class.class_code, course.COURSE_NAME FROM class
JOIN course ON class.COURSE_CODE = course.COURSE_CODE
WHERE CLASS_CODE NOT IN (SELECT CLASS_CODE FROM enroll);

#Q3
SELECT student.STU_FNAME AS "FIRST NAME", student.STU_LNAME AS "LAST NAME", student.STU_NUM AS "ID" FROM student
WHERE student.STU_FNAME LIKE "C%"
UNION -- <<<<<<<<<<<<<<<< shopping mall?
SELECT p.EMP_FNAME, p.EMP_LNAME, p.EMP_NUM FROM professor p
WHERE p.EMP_FNAME LIKE "C%";

#Q4
SELECT class.COURSE_CODE FROM class
WHERE class.COURSE_CODE NOT IN (SELECT COURSE_CODE FROM class 
				WHERE class_section = 2)
ORDER BY class.COURSE_CODE ASC;

#Q5
SELECT distinct student.STU_FNAME FROM student
WHERE student.STU_FNAME IN (SELECT EMP_FNAME FROM professor);

#Q6
SELECT student.STU_FNAME, student.STU_LNAME, student.STU_GPA FROM student
WHERE student.STU_GPA > (SELECT avg(STU_GPA) FROM student
			 where dept_code = "MATH");
                        
#Q7
CREATE VIEW vw_topstudents 
AS
SELECT s.STU_NUM, s.STU_FNAME, s.STU_LNAME, s.STU_GPA ,s.DEPT_CODE FROM student AS s
WHERE s.STU_GPA =  any  (select Max(stu_gpa) as STU_GPA from student 
						 group by DEPT_CODE); 
						 -- where student.DEPT_CODE = s.DEPT_CODE);

SELECT * FROM vw_topstudents;
						 
						 -- hahahaha
