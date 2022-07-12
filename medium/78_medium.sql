Q- League Statistics
with cte as (
select *,
    case when home_team_goals > away_team_goals then 'home_winner'
    when home_team_goals = away_team_goals then 'home_draw'
    else 'home_loser' end as home_status,
    case when home_team_goals < away_team_goals then 'away_winner'
    when home_team_goals = away_team_goals then 'away_draw'
    else 'away_loser' end as away_status
from Matches),

cte2 as (select *,
case when home_status = 'home_winner' then 3
    when home_status = 'home_draw' then 1
    else 0 end as home_points,
case when away_status = 'away_winner' then 3
    when away_status = 'away_draw' then 1
    else 0 end as away_points
from cte),

cte3 as (select home_team_id as team_id, home_team_goals as goals, home_status as team_status, home_points as points
from cte2
union all
select away_team_id, away_team_goals, away_status, away_points
from cte2),

cte4 as (select distinct cte3.team_id, team_name,
count(*) over(partition by cte3.team_id) as matches_played,
sum(points) over(partition by cte3.team_id) as points,
sum(goals) over(partition by cte3.team_id) as goal_for
from cte3
join Teams t
on t.team_id = cte3.team_id
order by points desc, team_name)

select *,
goal_for - goal_against as goal_diff
from (
select distinct team_name, matches_played,
points, goal_for,
sum(case when team_id = home_team_id then away_team_goals else home_team_goals end)
over (partition by team_name) as goal_against
from (
select c.team_id, c.team_name, c.matches_played,
c.points, c.goal_for, m.home_team_id,m.away_team_id,
m.home_team_goals,m.away_team_goals
from cte4 c join Matches m
on c.team_id = m.home_team_id
or c.team_id = m.away_team_id) t1) t2
order by points desc, goal_for - goal_against desc, team_name
