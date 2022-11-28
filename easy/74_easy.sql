Q- Number of Unique Subjects Taught by Each Teacher
select teacher_id,count(teacher_id) as cnt
from (
select teacher_id, subject_id
from Teacher
group by teacher_id, subject_id
order by 1) t1
group by teacher_id
