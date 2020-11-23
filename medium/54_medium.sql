Q- Find the Missing IDs
with recursive cte as
(
select 1 as counter
union
select counter + 1 from cte where counter < (select max(customer_id) from customers)
)
select counter as ids from cte where counter not in (select customer_id from customers)
