Q- Game Play Analysis IV
select round(count(distinct player_id)/
(select count(distinct player_id)
from Activity),2) as fraction
from (
select t1.player_id,
event_date
from Activity t1
join
(select player_id, min(event_date) as first_login
from Activity
group by player_id) t2
on t1.player_id = t2.player_id and datediff(event_date, first_login) = 1 ) foo
