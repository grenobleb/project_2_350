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