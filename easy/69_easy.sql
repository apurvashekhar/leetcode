Q- The Number of Employees Which Report to Each Employee
select t1.employee_id, t1.name, count(t2.employee_id) as reports_count,
round(sum(t2.age)/ count(t2.age),0) as average_age
from Employees t1, Employees t2
where t1.employee_id = t2.reports_to
group by t1.employee_id
order by t1.employee_id
