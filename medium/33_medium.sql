Q-  Bank Account Summary
with cte as (select paid_by as id, - amount as paid_amount, trans_id
from Transactions
union
select paid_to as id, amount as received_amount,trans_id
from Transactions)

select user_id, user_name,
trans_amt + credit as credit,
case when (trans_amt + credit) >= 0 then 'No'
else 'Yes' end as credit_limit_breached
from (
select user_id,
t2.user_name,
ifnull(sum(paid_amount),0) as trans_amt ,
credit
from cte t1 right join Users t2
on t1.id = t2.user_id
group by t1.id) foo
