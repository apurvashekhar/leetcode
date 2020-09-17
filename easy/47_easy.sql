Q-  User Activity for the Past 30 Days I
select day, count(user_id) as active_users
from (select activity_date as day, user_id
from Activity
where activity_date between date_sub('2019-07-27',interval 29 day) and '2019-07-27'
group by 1, 2
having count(session_id) >= 1)foo
group by 1
