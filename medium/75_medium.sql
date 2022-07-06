Q- Leetflex Banned Accounts
select distinct t1.account_id
from Loginfo t1 join Loginfo t2
on t1.account_id = t2.account_id
and t1.ip_address != t2.ip_address
and t1.login between t2.login and t2.logout
