--observe the silver data is cleaned or not

-- Total rows after cleaning
select count(*) from silver.traffic_clean;

-- First 10 rows
select * from silver.traffic_clean limit 10;

-- Check for NULLs in critical columns
select 
    count(*) as total_rows,
    count(traffic_date) as date_not_null,
    count(zone) as zone_not_null,
    count(vehicle_count) as vehicle_count_not_null
from silver.traffic_clean;
