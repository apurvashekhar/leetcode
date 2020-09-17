Q- Fix Product Name Format
select trim(lower(product_name)) as PRODUCT_NAME,
date_format(sale_date, '%Y-%m') as SALE_DATE,
count(*) as TOTAL
from Sales
group by date_format(sale_date, '%Y-%m'), trim(lower(product_name))
order by 1 asc, 2 asc
