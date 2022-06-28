Q- Tasks Count in the Weekend
select sum(case when work_day = 'weekend' then 1 else 0 end) as weekend_cnt,
sum(case when work_day = 'weekday' then 1 else 0 end) as working_cnt
from(
    select task_id, assignee_id,
    case when weekday(submit_date) = 5 then 'weekend'
    when weekday(submit_date) = 6 then 'weekend'
    else 'weekday' end as work_day
    from Tasks) t1
