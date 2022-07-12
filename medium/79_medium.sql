Q- Count Salary Categories
with cte as (
select 'Low Salary'as category
union
select 'Average Salary' as col2
union
select 'High Salary' as col3
),

cat as (
select income, case when income < 20000 then 'Low Salary'
when income >= 20000 and income <= 50000 then 'Average Salary'
when income > 50000 then 'High Salary' end as category
from Accounts)

select t1.category, sum(case when t2.category is not null then 1 else 0 end) as accounts_count
from cte t1 left join cat t2
on t1.category = t2.category
group by t1.category
order by 1
