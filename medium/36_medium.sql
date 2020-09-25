Q- Countries You Can Safely Invest In
select c.name as country
from Person p join Calls calls
on p.id = calls.caller_id  or p.id = calls.callee_id
join Country c
on left(p.phone_number,3) = c.country_code
group by c.name
having avg(duration) > (select avg(duration) from Calls)
order by 1
