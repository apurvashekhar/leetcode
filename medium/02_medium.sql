Q- Rank Scores
select Score,
DENSE_RANK()over(order by Score DESC) AS "Rank"
from Scores
