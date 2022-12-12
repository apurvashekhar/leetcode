WITH CTE AS (
SELECT temp.account_id, month
FROM (
SELECT account_id, DATE_FORMAT(day,'%Y%m') as month, SUM(amount) total_income
FROM transactions
WHERE type='Creditor'
GROUP BY 1,2) temp
JOIN accounts a
ON temp.account_id = a.account_id
WHERE total_income > max_income
)


SELECT DISTINCT c1.account_id
from CTE c1
join CTE c2
