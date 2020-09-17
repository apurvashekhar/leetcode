Q- Students with invalid departments
select Students.id, Students.name
from Students left JOIN Departments
on Students.department_id = Departments.id
where departments.id is null
