Q-  Average Time of Process per Machine
SELECT machine_id, ROUND(AVG(processing_time),3) as processing_time
FROM
(
SELECT machine_id,
SUM(CASE WHEN activity_type = 'start' THEN -timestamp ELSE timestamp END) as processing_time
FROM activity
GROUP BY process_id, machine_id
)foo
GROUP BY machine_id
