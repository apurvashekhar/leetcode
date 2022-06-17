Q- Grand Slam Title
select player_id, player_name, count(player_name) as grand_slams_count
from (
select player_name, player_id
from players join championships
on player_id = Wimbledon
union all
select player_name, player_id
from players join championships
on player_id = Fr_open
union all
select player_name, player_id
from players join championships
