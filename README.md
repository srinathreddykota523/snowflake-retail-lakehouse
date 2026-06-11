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
* Phase 3 — Data Modeling & Dataset Selection
* Phase 4 — Data Ingestion
* Phase 5 — Azure Setup & Snowpipe Automation
* Phase 6 — Transformation Layer
* Phase 7 — Dimensional Modeling
* Phase 8 — Streams + Tasks + Incremental Processing
* Phase 9 — Dynamic Tables
* Phase 10 — Security & Governance
* Phase 11 — Operations, Recovery & Cost Governance
* Phase 12 — Python Automation
* Phase 13 — dbt integration
* Phase 14 — Power BI
* Phase 15 — CI CD Pipeline

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

## Data Warehouse Model

The project follows a dimensional modeling approach.

### Star Schema

```text
                     DIM_DATE
                         |
                         |
DIM_CUSTOMERS ---- FACT_ORDERS ---- DIM_PRODUCTS
                         |
                         |
                    DIM_PAYMENTS
```

---

## Data Ingestion Layer

### Source Files

- Customers
- Orders
- Products
- Order Items
- Payments

### Ingestion Components

- Internal Stage
- CSV File Format
- COPY INTO Commands

### Raw Tables

- RAW_CUSTOMERS
- RAW_ORDERS
- RAW_PRODUCTS
- RAW_ORDER_ITEMS
- RAW_PAYMENTS

### Validation

- Row Count Verification
- Null Checks
- Duplicate Detection

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

## Azure Cloud Integration

The platform integrates Snowflake with Azure Blob Storage to support cloud-native ingestion patterns.

### Azure Resources

| Resource        | Value              |
| --------------- | ------------------ |
| Storage Account | retaillakehouse523 |
| Container       | retail-data        |

### Architecture

```text
CSV Files
      |
      v
Azure Blob Storage
      |
      v
Storage Integration
      |
      v
External Stage
      |
      v
Snowpipe
      |
      v
RAW Tables
```

### Security Features

* Managed Identity Authentication
* Storage Integration
* Least Privilege Access
* Environment Variable Based Secret Management

### Snowpipes

* CUSTOMERS_PIPE
* ORDERS_PIPE
* PRODUCTS_PIPE
* ORDER_ITEMS_PIPE
* PAYMENTS_PIPE

### Future Enhancements

* Azure Event Grid
* Azure Key Vault
* Azure Data Factory
* Near Real-Time Processing

---

## Transformation Layer

The transformation layer converts raw source data into standardized business-ready datasets.

### Transformation Tables

- CUSTOMERS_CLEAN
- ORDERS_CLEAN
- PRODUCTS_CLEAN
- PAYMENTS_CLEAN
- ORDER_ITEMS_CLEAN

### Data Quality Controls

- Null Checks
- Duplicate Checks
- Revenue Validation

### Business Rules

- Data Standardization
- Null Handling
- Invalid Record Removal

---

## Analytics Warehouse

The MART layer implements a dimensional model optimized for analytics and reporting.

### Dimension Tables

- DIM_CUSTOMERS
- DIM_PRODUCTS
- DIM_DATE
- DIM_PAYMENTS

### Fact Table

- FACT_ORDERS

### Metrics

- Revenue
- Order Count
- Average Order Value
- Top Products
- Monthly Sales

---

## Incremental Processing

The platform uses Snowflake Streams and Tasks to implement Change Data Capture (CDC) and automated transformations.

### Streams

- CUSTOMER_STREAM
- ORDER_STREAM
- PRODUCT_STREAM
- PAYMENT_STREAM
- ORDER_ITEM_STREAM

### Tasks

- Automated scheduling
- Incremental transformations
- Native Snowflake orchestration

### Benefits

- Reduced compute costs
- Faster processing
- Automated pipeline execution

---

## Dynamic Tables

The project demonstrates Snowflake Dynamic Tables as a modern alternative to Streams and Tasks.

### Implemented Objects

