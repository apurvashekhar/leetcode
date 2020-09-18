Q- Immediate Food Delivery II
select
round((sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/ count(*)*100),2) as immediate_percentage
from
(select *,
row_number() over(partition by customer_id order by order_date) as rn
from Delivery) foo
where rn = 1
