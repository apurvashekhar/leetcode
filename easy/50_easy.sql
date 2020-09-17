Q- Sales Analysis I
select seller_id
from Sales
group by 1
having sum(price) = (select sum(price)
from Sales
group by seller_id
order by 1 desc
limit 1)
