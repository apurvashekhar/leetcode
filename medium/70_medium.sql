Q- Product Sales Analysis V
select user_id, sum(price * quantity) as spending
from (
select user_id, s.product_id, p.price, s.quantity
from Sales s join Product p
on s.product_id = p.product_id) t1
group by user_id
order by sum(price * quantity) desc, user_id
