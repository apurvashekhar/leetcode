Q- Exchange Seats
with cte as (select id, student, floor((id-1)/2) as new_id
from seat)

select id,
case when student is null then c1student
else student end as student
from(
select c1.id , c1.student as c1student, c2.student
from cte c1
left join cte c2
on c1.new_id = c2.new_id
and c1.id != c2.id
order by c1.id)foo
