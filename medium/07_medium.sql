Q- Department Highest Salary
with result as(
select Employee.Name as EmpName,Employee.Salary,
    Department.Name as DepName
    from Employee, Department
    where Employee.DepartmentId = Department.Id)

select DepName as Department,
        EmpName as Employee,
        Salary
from result t1
where Salary = (Select MAX(Salary)
               from result t2
               where t1.DepName = t2.DepName)
