Q- Find Interview Candidates
with cte1 as
(
    select contest_id, gold_medal as user_id
    from contests
    union
    select contest_id, silver_medal as user_id
    from contests
    union
    select contest_id, bronze_medal as user_id
    from contests
), cte2 as
(
    select user_id, contest_id - row_number() over (partition by user_id order by contest_id) as rank_
    from cte1
), cte3 as
(
    select user_id
    from cte2
    group by user_id, rank_
    having count(*) >= 3

    union

    select gold_medal as user_id
    from Contests
    group by gold_medal
    having count(*) >= 3
)
select u.name, u.mail
from cte3 c
inner join Users u
on c.user_id = u.user_id
;
