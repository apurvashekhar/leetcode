Q- Classes More Than 5 Students
select class
from courses
group by class
having count(distinct student) >= 5
