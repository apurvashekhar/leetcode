Q- Consecutive Numbers
SELECT DISTINCT Num as ConsecutiveNums
FROM
(
SELECT Num,
    LEAD(Num) OVER(ORDER BY Id) lead_num,
    LAG(Num) OVER (ORDER BY Id) lag_num
FROM Logs
)t
WHERE Num=lead_num and Num=lag_num;
