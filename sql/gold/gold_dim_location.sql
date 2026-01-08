--loaction dimension
create or replace table gold.dim_location as
select distinct
    zone,
    area,
    road_type
from silver.traffic_clean
where zone is not null;