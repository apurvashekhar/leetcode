Q- Active Users
with cte as (
select distinct id, login_date
from Logins)

select foo.id, name
from (
select distinct t0.id
from cte t0, cte t1
where t0.id = t1.id
and t1.login_date <= t0.login_date
and date_add(t0.login_date, interval -5 day) < t1.login_date
group by 1, t1.login_date
having count(t0.login_date) >= 5) foo, Accounts
where foo.id = Accounts.id
order by foo.id
