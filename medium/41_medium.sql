Q- Investments in 2016
select sum(distinct t1.TIV_2016) as TIV_2016
from Insurance t1, Insurance t2
where t1.PID in (
Select PID
from Insurance
group by LAT,LON
having count(*) = 1)
and t1.TIV_2015 = t2.TIV_2015
and t1.PID != t2.PID
