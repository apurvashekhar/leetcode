Q- All the Pairs With the Maximum Number of Common Followers
select distinct user1_id, user2_id
from (
    select *, max(common_follower) over() as maxCommon
    from (
        select t1.user_id as user1_id, t2.user_id as user2_id,
        count(t2.follower_id) over(partition by t1.user_id, t2.user_id) as common_follower
        from Relations t1 join Relations t2
        on t1.user_id < t2.user_id
        and t1.follower_id = t2.follower_id
        order by t1.user_id, t2.user_id) t1) t2
where common_follower = maxCommon
order by user1_id
