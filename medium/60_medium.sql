Q- Maximum Transaction Each Day
select transaction_id
from (
select *,
max(amount) over(partition by date(day)) as max_amount
from transactions) t1
where amount = max_amount
order by transaction_id
