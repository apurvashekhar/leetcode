Q- Capital Gain/Loss
select t1.stock_name, sum(t1.price - t2.price) as capital_gain_loss
from
(select stock_name, operation, operation_day, price,
rank() over(partition by stock_name order by operation_day) as rnk
from Stocks
) t1 join
(select stock_name, operation, operation_day, price,
rank() over(partition by stock_name order by operation_day) as rnk
from Stocks
) t2
on t1.stock_name = t2.stock_name
and t1.rnk > t2.rnk
and t1.rnk - t2.rnk = 1
and t1.operation = 'Sell'
and t2.operation = 'Buy'
group by 1
