Q- Actors and Directors Who Cooperated At Least Three Times
select actor_id, director_id
from
(select actor_id, director_id, count(*)
from ActorDirector
group by actor_id, director_id
having count(*) >= 3) foo
