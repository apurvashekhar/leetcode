Q- Sales Analysis II
select distinct buyer_id
from (select *
    from Sales
    where buyer_id not in
        (select buyer_id
            from Sales
            where product_id in (select product_id
                                from Product
                                where product_name = 'iPhone'))) foo
 where product_id in (select product_id
                        from Product
                        where product_name = 'S8')
