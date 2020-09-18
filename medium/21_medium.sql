Q- Restaurant Growth
with cte as (select distinct visited_on from Customer)

select t1.visited_on, sum(t2.amount) as amount,
round(sum(t2.amount)/7,2) as average_amount
from cte t1, Customer t2
where t1.visited_on >= t2.visited_on
and t2.visited_on >= date_add(t1.visited_on, interval -6 day)
group by 1
having count(distinct t2.visited_on) = 7
