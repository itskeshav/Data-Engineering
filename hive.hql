#Create Database
CREATE DATABASE IF NOT EXISTS mydatabase
COMMENT 'This is a sample database for demonstration purposes'
LOCATION '/user/hive/data/mydatabase'
WITH DBPROPERTIES ('owner'='JohnDoe', 'creation_date'='2023-07-23');

/*
In Apache Hive, the default location for a database inside HDFS (Hadoop Distributed File System) 
is determined by the hive.metastore.warehouse.dir configuration property. By default, this property is set to /user/hive/warehouse.
If you want to specify a different default location for the warehouse directory, you can set the hive.metastore.warehouse.dir 
property to the desired HDFS path in the hive-site.xml configuration file
*/

#Describing database:You can use the DESCRIBE DATABASE command to view the location of the database and its properties.
DESCRIBE DATABASE EXTENDED database_name;

#Database listing:
SHOW DATABASES

#Dropping database:
DROP DATABASE [IF EXISTS] database_name [RESTRICT | CASCADE];

#Create Table:
CREATE [EXTERNAL] TABLE [IF NOT EXISTS] table_name
(
  column1 data_type [COMMENT 'column_comment'],
  column2 data_type [COMMENT 'column_comment'],
  ...
)
[COMMENT 'table_comment']
[PARTITIONED BY (partition_column data_type [COMMENT 'column_comment'], ...)]
[CLUSTERED BY (clustered_column_name) [SORTED BY (sort_order_column ASC|DESC)] INTO num_buckets BUCKETS]
[ROW FORMAT DELIMITED
  [FIELDS TERMINATED BY 'field_terminator']
  [COLLECTION ITEMS TERMINATED BY 'collection_item_terminator']
  [MAP KEYS TERMINATED BY 'map_key_terminator']
  [LINES TERMINATED BY 'line_terminator']
]
[STORED AS file_format]
[LOCATION 'hdfs_location']
[TBLPROPERTIES ('key1'='value1', 'key2'='value2', ...)];


#Load Data:
/*
The LOAD DATA command in Hive is used to load data from an external file or HDFS directory into a Hive table. 
It is a way to populate a Hive table with data for further processing and analysis.

Let's break down the components of the LOAD DATA command:

LOAD DATA: The starting keyword to indicate that you want to load data into a Hive table.
LOCAL (optional): If the keyword LOCAL is specified, Hive will look for the data file in the local file system of the machine 
                  where the Hive query is executed. If it is not specified, Hive will look for the data file in HDFS.
INPATH 'input_file_or_directory': Specifies the path to the data file or directory that contains the data to be loaded. 
                                  The path can be an HDFS location or a local file path, depending on whether the LOCAL keyword is used.
OVERWRITE (optional): If the keyword OVERWRITE is specified, it will delete the existing data in the target table before loading new data.
                      If OVERWRITE is not used, the data will be appended to the existing data in the table.
INTO TABLE table_name: Specifies the name of the Hive table where the data will be loaded.
PARTITION (partition_column=value, ...) (optional): If the target table is a partitioned table, you can specify the partition column and its 
                                                    value to load the data into a specific partition. If the partition does not exist, 
                                                    Hive will create it automatically.
*/
LOAD DATA [LOCAL] INPATH 'input_file_or_directory'
[OVERWRITE] INTO TABLE table_name [PARTITION (partition_column=value, ...)];


## Descibe table
DESCRIBE EXTENDED <table_name>;
DESCRIBE FORMATTED <table_name>;
DESCRIBE FUNCTION <function_name>;
DESCRIBE VIEW <view_name>;
DESCRIBE INDEX <index_name> ON <table_name>;
DESCRIBE FORMATTED FUNCTION <function_name>;







