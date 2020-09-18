Q- Activity Participants
with cte as (select a.name, count(*) as cnt
from Friends f right join Activities a
on f.activity = a.name
group by a.name)

select name as ACTIVITY
from cte
where cnt != (Select min(cnt) from cte)
and cnt != (Select max(cnt) from cte)
