Q- Rectangles Area
select t1.id as P1,
t2.id as P2,
abs(t1.x_value-t2.x_value) * abs(t1.y_value - t2.y_value) as AREA
from Points t1, Points t2
where t1.id < t2.id
and abs(t1.x_value-t2.x_value) * abs(t1.y_value - t2.y_value) > 0
order by area desc, p1, p2
