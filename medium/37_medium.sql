Q- Calculate Salaries
select s.company_id,
s.employee_id,
s.employee_name,
case when max_sal < 1000 then s.salary
when max_sal between 1000 and 10000 then round(s.salary - (0.24 * s.salary),0)
when max_sal > 10000 then round(s.salary - (0.49 * s.salary),0) end as salary
from Salaries s join
(select company_id, max(salary) as max_sal
from Salaries
group by company_id) t1
on s.company_id = t1.company_id
