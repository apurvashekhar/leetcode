Q- Calculate the Influence of Each Salesperson
with cte as (select salesperson_id, name, sum(price) as total
from (
select t1.salesperson_id, t1.name, t2.customer_id, t3.price
from Salesperson t1, Customer t2, Sales t3
where t1.salesperson_id = t2.salesperson_id
and t2.customer_id = t3.customer_id
order by t1.salesperson_id) t4
group by salesperson_id)

select t1.salesperson_id, t1.name,
case when cte.total is null then 0 else cte.total end as total
from cte right join salesperson t1
on cte.salesperson_id = t1.salesperson_id
