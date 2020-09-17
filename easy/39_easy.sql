Q- Top Travellers
select name, ifnull(sum(distance),0) as travelled_distance
from Rides r right join Users u
on r.user_id = u.id
group by 1
order by 2 desc, 1 asc
