Q- Customer Order Frequency
select customer_id, name
from Customers
where customer_id in (select customer_id
from (select customer_id, month(order_date) as order_month,
sum(price * quantity) as tot_price
from Orders o, Product p
where o.product_id = p.product_id
and month(order_date) in (6,7)
group by 1,2
having tot_price >= 100)foo
group by customer_id
having count(*) = 2)
