Q- Market Analysis I
select user_id as buyer_id,
join_date,
ifnull(orders_in_2019, 0) as orders_in_2019
from Users u
left join
(select buyer_id, count(*) as orders_in_2019
from Orders
where date_format(order_date, '%Y') = '2019'
group by buyer_id) t1
on u.user_id = t1.buyer_id
