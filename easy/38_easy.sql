Q- Friendly Movies Streamed Last Month
select distinct title
from Content c, TVProgram t
where Kids_content = 'Y'
and content_type = 'movies'
and date_format(t.program_date, '%Y-%m') = '2020-06'
and t.content_id = c.content_id
