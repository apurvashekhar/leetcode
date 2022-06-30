Q- Group Employees of the Same Salary
select distinct t1.employee_id, t1.name, t1.salary,
dense_rank() over(order by t1.salary) as team_id
from (
select e1.employee_id, e1.name, e1.salary
from Employees e1
join Employees e2
on e1.salary = e2.salary
and e1.name != e2.name
order by e1.salary) t1
order by team_id, employee_id
