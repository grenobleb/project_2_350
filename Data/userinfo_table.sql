
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