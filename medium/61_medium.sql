Q- The First Day of the Maximum Recorded Degree in Each City
select city_id, min(day) as day, max_deg as degree
from (
    select *
    from Weather w
    join (
    select max(degree) as max_deg, city_id as id
    from Weather
    group by city_id) t1
    where max_deg= degree
    and t1.id = w.city_id) t2
group by city_id
order by city_id asc
