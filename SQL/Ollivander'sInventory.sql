with wanted_wand as (
    select
      Wands.id,
      Wands_Property.age,
      Wands.coins_needed,
      Wands.power,
      min(Wands.coins_needed) over(partition by Wands_Property.age, Wands.power) as coins_min
    from Wands
    left join Wands_Property on Wands_Property.code = Wands.code
    where Wands_Property.is_evil = 0
)
select
  id,
  age,
  coins_needed,
  power
from wanted_wand
where coins_needed = coins_min
order by power desc, age desc;
