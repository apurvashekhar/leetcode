with
# add row number to the table, which will be used for ordering the table
cte as (select *, row_number() over () as rn from CoffeeShop),
# cumulatively count the number of drinks ordered by the row number
cte2 as (select *, count(drink) over (order by rn) as cnt from cte)


# use the first_value/max function to fill in those NULL values per group count and ordered by the row number
select id,
filled as drink from
(select *, max(drink) over (partition by cnt order by rn) as filled from cte2) sub;
