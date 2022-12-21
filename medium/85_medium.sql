Q- The Number of Passengers in Each Bus I
select b.bus_id, count(t4.passenger_id) as passengers_cnt
from (select *
from (
select t1.bus_id, t2.passenger_id, t1.arrival_time as bus_arr, t2.arrival_time as pass_arr,
row_number() over(partition by t2.passenger_id,t2.arrival_time order by t1.arrival_time ) as rn
from Buses t1 join Passengers t2
where t1.arrival_time >= t2.arrival_time
order by t1.bus_id) t3
where rn = 1) t4
right join buses b
on t4.bus_id = b.bus_id
group by b.bus_id
order by 1
