with max_challenge as(
    select
      Challenges.challenge_id,
      Difficulty.score as max_score
    from Challenges
    join Difficulty 
      on Challenges.difficulty_level = Difficulty.difficulty_level
),
hacker_score as(
    select
      Submissions.hacker_id,
      count(*) as count_id
    from Submissions
    join max_challenge on Submissions.challenge_id = max_challenge.challenge_id
      and Submissions.score = max_challenge.max_score
    group by Submissions.hacker_id
    having count(*)>1
)
select
  Hackers.hacker_id,
  Hackers.name
from hacker_score
join Hackers on hacker_score.hacker_id = Hackers.hacker_id
order by hacker_score.count_id desc, Hackers.hacker_id asc;