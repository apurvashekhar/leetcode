Q- Sales Analysis III
select distinct s.product_id, p.product_name
from Product p, Sales s
where sale_date between "2019-01-01" and "2019-03-31"
and p.product_id = s.product_id
and s.product_id not in
(select distinct product_id
from Sales
where sale_date not between "2019-01-01" and "2019-03-31")
