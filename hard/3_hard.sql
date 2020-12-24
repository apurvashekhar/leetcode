Q- Tournament Winners
select group_id,
player_id
from(
    select group_id,
    t2.player_id,
    score,
    max(score) over (partition by group_id) as highest_score
    from(
        select first_player as player_id,
        sum(first_score) as score
            from (select first_player,first_score
                    from Matches
                    union all
                    select second_player, second_score
                    from Matches) t1
        group by first_player) t2,
        Players p
     where p.player_id = t2.player_id) final
where score = highest_score
group by group_id, highest_score
having min(player_id)
