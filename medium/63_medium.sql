Q- Count Apples and Oranges
select sum(apple_count) as apple_count,
sum(orange_count) as orange_count
from (
    select b.apple_count + (case when c.apple_count is null then 0
                                else c.apple_count end) as apple_count,
            b.orange_count + (case when c.orange_count is null then 0
                                else c.orange_count end) as orange_count
    from Boxes b left join Chests c
    on b.chest_id = c.chest_id) t1
