Q- Bank Account Summary II
select name, sum(amount) as balance
from Transactions t, Users u
where u.account = t.account
group by t.account
having sum(t.amount) > 10000
