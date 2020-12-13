#1
SELECT * FROM professor;
#2
select dept_name from department;
#3
select stu_fname, stu_lname from student;
#4
select stu_fname as firstname, stu_lname as lastname from student;
#5
select distinct stu_fname from student;
#6
select course_code, crs_credit from course;
#7
select class_code, course_code, class_room from class;
#8
select distinct class_room, course_code from class
limit 5;
#9
select distinct emp_num, course_code from class;
#10
select emp_fname as firstname, emp_lname as lastname, emp_dob from professor
limit 10;
#11
select emp_fname as firstname, emp_lname as lastname, year(emp_dob ) from professor
limit 10;
#12
select emp_fname as firstname, emp_lname as lastname, 2020-year(emp_dob ) from professor
limit 10;
#13
select * from course
order by crs_credit;
#14
select stu_fname, stu_lname, stu_gpa from student
limit 3;
#15
select stu_fname, stu_lname, stu_gpa from student
where stu_gpa > 3.5;
#16
select stu_fname, stu_lname, stu_gpa from student
where stu_gpa >= 3.25 and stu_gpa < 3.5;
#17
select stu_fname, stu_lname, stu_gpa from student
where stu_gpa >= 1.5 and stu_gpa < 1.8;
#18
select stu_fname, stu_lname, stu_gpa from student
where stu_gpa >= 1.8 and stu_gpa < 2;
#19
select stu_fname, stu_lname from student
where stu_gpa is null;
#20
select stu_fname, stu_lname from student
where stu_dob between '1970-01-01'and'1979-12-31';
#21
select * from student
where dept_code = "CIS" and stu_fname like "A%";
#22
select * from course
where course_name like "Intro.%";
#23
select class_code, course_code, class_time from class
where class_time like "MWF%" and class_section = 2;
#24
select course_code, course_name, dept_code from course
where dept_code in ("MATH","ENG","CIS")
order by dept_code;
#25
select class_code, course_code, emp_num from class
where emp_num in (104,105,106,155)
order by emp_num;
#26
alter table professor
add email varchar(100);

update professor
set email = "arelle.hef@tinycollege.edu"
where emp_num = 105;
update professor
set email = "gerald.gra@tinycollege.edu"
where emp_num = 114;
update professor
set email = "ismael.osa@tinycollege.edu"
where emp_num = 301;
#27
select * from student
where month(stu_dob) = 11
order by dept_code;
#28
select * from student
where dayofweek(stu_dob) = 5
order by dept_code;
#29
select emp_fname, emp_lname, 2020-year(emp_dob) as age from professor
where 2020-year(emp_dob) > 75
order by 2020-year(emp_dob);
#30
select max(2020-year(stu_dob)) as age from student;
#31
select round(avg(stu_gpa),2) as avggpa from student
where stu_class = 2;
#32
select stu_class, round(avg(stu_gpa),2) as avggpa from student
group by stu_class;
#33
select dept_code, round(avg(stu_gpa),2) as avggpa from student
group by dept_code
order by dept_code;
#34
select stu_class, count(*) as num_stu from student
group by stu_class 
order by stu_class;
#35
select dept_code, count(*) as num_stu from student
group by dept_code 
order by dept_code;
#37
select dept_code, count(*) as num_prof from professor
group by dept_code
having num_prof >=2;
#38
select p.emp_fname,p.emp_lname,p.dept_code,d.dept_name, d.dept_address from professor as p
join department as d on d.dept_code = p.dept_code
limit 8;
#39
select s.stu_fname,s.stu_lname,e.class_code from student as s
join enroll as e on e.stu_num = s.stu_num
where e.grade = "A" and s.dept_code = "CIS";
#40
select s.stu_fname,s.stu_lname, count(*) as num_gradeA from student as s
join enroll as e on e.stu_num = s.stu_num
where e.grade = "A" and s.dept_code = "CIS"
group by s.stu_fname, s.stu_lname
order by s.stu_fname;
#41
select p.emp_fname, p.emp_lname, count(*) as num_adv from professor as p
join student as s on s.emp_num = p.emp_num
group by p.emp_fname
having num_adv > 3
order by p.emp_fname;
#42
select cs.class_code,cs.course_code,c.course_name, cs.class_time from class cs
join course c on c.course_code = cs.course_code
where c.course_name like "Intro.%" and cs.class_section = 1 and c.dept_code = "CIS";
#43
select distinct d.dept_code,d.dept_name,count(distinct p.emp_num) num_prof ,count(distinct s.stu_num) num_student, round(count(distinct s.stu_num)/count(distinct p.emp_num),2) student_ratio from department d
join professor p on p.dept_code = d.dept_code
join student s on s.dept_code = d.dept_code
group by d.dept_code;
#44
select d.dept_code,d.dept_name,concat(p.emp_fname,' ',p.emp_lname) head_dept from department d
join professor p on p.emp_num = d.emp_num;
#45
select s.stu_num,s.stu_fname,s.stu_lname,count(e.class_code) total_class, sum(e.credit) total_credit from student s
join enroll e on e.stu_num = s.stu_num
group by s.stu_num
having total_class >= 6 or total_credit >= 18;
