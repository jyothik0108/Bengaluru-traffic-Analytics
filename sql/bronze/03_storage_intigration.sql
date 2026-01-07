--CREATE STORAGE INTEGRATION OBJECT => goto google,search snowflake s3 storage integration snippet code copy and paste
CREATE or replace STORAGE INTEGRATION my_intg  --give any name
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN ='arn:aws:iam::021108908319:role/bengaluru_traffic_analysis'--copy the arn in aws and paste it 
STORAGE_ALLOWED_LOCATIONS = ('s3://bengaluru-traffic-analytics/csv/')  --copy the url s3 of csv or json folder from aws and paste it here
