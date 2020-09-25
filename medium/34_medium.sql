Q- The Most Recent Orders for Each Product
select p.product_name, o.product_id, o.order_id, o.order_date
from Orders o, Products p
where (o.product_id, order_date) in (
select product_id, max(order_date)
from Orders
group by product_id)
and o.product_id = p.product_id
order by  p.product_name, o.product_id, o.order_id
