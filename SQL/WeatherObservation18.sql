with min_max_lat_long as (
    select
    min(Lat_N) as a,
    min(Long_W) as b,
    max(Lat_N) as c,
    max(Long_W) as d
    from Station
)

select
   cast(
    (abs(c - a) + abs(d - b))
    as decimal(10,4)
   ) as manhattan_distance
from min_max_lat_long;