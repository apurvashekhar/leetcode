Q- Game Play Analysis III
select a1.player_id, a1.event_date, sum(a2.games_played) as games_played_so_far
from activity a1 join activity a2 on a1.event_date >= a2.event_date
and a1.player_id = a2.player_id
group by a1.player_id, a1.event_date
