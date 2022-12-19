Q- Count the Number of Experiments
with cte as (select *
             from (select 'IOS' as platform
			 union
			 select 'Android' as platform
			 union
			 select 'Web' as platform) as p,
			 (select 'Programming' as experiment_name
			 union
			 select 'Sports' as experiment_name
			 union
			 select 'Reading' as experiment_name) as e)


select cte.platform, cte.experiment_name,
case when t1.num_experiments is null then 0
else t1.num_experiments end as num_experiments
from (select platform, experiment_name, count(*) as num_experiments
from Experiments
group by platform, experiment_name
order by platform) t1
right join cte
on t1.experiment_name = cte.experiment_name
and t1.platform = cte.platform
