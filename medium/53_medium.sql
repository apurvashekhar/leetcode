Q -  Number of Trusted Contacts of a Customer
select invoice_id, customer_name, price,
ifnull(count(user_id), 0) as contacts_cnt,
sum(case when contact_email in (select email from Customers) then 1 else 0 end) as trusted_contacts_cnt
from (
select i.invoice_id, cus.customer_id, cus.customer_name, i.price,
    cus.email as email
from Invoices i, Customers cus
where cus.customer_id = i.user_id
) t1
left join
(select user_id, contact_email
from Contacts con) t2
on t1.customer_id = t2.user_id
group by invoice_id
order by invoice_id
