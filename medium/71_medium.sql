Q- Product Sales Analysis IV
with cte as (select user_id, product_id,
sum(price * quantity) over(partition by user_id, product_id) as spending
from (
select user_id, s.product_id, p.price, s.quantity
from Sales s join Product p
on s.product_id = p.product_id) t1
order by user_id)

select distinct user_id, product_id
from cte t2
where spending = (select max(spending) from cte t3  where t2.user_id = t3.user_id
                  group by user_id)
