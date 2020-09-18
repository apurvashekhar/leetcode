Q- Last Person to Fit in the Elevator
with cte as (
select *
from Queue
order by turn)

select t1.person_name
from cte t1, cte t2
where t1.turn >= t2.turn
group by t1.turn
having sum(t2.weight) <= 1000
order by t1.turn desc
limit 1
