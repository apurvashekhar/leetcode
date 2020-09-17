Q- Project Employees II
select project_id
from Project
group by project_id
having count(*) =
(select count(employee_id)
from Project p
group by project_id
order by 1 desc
limit 1)
