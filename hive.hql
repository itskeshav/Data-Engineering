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

#Describing database:
-You can use the DESCRIBE DATABASE command to view the location of the database and its properties.
DESCRIBE DATABASE EXTENDED database_name;

#Database listing:
SHOW DATABASES

#Dropping database:
DROP DATABASE [IF EXISTS] database_name [RESTRICT | CASCADE];





