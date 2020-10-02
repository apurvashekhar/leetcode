Q- Active Businesses
select business_id
from (
select e.business_id, e.event_type, e.occurences,
avg_occ
from Events e join
(select event_type, round(avg(occurences),1) as avg_occ
from Events
group by event_type) t1
on e.event_type = t1.event_type) final
where occurences > avg_occ
group by business_id
having count(distinct event_type) > 1
