Q- The Airport With the Most Traffic
with cte as (select airport_id, sum(cnt) as cnt
from (
select departure_airport as airport_id, sum(flights_count) as cnt
from Flights
group by 1
union all
select arrival_airport, sum(flights_count)
from Flights
group by 1) t1
group by 1)

select airport_id
from cte
where cnt = (select max(cnt) from cte)
