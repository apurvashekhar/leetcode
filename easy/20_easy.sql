Q- Average Selling Price
select Prices.product_id,
round(sum(price*units)/ sum(units),2) as average_price
from Prices join
    (select distinct product_id, purchase_date, units
    from UnitsSold) foo
on Prices.product_id = foo.product_id
where foo.purchase_date between Prices.start_date and Prices.end_date
group by product_id
