Q - Managers with at Least 5 Direct Reports
select Name
from Employee t1
join
(select ManagerId
from Employee
group by ManagerId
having count(ManagerId) >= 5) t2
where t1.Id = t2.ManagerId
