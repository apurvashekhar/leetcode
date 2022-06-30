Q- Confirmation Rate
select user_id, round(sum(action_num)/ count(*),2) as confirmation_rate
from (
    select s.user_id, c.action,
    case when c.action is null then 0
    when c.action = 'timeout' then 0
    else 1 end as action_num
    from Signups s left join Confirmations c
    on s.user_id = c.user_id
    order by 1)t1
group by user_id
