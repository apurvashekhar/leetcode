Q- Triangle Judgement
select *,
case when abs(x) + abs(y) > abs(z)
and abs(x) + abs(z) > abs(y)
and abs(y)+ abs(z) > abs(x) then 'Yes'
else 'No' end as triangle
from triangle
