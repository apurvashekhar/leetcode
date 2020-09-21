Q- Project Employees III
select project_id, e.employee_id
from Project p left join Employee e
on p.employee_id = e.employee_id
where (project_id,experience_years) in (
select project_id, max(experience_years) as max_exp
from Project p, Employee e
where p.employee_id = e.employee_id
group by project_id)
