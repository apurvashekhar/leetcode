Q- Biggest Single Number
select case
when num is null then null
else max(num) end as num
from (
select num, count(*)
from my_numbers
group by num
having count(*) = 1)foo
