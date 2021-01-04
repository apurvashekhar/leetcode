Q-  Find Cumulative Salary of an Employee
with cte as (select Id, Month,Salary, rnk
from (
    select *, rank() over (partition by id order by month desc) as rnk
    from Employee) t1
where rnk > 1
order by Id, Month desc)

select t2.id as id, t3.month, sum(t2.salary) as Salary
from cte t2, cte t3
where t2.id = t3.id
and (t2.month = t3.month
    or t2.month = t3.month -1
    or t2.month = t3.month -2)
#and t2.id = 1
group by t2.id, t3.month
order by t2.Id, t3.month desc
