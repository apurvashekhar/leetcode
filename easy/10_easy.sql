Q- Duplicate Email
select Email from (select Email, count(*)
from Person
group by Email
having count(*) > 1
order by 2)foo
