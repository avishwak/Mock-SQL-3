-- Problem 2: Tournament Winners: https://leetcode.com/problems/tournament-winners/description/


with cte as (
select player_id, sum(score) as score from (
select first_player as player_id , first_score as score
from matches 
union all
select second_player as player_id , second_score as score
from matches 
) as temp
group by player_id),
cte2 as(
select group_id, cte.player_id, score, rank() over (partition by group_id order by score desc, player_id asc) as rnk
from cte
join players on cte.player_id=players.player_id)

select group_id, player_id
from cte2
where rnk = 1





