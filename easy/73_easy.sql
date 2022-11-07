Q- All the Matches of the League

with cte as (select team_name, row_number() over (order by team_name) as rn
from Teams)

select t1.team_name as home_team,
t2.team_name as away_team
from cte t1
join cte t2
where t1.rn < t2.rn
union
select t1.team_name as home_team,
t2.team_name as away_team
from cte t1
join cte t2
where t1.rn > t2.rn
order by 1
