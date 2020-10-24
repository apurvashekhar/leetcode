Q- Product Sales Analysis III
select product_id, year as first_year, quantity, price
from
(select product_id, year, quantity, price,
rank() over(partition by product_id order by year) as rank_num
from Sales) t1
where rank_num = 1
