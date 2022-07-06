Q- Number of Accounts That Did Not Stream
select count(account_id) as accounts_count
from Streams
where year(stream_date) != 2021
and account_id in
(select account_id from Subscriptions where year(end_date) = 2021)
