# Example 4
The process for creating a table an injesting a csv is the same as example 1

## Step 1 
### Creating a table
Create the table genshin_table in the demo database by executing the following sql script as the admin on the mysql server
```
USE demo;

CREATE TABLE genshin_table (
    character_name VARCHAR(255) NOT NULL,
    element VARCHAR(50),
    weapon VARCHAR(50),
    region VARCHAR(50)
)
COMMENT "Genshin Impact Characters table"
DISTRIBUTED BY HASH(character_name) BUCKETS 1
PROPERTIES ('replication_num' = '1');

```
## Step 2
### Using Apache Doris's stream method to injest a csv into the characterTable
You will use the same command as in example 1 using genshin.csv instead of data.csv and genshin_table instead of myTable in the last parameter.
```
curl  --location-trusted -u admin:doris-admin-password -T genshin.csv -H "column_separator:," http://127.0.0.1:8030/api/demo/genshin_table/_stream_load
```

## Step 3
### Verifying the table is populated in mysql
Make sure you are on the demo demo database using:
```
use demo
```
Verify that the genshin_table has been created:
```
show tables;
```
Print the contents of the table:
```
select * from genshin_table;
```