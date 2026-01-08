-- create VIEW(logical abstraction and reusable logic)
create or replace view silver.vw_traffic_clean as
select *
from silver.traffic_clean
where traffic_date is not null;