Q- Account Balance
with cte as (select *,
case when type = 'Withdraw' then -1 * amount
else amount end as bal_amount
from Transactions )

   select account_id, day, 
   sum(prev_amt) as balance
   from(
   select t1.account_id, t1.day,
    t1.bal_amount as current_amt,
    case when t2.bal_amount is null then t1.bal_amount
    else t2.bal_amount end as prev_amt
    from cte t1 left join cte t2
    on t1.day >= t2.day
    and t1.account_id = t2.account_id
    order by 1, 2) t3
group by account_id, day
order by account_id, day
