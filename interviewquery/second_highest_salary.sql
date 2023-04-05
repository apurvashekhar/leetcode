-- Second Highest Salary in the engineering department
with cte as ( select e.salary from employees e
                join departments d
                on e.department_id = d.id
                and d.name = 'Engineering'
                order by salary desc

)
select *
from cte
where salary < (select max(salary) from cte)
limit 1
