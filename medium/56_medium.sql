Q- Biggest Window Between Visits
select user_id, max(diff_date) as biggest_window
from( select *, datediff(next_date, visit_date) as diff_date
    from (
    select *, ifnull(lead(visit_date) over (partition by user_id order by visit_date),
                 '2021-1-1') as next_date
            from (select *
                    from uservisits
                    order by user_id, visit_date) foo) t1) final


group by user_id
