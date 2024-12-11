# Example 2
The process for creating a table an injesting a csv is the same as example 1

## Step 1 
### Creating a table
Create the table characterTable in the demo database by executing the following sql script as the admin on the mysql server
```
use demo; 
create table characterTable
(
    firstName VARCHAR(255) NOT NULL,  
    lastName VARCHAR(255) NOT NULL,  
    maxHealth INT NOT NULL,  
    strength INT NOT NULL,
    intelligence INT NOT NULL
) 
COMMENT "Fallout 4 Character Table"
DISTRIBUTED BY HASH(firstName) BUCKETS 1
PROPERTIES ('replication_num' = '1');
```
## Step 2
### Using Apache Doris's stream method to injest a csv into the characterTable
You will use the same command as in example 1 using characters.csv instead of data.csv and characterTable instead of myTable in the last parameter.
```
curl  --location-trusted -u admin:doris-admin-password -T characters.csv -H "column_separator:," http://127.0.0.1:8030/api/demo/characterTable/_stream_load
```

## Step 3
### Verifying the table is populated in mysql
Make sure you are on the demo demo database using:
```
use demo
```
Verify that the characterTable has been created:
```
show tables
```
Print the contents of the table:
```
select * from characterTable
```