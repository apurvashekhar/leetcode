Q- Sales by Day of the Week
select Category,
sum(Monday) as Monday,
sum(Tuesday) as Tuesday,
sum(Wednesday) as Wednesday,
sum(Thursday) as Thursday,
sum(Friday) as Friday,
sum(Saturday) as Saturday,
sum(Sunday) as Sunday
from (
select item_category as Category,
ifnull(sum(case when dayname(order_date)= 'Monday' then quantity end),0) as Monday,
ifnull(sum(case when dayname(order_date) = 'Tuesday' then quantity end),0) as Tuesday,
ifnull(sum(case when dayname(order_date) = 'Wednesday' then quantity end),0) as Wednesday,
ifnull(sum(case when dayname(order_date) = 'Thursday' then quantity end),0) as Thursday,
ifnull(sum(case when dayname(order_date) = 'Friday' then quantity end),0) as Friday,
ifnull(sum(case when dayname(order_date) = 'Saturday' then quantity end),0) as Saturday,
ifnull(sum(case when dayname(order_date) = 'Sunday' then quantity end),0) as Sunday
from Orders o right join Items i
on o.item_id = i.item_id
group by dayname(order_date), Category) foo
group by Category
order by Category
