Q- Friend Requests II: Who Has the Most Friends
select id, count(*) as num
from (
select requester_id as id
from request_accepted
union all
select accepter_id
from request_accepted) foo
group by 1
order by 2 desc
limit 1
