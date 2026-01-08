---clean data in silver layer

create or replace table silver.traffic_clean as
select 
    try_to_date(date, 'YYYY-MM-DD') as traffic_date,
    year,
    month,
    day_of_week,
    area,
    zone,
    road_type,
    time_slot,
    traffic_level,
    case when avg_speed_kmph >= 0 then avg_speed_kmph else null end as avg_speed_kmph,
    case when vehicle_count >= 0 then vehicle_count else null end as vehicle_count,
    case when congestion_index >= 0 then congestion_index else null end as congestion_index,
    case when accident_count >= 0 then accident_count else null end as accident_count,
    weather_condition,
    signal_delay_sec,
    road_work
from (
    select *,
           row_number() over (
               partition by date, area, zone, time_slot
               order by year desc
           ) as rn
    from bronze.traffic_analysis_data
)
where rn = 1
  and date is not null
  and zone is not null;
    



--validate data
select * from silver.traffic_clean
