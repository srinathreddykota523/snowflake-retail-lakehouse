# Dynamic Tables

## Overview

Dynamic Tables are a modern Snowflake feature that enables declarative data pipelines.

Instead of manually orchestrating data movement using Streams, Tasks, and MERGE statements, Snowflake automatically maintains table freshness.

---

# Architecture

RAW
|
v
Dynamic Tables
|
v
MART

---

# Benefits

* Reduced operational complexity
* Less SQL code
* Automatic refresh management
* Native incremental processing

---

# Implemented Dynamic Tables

## DT_CUSTOMERS

Customer transformation logic.

---

## DT_PRODUCTS

Product transformation logic.

---

## DT_SALES_SUMMARY

Aggregated monthly sales metrics.

---

# TARGET_LAG

TARGET_LAG defines the maximum acceptable data staleness.

Example:

5 minutes

Snowflake automatically refreshes tables to maintain this freshness objective.

---

# Monitoring

Dynamic Tables can be monitored using:

* SHOW DYNAMIC TABLES
* Refresh History
* Query History

---

# Business Value

Dynamic Tables simplify pipeline maintenance while providing fresh analytical data.

They reduce the need for custom orchestration and improve developer productivity.
