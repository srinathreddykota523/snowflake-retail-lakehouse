# Retail Lakehouse Analytics Platform on Snowflake

## Project Overview

An end-to-end retail analytics platform built on Snowflake to demonstrate modern data engineering and analytics engineering practices.

This project showcases:

* Snowflake Data Warehousing
* Layered Data Architecture
* Snowpipe Ingestion
* Streams & Tasks
* Dynamic Tables
* RBAC Security
* Query Optimization
* dbt Transformations
* Power BI Reporting
* GitHub CI/CD

The project is being developed incrementally using a production-style workflow with version control, documentation, and infrastructure-as-code principles.

---

## Current Status

### Completed

* Phase 1 — Project Initialization
* Phase 2 — Snowflake Infrastructure Setup

### In Progress

* Phase 3 — Data Modeling & Dataset Selection

### Planned

* Data Ingestion
* Snowpipe Automation
* Star Schema Modeling
* Streams & Tasks
* Dynamic Tables
* dbt Integration
* Power BI Dashboard
* CI/CD Pipeline

---

## Business Scenario

A retail company generates transactional data from:

* Customers
* Orders
* Products
* Payments

The business requires a centralized analytics platform capable of providing insights into:

* Revenue trends
* Customer behavior
* Product performance
* Sales growth
* Operational metrics

This project demonstrates how Snowflake can be used to build a scalable analytics solution.

---

## Architecture

Current architecture:

```text
                    Snowflake
                         │
      ┌──────────────────┼──────────────────┐
      │                  │                  │
      ▼                  ▼                  ▼

    RAW             TRANSFORM            MART
   Schema            Schema             Schema

      │                  │                  │
      └──────────► Analytics Layer ◄────────┘

                 ANALYTICS_WH
```

Target architecture:

```text
Source Files
      │
      ▼
Snowflake Stage
      │
      ▼
RAW Layer
      │
      ▼
Streams & Tasks
      │
      ▼
TRANSFORM Layer
      │
      ▼
MART Layer
      │
      ▼
Power BI Dashboard
```

---

## Technology Stack

| Component             | Technology     |
| --------------------- | -------------- |
| Data Warehouse        | Snowflake      |
| Transformation        | SQL            |
| Analytics Engineering | dbt            |
| Scripting             | Python         |
| Visualization         | Power BI       |
| Version Control       | Git            |
| Repository Hosting    | GitHub         |
| CI/CD                 | GitHub Actions |

---

## Repository Structure

```text
snowflake-retail-lakehouse/
│
├── datasets/
├── sql/
│   ├── setup/
│   ├── raw/
│   ├── transformations/
│   ├── advanced/
│   └── optimization/
│
├── dbt/
├── python/
├── dashboards/
├── docs/
└── .github/
```

---

## Snowflake Infrastructure

### Database

```text
RETAIL_LAKEHOUSE
```

### Schemas

```text
RAW
TRANSFORM
MART
ADMIN
```

### Warehouses

```text
INGEST_WH
TRANSFORM_WH
ANALYTICS_WH
```

### Roles

```text
DEVELOPER_ROLE
ANALYST_ROLE
READONLY_ROLE
```

### Governance

* Resource Monitor
* Warehouse Isolation
* Least Privilege Access
* Role-Based Access Control

---

## Documentation

| Document                 | Description                         |
| ------------------------ | ----------------------------------- |
| docs/project_overview.md | Project objectives and architecture |
| docs/snowflake_setup.md  | Infrastructure setup                |
| docs/setup_guide.md      | Development workflow and tooling    |

---

## Development Workflow

```text
VS Code
   │
   ▼
Snowflake Extension
   │
   ▼
Execute SQL
   │
   ▼
Validate
   │
   ▼
Git Commit
   │
   ▼
GitHub
```

---

## Git Commit History

Major milestones are committed separately to demonstrate incremental development and version control discipline.

Examples:

* Initial project structure
* Infrastructure setup
* RBAC implementation
* Cost governance
* Documentation updates

---

## Cost Optimization

Implemented:

* Auto Suspend
* Auto Resume
* Dedicated Warehouses
* Resource Monitor

Planned:

* Query Optimization
* Clustering
* Performance Benchmarking

---

## Security

Implemented:

* RBAC
* Role Separation
* Warehouse Access Controls

Planned:

* Secure Views
* Masking Policies
* Row Access Policies

---

## Future Enhancements

* Snowpipe Auto Ingestion
* Streams & Tasks
* Dynamic Tables
* dbt Models
* Snowpark Python
* Cortex AI Exploration
* Power BI Dashboard
* GitHub Actions CI/CD

---

## Author

Srinath Reddy Kota

Data Engineering Portfolio Project
