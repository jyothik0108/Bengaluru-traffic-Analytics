--create stage for data load into snowflake from AWS
create or replace stage bronze.traffic_stage
url = 's3://bengaluru-traffic-analytics/csv/'
storage_integration = my_intg 
file_format = bronze.traffic_csv_fiile_format