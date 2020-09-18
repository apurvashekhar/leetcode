Q- Apples & Oranges
select sale_date,
sum(case when fruit = 'apples' then sold_num else -sold_num end) as diff
from Sales
group by sale_date
order by sale_date
