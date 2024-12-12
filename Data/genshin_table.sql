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