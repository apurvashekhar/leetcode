Q- Find The Team Size
select employee_id, team_size
from Employee join (select team_id, count(employee_id)  as team_size
from Employee
group by team_id) foo on Employee.team_id = foo.team_id
