--create snowpipe for fact TABLE
create or replace pipe bronze.traffic_pipe
auto_ingest = true
as
copy into bronze.yellow_taxi_trips_raw
from @bronze.nyc_taxi_trips_stage
pattern = '.*bengaluru-traffic_.*\.csv'
on_error = 'continue';

--decsribe pipe and one time connection is enough for all csv files
desc pipe bronze.traffic_pipe


--refresh pipe
alter pipe bronze.traffic_pipee refresh

--cheack pipe is running or not
select system$pipe_status('bronze.traffic_pipe')


--start and stop pipe data loading
alter pipe bronze.traffic_pipe set PIPE_EXECUTION_PAUSED = true

