Q- Arrange Table by Gender
Solution 1
WITH A AS(
    SELECT *, RANK() OVER(PARTITION BY gender ORDER BY user_id) AS rnk, IF(gender='female', 0, IF(gender='other', 1,  2)) AS rnk2 FROM Genders
)
SELECT user_id, gender FROM A ORDER BY rnk, rnk2;

Solution 2
WITH temp_rankings AS (
  SELECT
    G.*,
    ROW_NUMBER() OVER(PARTITION BY G.gender ORDER BY G.user_id) AS temp_rank
  FROM
    Genders G
)
SELECT
  T.user_id,
  T.gender
FROM
  temp_rankings T
ORDER BY
  T.temp_rank, FIELD(T.gender, 'female', 'other', 'male');
