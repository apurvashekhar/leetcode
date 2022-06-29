Q- Accepted Candidates From the Interviews
with cte as (select interview_id , sum(score) as total_score
      from Rounds
      group by interview_id)

select candidate_id
from Candidates c
join cte
on c.interview_id = cte.interview_id
and total_score > 15
and years_of_exp >= 2
