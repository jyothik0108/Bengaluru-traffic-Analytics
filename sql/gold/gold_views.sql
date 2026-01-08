--final secure view for powerbi
create or replace secure view gold.vw_traffic_dashboard as
select
    f.traffic_date,
    d.year,
    d.month,
    l.zone,
    l.area,
    f.time_slot,
    f.total_vehicle_count,
    f.avg_speed_kmph,
    f.avg_congestion_index,
    f.total_accidents
from gold.fact_traffic_metrics f
join gold.dim_date d
    on f.traffic_date = d.traffic_date
join gold.dim_location l
    on f.zone = l.zone;

