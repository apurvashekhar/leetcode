Q- Compute the Rank as a Percentage
select student_id, department_id,
case when percentage is null then 0
else percentage end as percentage
from(
select student_id, department_id, round((rnk-1) * 100/ (cnt - 1),2) as percentage
from(
select *, rank() over (partition by department_id order by mark desc) as rnk,
count(student_id) over(partition by department_id) as cnt
from Students
order by department_id) t1) t2
