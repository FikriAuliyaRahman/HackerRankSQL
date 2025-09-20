with max_scores_per_hacker as(
    select
      hacker_id,
      challenge_id,
      max(score) as max_score
    from Submissions
    group by hacker_id, challenge_id
),
all_hacker as (
    select
      Hackers.hacker_id,
      Hackers.name,
      sum(max_scores_per_hacker.max_score) as total_score
    from max_scores_per_hacker
    join Hackers on max_scores_per_hacker.hacker_id = Hackers.hacker_id
    group by Hackers.hacker_id, Hackers.name
    having sum(max_scores_per_hacker.max_score) > 0
)
select
  hacker_id,
  name,
  total_score
from all_hacker
order by total_score desc, hacker_id asc;