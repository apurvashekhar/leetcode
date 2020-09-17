Q- Number of Comments per Post
Select
    distinct sub_id AS post_id,
    (select count(distinct sub_id) from Submissions S2 where S1.sub_id = S2.parent_id) as number_of_comments
from
    Submissions as S1
where parent_id is null
order by sub_id
