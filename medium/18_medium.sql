Q- Winning Candidate
with cte as (select c.name, count(v.CandidateId) as vote_count
from Candidate c left join Vote v
on c.id = v.CandidateId
group by c.id
order by 1)

select name as Name
from
cte
where vote_count = (select max(vote_count) from cte)
