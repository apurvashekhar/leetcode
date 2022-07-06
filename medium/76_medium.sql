Q- The Change in Global Rankings
with cte as ( select *, rank() over(order by points desc, name asc) as old_rnk
             from teampoints

)


select team_id, name, cast(old_rnk as signed)- cast(new_rnk as signed) as rank_diff
from (
select t1.team_id, t1.name, t1.old_rnk, rank() over ( order by t1.points + t2.points_change desc, t1.name asc) as new_rnk
from cte t1 left join pointschange t2
on t1.team_id = t2.team_id) t1
