Q- Trips and Users
select Request_at as Day,
round(sum(case when Status != 'completed' then 1 else 0 end) / count(id),2) as `Cancellation Rate`
from Trips t join Users u
on t.Client_Id = u.Users_Id
or t.Client_Id = u.Users_Id
where Banned = 'No'
and Request_at between '2013-10-01' and '2013-10-03'
group by Request_at


