--create fact table(business matrics)
create or replace table gold.fact_traffic_metrics as
select
    traffic_date,
    zone,
    time_slot,

    count(*) as total_records,
    sum(vehicle_count) as total_vehicle_count,
    avg(avg_speed_kmph) as avg_speed_kmph,
    avg(congestion_index) as avg_congestion_index,
    sum(accident_count) as total_accidents,
    avg(signal_delay_sec) as avg_signal_delay_sec
from silver.traffic_clean
group by
    traffic_date,
    zone,
    time_slot;