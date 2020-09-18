Q- Unpopular Books
select t2.book_id, t2.name
from (select book_id, sum(quantity) as book_sold
from Orders
where dispatch_date between '2018-06-23' and '2019-06-23'
group by 1
 )t1
right join
(select book_id, name
from Books
where available_from < '2019-05-23')t2
on t1.book_id = t2.book_id
where book_sold < 10 or book_sold is null
