--validate query
select count(*) from gold.fact_traffic_metrics;

select * from gold.vw_traffic_dashboard limit 10;

show tasks in gold;

select * 
from table(information_schema.task_history())
order by scheduled_time desc;
