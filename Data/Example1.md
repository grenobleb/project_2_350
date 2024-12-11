# Test Example to Create a Database and Table
From [Doris Quick Start Guide](https://doris.apache.org/docs/gettingStarted/quick-start)

# Connect to Apache Doris
Use the admin account to connect to Doris:
```
mysql -uadmin -P9030 -h127.0.0.1
```

# Create database and table
```
create database demo;

use demo; 
create table mytable
(
    k1 TINYINT,
    k2 DECIMAL(10, 2) DEFAULT "10.05",    
    k3 CHAR(10) COMMENT "string column",    
    k4 INT NOT NULL DEFAULT "1" COMMENT "int column"
) 
COMMENT "my first table"
DISTRIBUTED BY HASH(k1) BUCKETS 1
PROPERTIES ('replication_num' = '1');
```

# Create .csv file with data you want to ingest
Save the following to data.csv
```
1,0.14,a1,20
2,1.04,b2,21
3,3.14,c3,22
4,4.35,d4,23
```

# Load data using Stream Load method
```
curl  --location-trusted -u admin:doris-admin-password -T data.csv -H "column_separator:," http://127.0.0.1:8030/api/demo/mytable/_stream_load
````

Once executed, the following will appear:
```
{                                                     
    "TxnId": 30,                                  
    "Label": "a56d2861-303a-4b50-9907-238fea904363",        
    "Comment": "",                                       
    "TwoPhaseCommit": "false",                           
    "Status": "Success",                                 
    "Message": "OK",                                    
    "NumberTotalRows": 4,                                
    "NumberLoadedRows": 4,                               
    "NumberFilteredRows": 0,                             
    "NumberUnselectedRows": 0,                          
    "LoadBytes": 52,                                     
    "LoadTimeMs": 206,                                    
    "BeginTxnTimeMs": 13,                                
    "StreamLoadPutTimeMs": 141,                           
    "ReadDataTimeMs": 0,                                 
    "WriteDataTimeMs": 7,                                
    "CommitAndPublishTimeMs": 42                         
} 
```
# Query Data

```
mysql> USE demo;
mysql> USE mytable;

mysql> SELECT * FROM mytable;
```

The following will be outputted:
```
+------+------+------+------+                                                                            
| k1   | k2   | k3   | k4   |                                                                                     
+------+------+------+------+                                                                           
|    1 | 0.14 | a1   |   20 |                                                                              
|    2 | 1.04 | b2   |   21 |                                                            
|    3 | 3.14 | c3   |   22 |                                                                           
|    4 | 4.35 | d4   |   23 |
+------+------+------+------+  
```

# Stop Apache Doris
```
./apache-doris/fe/bin/stop_fe.sh
./apache-doris/be/bin/stop_be.sh
```
