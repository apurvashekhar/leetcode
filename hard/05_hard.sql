Q- Get the Second Most Recent Activity
select USERNAME, ACTIVITY, STARTDATE, ENDDATE
from (
    select username, activity, startDate, endDate,rnk, max(rnk) over(partition by username) as max_rnk,
    count(*) over (partition by username) as cnt
    from(
        select *, rank() over (partition by username order by startDate, endDate) as rnk
        from UserActivity) t1) t2
where max_rnk - rnk = 1 or cnt = 1
order by username
