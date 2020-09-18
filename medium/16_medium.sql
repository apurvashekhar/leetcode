Q- Highest Grade For Each Student
select t1.student_id, min(t1.course_id) as course_id, t2.grade
from Enrollments t1
join
(select student_id, max(grade) as grade
from Enrollments
group by 1
order by 1) t2
on t1.student_id = t2.student_id
and t1.grade = t2.grade
group by 1
order by 1
