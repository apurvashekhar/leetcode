Q- Monthly Transactions II
SELECT  DATE_FORMAT(trans_date, '%Y-%m') as month,
        country,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)AS approved_amount,
        SUM(CASE WHEN state = 'chargeback' THEN 1 ELSE 0 END ) AS chargeback_count,
        SUM(CASE WHEN state = 'chargeback' THEN amount ELSE 0 END) AS chargeback_amount
FROM(
SELECT  c.trans_id, t.country, 'chargeback' as state, t.amount, c.trans_date
from Chargebacks as c JOIN Transactions t ON c.trans_id = t.id
UNION ALL
SELECT *
FROM Transactions) as t1
group by country, month
HAVING approved_amount>0 OR chargeback_amount>0
