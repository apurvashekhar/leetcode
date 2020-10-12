Q- Article Views II
select distinct viewer_id as id
from (select distinct *
     from Views) foo
group by viewer_id, view_date
having count(*) > 1
order by viewer_id
