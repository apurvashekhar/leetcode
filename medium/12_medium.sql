Q- Customers Who Bought Products A and B but Not C
with cte as
(select customer_id, product_name
 from Orders
 where customer_id not in
 (select customer_id
from Orders
where product_name = 'C'))

select t1.customer_id, customer_name
from cte t1, cte t2, Customers c
where t1.customer_id = t2.customer_id
and c.customer_id = t1.customer_id
and t1.product_name = 'A'
and t2.product_name = 'B'
