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
