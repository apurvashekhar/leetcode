Q- The Most Frequently Ordered Products for Each Customer
select customer_id, product_id, product_name
from (
select customer_id, foo.product_id , product_name,
rank() over (partition by customer_id order by cnt desc) as rnk
from (
select customer_id, product_id, count(product_id) as cnt
from Orders
group by customer_id, product_id
) foo join Products p
on foo.product_id = p.product_id) final
where rnk = 1
