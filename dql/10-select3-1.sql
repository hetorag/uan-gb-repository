SET search_path = courses;
--Course more 3 credits of Comp. Sci.
select	title, dept_name
from	course
where	dept_name = 'Comp. Sci.' and  credits =	3;

----------------------------------------------------
--ID Students who take class of Einstein teacher
select	distinct takes.takes_id
from	takes, instructor, teaches
where	takes.course_id = teaches.course_id
and takes.section_id = teaches.section_id
and takes.semester = teaches.semester
and takes.year = teaches.year
and teaches.teaches_id = instructor.instructor_id
and instructor.name  = 'Wieland';

--select * from instructor where name  = 'Einstein';
---------------------------------------------------
--Max salary of instructors
select max(salary)
from instructor;

--------------------------------------------------
--Instructors with max salary
select	instructor_id, name, salary
from	instructor
where	salary = (select max(salary) from instructor);

--------------------------------------------------
--Courses by section for Fall 2017
select course_id, section_id,
(select count(takes_id)
from	takes
where takes.year = section.year
and takes.semester = section.semester
  and takes.course_id = section.course_id
  and takes.section_id = section.section_id) as enrollment
from	section
where semester = 'Fall' and	year =	2010;

select	takes.course_id, takes.section_id, count(section.section_id)
from	section, takes
where	takes.course_id = section.course_id
and takes.section_id = section.section_id
and takes.semester = section.semester
and takes.year = section.year
and takes.semester = 'Fall' and takes.year =	2010
group by takes.course_id, takes.section_id;

--------------------------------------------------
--Max enrollment by sections for Fall 2017
select max(enrollment)
from	(select	count(section.section_id) as enrollment
from	section, takes
where	takes.year = section.year
and takes.semester = section.semester
  and takes.course_id = section.course_id
  and takes.section_id = section.section_id
and takes.semester = 'Fall' and takes.year =	2010
group by takes.course_id, takes.section_id)a;

--------------------------------------------------
--Sections with max enrollment for Fall 2017
with sec_enrollment as (
select	takes.course_id, takes.section_id, count(section.section_id) as enrollment from	section, takes
where	takes.year = section.year
and takes.semester = section.semester
and takes.course_id = section.course_id
and takes.section_id = section.section_id
and takes.semester = 'Fall'
and takes.year =	2010
group by takes.course_id, takes.section_id)
select course_id, section_id
from	sec_enrollment
where enrollment = (select max(enrollment) from sec_enrollment);

--select * from takes where takes.semester = 'Fall' and takes.year =	2017;