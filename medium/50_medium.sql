Q - Page Recommendations
select distinct page_id as recommended_page
from (select user2_id
from Friendship
where user1_id = 1 or user2_id = 1
union
select user1_id
from Friendship
where user1_id = 1 or user2_id = 1) t1, Likes t2
where user2_id != 1
and user2_id = t2.user_id
and page_id not in (select page_id from Likes where user_id = 1)
