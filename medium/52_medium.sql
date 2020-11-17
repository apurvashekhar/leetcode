Q- Running Total for Different Genders
SELECT s.gender,
s.day,
SUM(s.score_points) OVER(PARTITION BY s.gender ORDER BY s.day) AS total
FROM Scores s
