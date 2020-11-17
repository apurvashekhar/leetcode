Q- Find the Start and End Number of Continuous Ranges
with cte as (
select row_number() over (order by log_id) as id,
log_id, prev_num,
case when diff = 1 then 0
when diff > 1 then 1 end as next_diff
from (
select  log_id, lag(log_id) over(order by log_id) as prev_num,
ifnull(log_id - lag(log_id) over(order by log_id),1) as diff
from Logs) t1)

select
min(log_id) as start_id,
max(log_id) as end_id
from (
select t.id,
t.log_id,
t.next_diff,
(Select sum(x.next_diff)
from cte x
where x.id <= t.id) as cum_sum
from cte t
order by t.id) final
group by cum_sum
