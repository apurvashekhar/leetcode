Q- Users With Two Purchases Within Seven Days
select distinct user_id
from (
select *,
datediff(lead(purchase_date) over(partition by user_id order by purchase_date), purchase_date) as diff_date,
count(user_id) over(partition by user_id) as cnt
from Purchases
order by user_id) t1
where diff_date <= 7
and cnt > 1
