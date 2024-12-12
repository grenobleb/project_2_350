# Example 5
The process for creating a table an injesting a csv is the same as example 1

## Step 1 
### Creating a table
Create the table pokemon_table in the demo database by executing the following sql script as the admin on the mysql server
```
create database demo;

use demo; 

create table pokemon_table
(
	id INT,
	name VARCHAR(50),
	type1 VARCHAR(50),
	type2 VARCHAR(50)
) 
COMMENT "Pokemon table"
DISTRIBUTED BY HASH(id) BUCKETS 1
PROPERTIES ('replication_num' = '1');

```
## Step 2
### Using Apache Doris's stream method to injest a csv into the characterTable
You will use the same command as in example 1 using pokemon.csv instead of data.csv and pokemon_table instead of myTable in the last parameter.
```
curl  --location-trusted -u admin:doris-admin-password -T pokemon.csv -H "column_separator:," http://127.0.0.1:8030/api/demo/pokemon_table/_stream_load
```

## Step 3
### Verifying the table is populated in mysql
Make sure you are on the demo demo database using:
```
use demo
```
Verify that the pokemon_table has been created:
```
show tables;
```
Print the contents of the table:
```
select * from pokemon_table;
```