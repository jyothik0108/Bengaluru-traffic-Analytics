-- Task to populate Gold fact incrementally
create or replace table gold.task_silver_to_gold
warehouse = traffic_analysis
schedule = '5 MINUTE'
when system$STREAM_HAS_DATA('silver.traffic_clean_stream')
as
insert into gold.fact_traffic_metrics
select
    traffic_date,
    zone,
    time_slot,
    count(*) as total_records,
    sum(vehicle_count),
    avg(avg_speed_kmph),
    avg(congestion_index),
    sum(accident_count),
    avg(signal_delay_sec)
from silver.traffic_clean_stream
group by
    traffic_date,
    zone,
    time_slot;


--resume task
alter task gold.task_silver_to_gold RESUME;

