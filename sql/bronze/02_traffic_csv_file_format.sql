--CREATE FILE FORMAT FOR CSV FILE
create or replace file format bronze.traffic_csv_fiile_format
type = csv
field_delimiter =','                    -- values separated by comma
skip_header = 1                         -- skip the first row (header)
field_optionally_enclosed_by = '"'      -- handles quotes around strings
null_if = ('null','')                   -- treat 'NULL' or empty as NULL
empty_field_as_null = true;