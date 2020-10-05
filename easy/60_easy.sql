Q- Sellers With No Sales
select seller_name
from Seller
where seller_id not in (
select seller_id
from Orders
where date_format(sale_date,'%Y') = '2020')
order by seller_name
