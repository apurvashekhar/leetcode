Q- The Category of Each Member in the Store
with cte as (select v.visit_id, v.member_id,
case when p.visit_id is null then 'no' else 'yes' end as madePurchase
from Visits v
left join Purchases p
on v.visit_id = p.visit_id
order by 1)

select member_id, name,
case when 100*(purchase_cnt/visit_cnt) >= 80 then 'Diamond'
when 100*(purchase_cnt/visit_cnt) >= 50 and 100*(purchase_cnt/visit_cnt) < 80 then 'Gold'
when 100*(purchase_cnt/visit_cnt)< 50 then 'Silver'
when 100*(purchase_cnt/visit_cnt) is null then 'Bronze' end as category
from (
select member_id, name,
sum(case when madePurchase = 'yes' then 1 else 0 end) as purchase_cnt,
sum(case when madeVisit = 'yes' then 1 else 0 end) as visit_cnt
from
    (select m.member_id, m.name,
    case when c.visit_id is null then 'no' else 'yes' end as madeVisit,
    case when madePurchase is null then 'no' else madePurchase end as madePurchase
    from Members m left join cte c
    on m.member_id = c.member_id
    order by 1) t1
group by 1
order by 1) t2
