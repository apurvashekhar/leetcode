Q- Ads Performance
select ad_id,
case when (click + viewed) = 0 then 0.00
else round(((click*1.00)/(click+viewed))*100,2) end as ctr
from(
select ad_id,
sum(case when action = 'Clicked' then 1 else 0 end) as click,
sum(case when action = 'Viewed' then 1 else 0 end) as viewed
from Ads
group by ad_id) foo
order by ctr desc, ad_id
