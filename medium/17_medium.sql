Q-  Customers Who Bought All Products
select customer_id
from Customer
group by 1
having count( distinct product_key) =
(select count(product_key) from Product)
