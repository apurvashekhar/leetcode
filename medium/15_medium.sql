Q- Movie Rating
(select name as results
from Movie_rating m, Users u
where m.user_id = u.user_id
group by m.user_id
order by count(*) desc, name
limit 1)
union
(select title
from (
select title, sum(rating)/count(m.movie_id) as avg_rating
from Movie_rating m join Movies mv
on m.movie_id = mv.movie_id
where date_format(created_at, '%Y-%m') = '2020-02'
group by m.movie_id) foo
order by avg_rating desc, title
limit 1)
