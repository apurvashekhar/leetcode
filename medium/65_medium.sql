Q- Number of Times a Driver Was a Passenger
select t1.driver_id, count(r1.passenger_id) as cnt
from (
select distinct driver_id
from Rides
order by 1) t1 left join Rides r1
on t1.driver_id = r1.passenger_id
group by t1.driver_id
