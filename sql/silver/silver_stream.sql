--create stream for increamental processing
create or replace stream bronze.traffic_bronze_stream
on table bronze.traffic_analysis_data
append_only = TRUE;