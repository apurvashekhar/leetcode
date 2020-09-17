Q- Replace Employee ID With The Unique Identifier
select unique_id, name
from Employees e1 left join EmployeeUNI e2
on e1.id = e2.id
