Q- Products Worth Over Invoices
select name,
sum(rest) as rest,
sum(paid) as paid,
sum(canceled) as canceled,
sum(refunded) as refunded
from Product p, Invoice i
where p.product_id = i.product_id
group by p.name
order by name
