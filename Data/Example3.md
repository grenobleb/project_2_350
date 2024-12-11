# Example 3
The process for creating a table an injesting a csv is the same as example 1

## Step 1 
### Creating a table
Create the table userinfo_table in the demo database by executing the following sql script as the admin on the mysql server
```
USE demo;

CREATE TABLE userinfo_table (
    user_id INT NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    age INT,
    join_date DATE,
)
COMMENT "User Information table"
DISTRIBUTED BY HASH(user_id) BUCKETS 1
PROPERTIES ('replication_num' = '1');
```
## Step 2
### Using Apache Doris's stream method to injest a csv into the characterTable
You will use the same command as in example 1 using userinfo.csv instead of data.csv and userinfo_table instead of myTable in the last parameter.
```
curl  --location-trusted -u admin:doris-admin-password -T userinfo.csv -H "column_separator:," http://127.0.0.1:8030/api/demo/userinfo_table/_stream_load
```

## Step 3
### Verifying the table is populated in mysql
Make sure you are on the demo demo database using:
```
use demo
```
Verify that the userinfo_table has been created:
```
show tables;
```
Print the contents of the table:
```
select * from userinfo_table;
```