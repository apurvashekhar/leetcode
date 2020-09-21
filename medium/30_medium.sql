Q- Count Student Number in Departments
select d.dept_name, ifnull(count(student_id),0) as student_number
from Department d left join student s
on d.dept_id = s.dept_id
group by d.dept_name
order by student_number desc, d.dept_name
