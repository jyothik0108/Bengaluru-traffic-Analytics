--create table

CREATE OR REPLACE TABLE bronze.traffic_analysis_data(
    date                DATE,
    year                INT,
    month               STRING,
    day_of_week         STRING,
    area                STRING,
    zone                STRING,
    road_type           STRING,
    time_slot           STRING,
    traffic_level       STRING,
    avg_speed_kmph      INT,
    vehicle_count       INT,
    congestion_index    INT,
    accident_count      INT,
    weather_condition   STRING,
    signal_delay_sec    INT,
    road_work           STRING
);
