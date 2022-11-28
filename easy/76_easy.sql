Q- Form a Chemical Bond 
select t1.symbol as metal,
t2.symbol as nonmetal
from Elements t1 join Elements t2
where t1.symbol != t2.symbol
and t1.type = 'Metal'
and t2.type = 'Nonmetal'
order by 1
