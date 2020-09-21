Q- NPV Queries
select q.id,q.year, ifnull(n.npv,0) as npv
from NPV n right join Queries q
on n.id = q.id
and n.year = q.year
order by q.id
