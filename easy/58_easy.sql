Q- Warehouse Manager
select w.name as warehouse_name, sum( w.units * p.Width * p.Length * p.Height) as volume
from Warehouse w left join Products p
on w.product_id = p.product_id
group by w.name
order by w.name
