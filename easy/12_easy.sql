Q- User Activity For The Past 30 Days II
select ifnull(round(sum(num_sess)/count(*),2),0.00) as average_sessions_per_user
from (select user_id, count(session_id) as num_sess
    from (select distinct user_id, session_id
       from Activity
       where activity_date between date_sub('2019-07-27',interval 29 day)  and '2019-07-27') foo
    group by user_id
     having count(session_id) >= 1)final
