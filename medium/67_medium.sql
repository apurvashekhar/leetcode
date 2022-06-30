Q- Orders With Maximum Quantity Above Average
with cte as (select *,
    sum(quantity) over(partition by order_id)/ count(product_id) over(partition by order_id) as average,
    max(quantity) over(partition by order_id) as maximum
    from OrdersDetails
    order by 1)
select distinct order_id
from cte
where maximum > (select max(average) from cte)