* DT_CUSTOMERS
* DT_PRODUCTS
* DT_SALES_SUMMARY

### Benefits

* Declarative Pipelines
* Automatic Refreshes
* Reduced Maintenance
* Native Incremental Processing

### Architecture

RAW
|
v
Dynamic Tables
|
v
Analytics Layer

### Comparison

The project includes both:

* Streams & Tasks
* Dynamic Tables

to demonstrate multiple Snowflake pipeline design patterns.

---

## Security & Governance

The platform implements enterprise-grade Snowflake security controls.

### Security Features

* Role-Based Access Control (RBAC)
* Secure Views
* Dynamic Data Masking
* Row-Level Security

### Roles

* DATA_ENGINEER_ROLE
* BI_ANALYST_ROLE
* AUDITOR_ROLE

### Governance Objectives

* Least Privilege Access
* Data Protection
* Controlled Analytics Access
* Auditability

---

## Operations & Governance

The platform incorporates operational controls to support enterprise reliability and cost management.

### Recovery Features

* Time Travel
* Zero Copy Cloning

### Cost Management

* Resource Monitors
* Warehouse Metering Analysis
* Auto Suspend / Resume

### Azure Integration

* Azure Blob Storage
* Managed Identity Authentication
* Azure Key Vault Design

### Governance

* Operational Monitoring
* Cost Visibility
* Disaster Recovery Planning

---

## Python Automation Framework

The platform includes a Python-based automation layer used for operational monitoring, validation, and governance activities.

### Utilities

| Utility                | Purpose                       |
| ---------------------- | ----------------------------- |
| dq_checks.py           | Data quality validation       |
| health_check.py        | Snowflake platform monitoring |
| metadata_report.py     | Metadata reporting            |
| validate_blob_files.py | Azure Blob validation         |

### Technologies

* snowflake-connector-python
* pandas
* python-dotenv
* azure-storage-blob
* openpyxl

### Configuration

Environment variables are managed through:

```text
.env
.env.example
```

### Outputs

Generated reports are stored in:

```text
reports/
```

### Design Principle

Python is used for automation and operational tooling while core data transformations remain inside Snowflake.

---

## dbt Integration

The platform uses dbt to manage transformations and analytics models.

### dbt Features

* Source Definitions
* Staging Models
* Mart Models
* Automated Tests
* Documentation Generation
* Data Lineage

### Model Layers

```text
RAW
 ↓
STAGING
 ↓
MARTS
```

### Testing

Implemented dbt tests:

* unique
* not_null

### Benefits

* Modular SQL
* Version Control
* Automated Documentation
* Analytics Engineering Best Practices

---

## Business Intelligence

The project includes a Power BI reporting layer built on top of Snowflake and dbt models.

### Dashboard Pages

- Executive Summary
- Customer Analytics
- Product Analytics
- Operational Analytics

### Key Metrics

- Revenue
- Orders
- Average Order Value
- Customer Count
- Product Performance

### Data Source

Snowflake MART Layer

### Technology

Power BI Desktop

---

## CI/CD Pipeline

The project uses GitHub Actions to automate validation and quality assurance processes.

### Workflows

* Python Validation
* dbt Validation
* Repository Structure Validation

### Benefits

* Automated Testing
* Continuous Validation
* Improved Quality
* Deployment Readiness

### Security

Credentials are not stored in source control.

Future integrations will use GitHub Secrets and Azure Key Vault for secure secret management.

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

## Architecture Decision Records

Major design decisions are documented throughout the project to explain the rationale behind architectural choices.

Examples include:

* Azure Blob Storage vs Internal Stages
* Snowpipe vs Manual COPY INTO
* Star Schema vs Normalized Reporting Model
* Managed Identity vs Storage Keys
* Dedicated Warehouses vs Shared Compute

See:

```text
docs/architecture_decisions.md
```

for detailed decision records.

---

## Author

Srinath Reddy Kota

Data Engineering Portfolio Project
