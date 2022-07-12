Q- Order Two Columns Independently
select a.first_col, b.second_col
from (
(select first_col,
row_number() over(order by first_col) as rn
from Data)) a
join (select second_col,
     row_number() over(order by second_col desc) as rn
     from Data) b
on a.rn = b.rn
