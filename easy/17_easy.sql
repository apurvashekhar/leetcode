Q- Consecutive Available Seats
select distinct a.seat_id
from cinema a join
cinema b on a.seat_id = b.seat_id + 1
 or a.seat_id = b.seat_id-1
 where a.free = 1 and b.free = 1
order by a.seat_id;
