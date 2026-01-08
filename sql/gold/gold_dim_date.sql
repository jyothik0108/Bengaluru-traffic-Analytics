--create dimension tables for star schema

--date dimension
create or replace table gold.dim_date as
select distinct
    traffic_date,
    year(traffic_date) as year,
    month(traffic_date) as month,
    day(traffic_date) as day,
    dayofweek(traffic_date) as day_of_week,
    week(traffic_date) as week_of_year
from silver.traffic_clean
where traffic_date is not null;

