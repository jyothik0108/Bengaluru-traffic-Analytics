Bengaluru Traffic Analytics – Snowflake End-to-End Data Engineering Project

1.Project Overview :

This project implements an end-to-end cloud data engineering pipeline using AWS S3, Snowflake, and Power BI to analyze Bengaluru traffic data.
The pipeline follows a modern ELT architecture with Bronze, Silver, and Gold layers, supports continuous data ingestion, and delivers business-ready analytics for visualization.


The goal of this project is to demonstrate:

	1.Real-time / near real-time data ingestion
	2.Data cleaning and transformation using Snowflake SQL
	3.Incremental processing using Streams and Tasks
	4.Analytics-ready fact and dimension tables
	5.power BI reporting using Power BI
	6.Proper version control using GitHub

2.Folder Structure :

Bengaluru-traffic-Analytics/
│
├── sql/
│   ├── bronze/
│   │   ├── create_bronze_tables.sql
│   │   ├── snowpipe_ingestion.sql
│   │
│   ├── silver/
│   │   ├── traffic_clean.sql
│   │   ├── silver_stream_task.sql
│   │
│   ├── gold/
│   │   ├── dim_date.sql
│   │   ├── dim_location.sql
│   │   ├── fact_traffic_metrics.sql
│   │   ├── gold_stream_task.sql
│   │   ├── gold_views.sql
│
├── powerbi/
│   └── bengaluru_traffic_dashboard.pbix
│
├── docs/
│   └── architecture_diagram.png
│
└── README.md



3.Data flow architecture :

Traffic CSV Files
        ↓
Amazon S3 (Raw Storage)
        ↓
Snowflake External Stage
        ↓
Snowpipe (Auto Ingest)
        ↓
BRONZE – Raw Traffic Data
        ↓
STREAM + TASK
        ↓
SILVER – Cleaned & Deduplicated Data
        ↓
STREAM + TASK
        ↓
GOLD – Fact & Dimension Tables
        ↓
Views
        ↓
Power BI Dashboards



4.Data Layers Explaination :

	1.Bronze Layer (Raw Data)
		> Stores raw traffic data exactly as received
		> Data is ingested automatically from S3 using Snowpipe
		> No transformations applied
	Key Objects :
		> bronze.traffic_analysis_data
		> External Stage
		> File Format
		> Snowpipe
		

	2.Silver Layer (Cleaned & Processed Data)
		> Removes duplicates using ROW_NUMBER()
		> Handles nulls and invalid values
		> Converts date formats
		> Applies basic business rules
	Key Features Used :
		> Window Functions
		>Data Validation
		> Streams (incremental capture)
		> Tasks (automation)
		> Clustering for performance
		> Time Travel for historical analysis
	Key Table :
		> silver.traffic_clean


	3.Gold Layer (Analytics & Business Layer)
		> Star schema design
		> Aggregated KPIs
		> Optimized for BI queries
	Dimension Tables :
		> gold.dim_date
		> gold.dim_location
	Fact Table :
		> gold.fact_traffic_metrics
	BI View :
		> gold.vw_traffic_dashboard



5.Snowflake Features Used
	1.Data Ingestion :
		Snowpipe – continuous ingestion from S3

	2.Data Processing :
		Streams – track incremental changes
		Tasks – schedule automated transformations

	3.Performance Optimization :
		Clustering on date and zone
		Warehouse scaling

	4.Data Governance :
		Time Travel – query historical data
		Query History
		Copy History
		Task History
		
		
		
6.How to Run the Project :

Step 1: Setup Infrastructure :
		Create Snowflake warehouse, database, and schemas
		Configure AWS S3 bucket
		Setup Snowflake Storage Integration
		
Step 2: Bronze Layer :
		Create raw tables
		Create stage and file format
		Configure Snowpipe
		Upload CSV files to S3
		
Step 3: Silver Layer :
		Run data cleaning SQL
		Create stream on Bronze
		Create task for Bronze → Silver automation
		
Step 4: Gold Layer :
		Create dimension and fact tables
		Create stream on Silver
		Create task for Silver → Gold automation
		Create reporting views
		
Step 5: Power BI :
		Connect Power BI to Snowflake
		Use Gold views for reporting
		
		
		
7.How to Observe Incremental Loading :
	
	1.Check Stream Data
	
		SELECT * FROM bronze.traffic_bronze_stream;
		SELECT * FROM silver.traffic_clean_stream;
		
	2.Check Task Status
	
		SHOW TASKS;

	3.Task Execution History
	
		SELECT *
		FROM TABLE(information_schema.task_history())
		ORDER BY scheduled_time DESC;

	4.Copy History (Snowpipe)
	
		SELECT *
		FROM TABLE(
			information_schema.copy_history(
				table_name=>'BRONZE.TRAFFIC_ANALYSIS_DATA',
				start_time=>DATEADD('hour', -24, CURRENT_TIMESTAMP())
			)
		);



8.Tools & Technologies : 
	Snowflake (AWS)
	Amazon S3
	Snowpipe
	SQL
	Power BI
	Git & GitHub
	
	

9. Power BI Dashboards :
		1.Traffic Overview
		2.Zone analysis
		3.Time slot and Peak hours analysis
		4.Accident and Saftey analysis
		5.Performance Matrics