Q- Employee earning more than their manager
select Name as 'Employee'
from Employee e1
where e1.Salary > (Select Salary
                  from Employee e2
                  where e1.ManagerId = e2.Id)
