# 2024 Roadmap
Source: [Apache Doris GitHub Issue #30669](https://github.com/apache/doris/issues/30669)

---

## Separation of Storage and Computation

- **Flexibility & Stateless**
  - Stateless FE Node

- **Performance**
  - Optimization for cold data querying

- **SLA**
  - Upgrade FE with no impact

- **Reliability**
  - Snapshot & Time Travel
  - Enhanced Backup and Restore

- **Data Sharing**

---

## Async Material View

- **Build Materialized View**
  - Support building MV from Iceberg table
  - Support building MV from Hudi table
  - Nested materialized view with DAG
  - Incremental building for external table with partition granularity
  - Support REPLACE operation
  - Support refreshed materialized view by time range

- **Materialized View Management**
  - Materialized view recommendation

---

## Query Optimizer

- **Basic Framework**
  - Fully supports DQL, DML, and DDL
  - Optimized apply order of RBO rules
  - Improved efficiency of Cascades enumeration

---

## Planning Quality

- **Statistics**
  - Support partition-level statistics collection
  - Supports histogram statistics collection

- **New Distributed Cost Model**
  - Optimized distributed cost model framework
  - Support runtime cost revaluation
  - Supports more accurate operator cost-fitting models

- **Rules and Enumerations**
  - Expand RBO rules
  - Improve the quality of Cascades enumeration plan
  - Enhanced dphyper enumeration framework function, supports outer join enumeration and CDC

- Supports histogram-based data skew adaptive processing framework

---

## DataLake Analysis

- **Support More File Formats**
  - RCFile
  - SequenceFile

- **Support More Lake Format**
  - Support more systable on Hudi
  - Support CDC scan on Hudi
  - Support more systable on Paimon

- **Trino Connector Compatibility**
  - Support Trino DeltaLake Connector
  - Support Trino Cassandra Connector

- **Datalake Write Back**
  - Iceberg: Support update and delete

- **Enhanced JDBC Catalog**
  - Support sharded database
  - Support query concurrency

- **Enhanced File Analysis**
  - Support insert into table value function

- **Enhanced File Cache**
  - Support memory-level file cache
  - Enhanced cache statistic and hits analysis

- **SQL Dialect Support**
  - Hive

---

## Query Processing

- **Resource Isolation**
  - Automatically workload management at runtime

- Support store procedure

- Working with shuffle service

- Stage-by-stage query processing

---

## Storage Engine

- **Data Loading**
  - Zero-ETL: Built-in data integration from OLTP CDC to Doris
  - Support MERGE INTO

- **Data Modeling**
  - Support CLUSTER BY
  - Support KEY column in arbitrary order

- **Cross-Cluster Replication**
  - Support Master/Slave switch
  - Support cross region deployment
  - Work with separation of storage and computation

- Support data binlog

- Enhanced Z-order index

- Optimized high concurrency point query

---

## Ecosystem & Tools

- **Cluster Manager for Apache Doris**
  - Support agent mode
  - Support k8s
  - Enhanced monitor and alert management
  - Visualized profile analysis
  - Support Notebook
  - Built-in visualized BI reports

- **X2Doris**
  - Support ClickHouse to Doris

- **BI Tools Compatibility**
  - Metabase
  - Navicat
  - Datagrip
  - Dbeaver
  - SmartBI
  - FineBI

- **Data Integration**
  - Kettle