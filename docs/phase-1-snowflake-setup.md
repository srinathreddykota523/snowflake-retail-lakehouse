# Snowflake Infrastructure Setup

## Overview

This document describes the foundational Snowflake infrastructure created for the Retail Lakehouse Analytics Platform.

The objective of this phase is to establish a secure, scalable, and cost-efficient environment that supports data ingestion, transformation, analytics, and future platform expansion.

---

# Architecture Overview

The Snowflake environment is organized using a layered architecture and dedicated compute resources.

```text
RETAIL_LAKEHOUSE
│
├── RAW
├── TRANSFORM
├── MART
└── ADMIN

Warehouses
│
├── INGEST_WH
├── TRANSFORM_WH
└── ANALYTICS_WH
```

This separation improves maintainability, scalability, and workload isolation.

---

# Database

## RETAIL_LAKEHOUSE

The primary database used for the project.

### Purpose

* Store all project datasets
* Organize schemas and objects
* Support analytics and reporting workloads

### Design Considerations

* Single database approach keeps the project simple
* Suitable for small-to-medium analytics workloads
* Can be extended into multiple databases for larger environments

---

# Schema Design

The project follows a layered data architecture.

---

## RAW Schema

### Purpose

Stores source data with minimal transformation.

### Responsibilities

* Landing data from external sources
* Preserving original records
* Supporting data auditing and troubleshooting

### Examples

* RAW.CUSTOMERS
* RAW.ORDERS
* RAW.PRODUCTS
* RAW.PAYMENTS

---

## TRANSFORM Schema

### Purpose

Stores cleansed and standardized data.

### Responsibilities

* Data quality validation
* Deduplication
* Business rule application
* Incremental processing

### Examples

* TRANSFORM.CUSTOMERS_CLEAN
* TRANSFORM.ORDERS_CLEAN

---

## MART Schema

### Purpose

Provides analytics-ready datasets.

### Responsibilities

* Dimensional modeling
* Business metrics
* Reporting datasets
* Dashboard consumption

### Examples

* MART.FACT_ORDERS
* MART.DIM_CUSTOMERS
* MART.DIM_PRODUCTS
* MART.DIM_DATE

---

## ADMIN Schema

### Purpose

Stores operational and governance-related objects.

### Responsibilities

* Monitoring objects
* Audit tables
* Metadata tracking
* Operational logging

---

# Warehouse Design

Dedicated warehouses are used to isolate workloads.

This approach prevents resource contention between ingestion, transformation, and analytics processes.

---

## INGEST_WH

### Purpose

Handles data loading activities.

### Typical Workloads

* COPY INTO commands
* Snowpipe ingestion
* Stage validation

### Configuration

| Setting      | Value      |
| ------------ | ---------- |
| Size         | XSMALL     |
| Auto Resume  | Enabled    |
| Auto Suspend | 60 Seconds |

### Benefits

* Low operational cost
* Fast startup
* Dedicated ingestion resources

---

## TRANSFORM_WH

### Purpose

Processes transformation workloads.

### Typical Workloads

* SQL transformations
* Streams
* Tasks
* Dynamic Tables
* dbt execution

### Configuration

| Setting      | Value      |
| ------------ | ---------- |
| Size         | SMALL      |
| Auto Resume  | Enabled    |
| Auto Suspend | 60 Seconds |

### Benefits

* Isolates ETL processing
* Supports larger transformation workloads

---

## ANALYTICS_WH

### Purpose

Supports reporting and dashboard queries.

### Typical Workloads

* Power BI
* Ad hoc analysis
* Business reporting

### Configuration

| Setting      | Value      |
| ------------ | ---------- |
| Size         | XSMALL     |
| Auto Resume  | Enabled    |
| Auto Suspend | 60 Seconds |

### Benefits

* Prevents dashboards from impacting ETL jobs
* Improves user experience

---

# Security Architecture

The platform follows Snowflake Role-Based Access Control (RBAC) principles.

The primary objective is to enforce the Principle of Least Privilege.

Users receive only the permissions required to perform their responsibilities.

---

## DEVELOPER_ROLE

### Responsibilities

* Build pipelines
* Create tables
* Manage transformations
* Develop new data models

### Access

* RAW Schema
* TRANSFORM Schema
* Ingestion Warehouses
* Transformation Warehouses

---

## ANALYST_ROLE

### Responsibilities

* Query reporting datasets
* Build dashboards
* Perform business analysis

### Access

* MART Schema
* Analytics Warehouse

---

## READONLY_ROLE

### Responsibilities

* Read-only access to approved datasets

### Access

* Limited reporting access
* No modification permissions

---

# Grant Strategy

The project uses explicit privilege assignments.

Examples include:

* Database Usage
* Schema Usage
* Warehouse Usage

This approach improves governance and security.

---

# Resource Monitoring

A Resource Monitor is configured to control Snowflake credit consumption.

---

## RETAIL_MONITOR

### Purpose

Tracks warehouse credit usage and prevents unexpected cost overruns.

### Configuration

| Threshold | Action  |
| --------- | ------- |
| 75%       | Notify  |
| 90%       | Notify  |
| 100%      | Suspend |

### Benefits

* Cost visibility
* Budget protection
* Operational governance

---

# Cost Optimization Strategy

Several cost-control measures are implemented.

---

## Auto Suspend

Warehouses automatically suspend after 60 seconds of inactivity.

### Benefit

Prevents unnecessary compute charges.

---

## Auto Resume

Warehouses automatically restart when a query is submitted.

### Benefit

Improves usability while maintaining cost efficiency.

---

## Warehouse Isolation

Dedicated warehouses separate workloads.

### Benefits

* Better performance
* Easier troubleshooting
* Improved resource management

---

# Snowflake Best Practices Applied

The following best practices are implemented during infrastructure setup.

### Security

* Role-Based Access Control
* Least Privilege Principle
* Controlled Warehouse Access

### Cost Management

* Resource Monitor
* Auto Suspend
* Dedicated Compute Resources

### Scalability

* Layered Schema Design
* Workload Isolation
* Modular SQL Structure

### Maintainability

* Version Controlled SQL Scripts
* Structured Repository Layout
* Environment Documentation

---

# Validation Steps

The following commands can be used to validate infrastructure creation.

## Databases

```sql
SHOW DATABASES;
```

## Schemas

```sql
SHOW SCHEMAS;
```

## Warehouses

```sql
SHOW WAREHOUSES;
```

## Roles

```sql
SHOW ROLES;
```

## Resource Monitors

```sql
SHOW RESOURCE MONITORS;
```

---

# Deliverables

At the completion of this phase, the following components are available:

* Retail Lakehouse Database
* Layered Schema Architecture
* Dedicated Compute Warehouses
* Role-Based Security Model
* Resource Monitoring Framework
* Cost Optimization Controls

This infrastructure serves as the foundation for all future ingestion, transformation, analytics, governance, and reporting activities within the project.

---

# Next Phase

Phase 3 focuses on:

* Dataset Selection
* Business Requirements
* Star Schema Design
* Fact and Dimension Modeling
* Data Warehouse Architecture Planning

These activities prepare the platform for ingestion and transformation development.
