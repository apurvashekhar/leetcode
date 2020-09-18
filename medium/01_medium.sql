Q-  Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
   select distinct Salary
from
  (select Id, Salary, dense_rank() over (order by Salary desc) as r
  from Employee) t
where r = N
  );
END
