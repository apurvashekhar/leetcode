Q- New Users Daily Count
select first_login_date as login_date,
count(distinct user_id) as user_count
from (
select user_id, min(activity_date) as first_login_date
from Traffic
where activity = 'login'
group by user_id) foo
where first_login_date between date_add('2019-06-30', interval -90 day) and '2019-06-30'
group by first_login_date
