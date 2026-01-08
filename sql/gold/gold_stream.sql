-- Stream on Silver table
create or replace stream silver.traffic_clean_stream
on table silver.traffic_clean
append_only = TRUE;