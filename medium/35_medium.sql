Q- The Most Recent Three Orders
select name as customer_name, customer_id, order_id, order_date
from (
select o.order_id, o.customer_id, o.order_date, c.name,
rank() over(partition by o.customer_id order by o.order_date desc) as rnk
from Orders o, Customers c
where o.customer_id = c.customer_id
) foo
where rnk <= 3
order by customer_name, customer_id, order_date desc
