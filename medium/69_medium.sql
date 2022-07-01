Q- Products With Three or More Orders in Two Consecutive Years
with purchase_cte as (
    select
        product_id,
        date_format(purchase_date, '%Y') as p_year
    from Orders
    group by product_id, date_format(purchase_date, '%Y')
    having count(*) >= 3
)
select *
from purchase_cte p1 inner join purchase_cte p2
where p1.p_year = p2.p_year -1 and p1.product_id = p2.product_id
