# Interview Guide

# Retail Lakehouse Analytics Platform
## Snowflake + Azure + dbt + Power BI

---

# Project Summary

I built an end-to-end Retail Lakehouse Analytics Platform on Snowflake using Azure Blob Storage as the cloud landing zone.

The platform ingests retail data from Azure into Snowflake using Storage Integrations, External Stages, and Snowpipe. Data is processed through RAW, TRANSFORM, and MART layers using Snowflake SQL, Streams, Tasks, Dynamic Tables, and dbt. The final analytics layer is exposed through a dimensional model and consumed by Power BI dashboards.

The platform also includes Python-based operational utilities, security governance controls, CI/CD automation using GitHub Actions, and cost optimization practices.

---

# Business Problem

Retail companies generate large volumes of transactional data.

The challenge is to:

- Ingest data reliably
- Maintain data quality
- Create trusted business metrics
- Enable self-service analytics
- Control costs
- Secure sensitive data

The objective of this project was to build a cloud-native analytics platform that addresses these requirements.

---

# Architecture Overview

```text
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
RAW Layer
        |
        +--------------------+
        |                    |
        v                    v
Streams & Tasks     Dynamic Tables
        |                    |
        +---------+----------+
                  |
                  v
          TRANSFORM Layer
                  |
                  v
             dbt Models
                  |
                  v
             MART Layer
                  |
                  v
              Power BI
```

---

# Technology Stack

## Cloud

- Microsoft Azure Blob Storage

## Data Warehouse

- Snowflake

## Analytics Engineering

- dbt

## Programming

- Python

## Business Intelligence

- Power BI

## Version Control

- Git

## CI/CD

- GitHub Actions

---

# Why Azure Blob Storage?

## Question

Why did you use Azure Blob Storage instead of loading files directly into Snowflake?

## Answer

Azure Blob Storage acts as the cloud landing zone for source data.

Benefits:

- Separation of storage and compute
- Lower storage costs
- Enterprise-standard architecture
- Scalability
- Integration with Azure services

Most enterprise data platforms use cloud object storage as the system of record before data enters the warehouse.

---

# Why Snowflake?

## Question

Why did you choose Snowflake?

## Answer

Snowflake provides:

- Separation of compute and storage
- Elastic scalability
- Native cloud architecture
- Time Travel
- Zero Copy Cloning
- Automatic optimization
- Strong security and governance features

It significantly reduces infrastructure management compared to traditional data warehouses.

---

# Data Architecture

## Question

Why did you create multiple layers?

## Answer

I implemented a layered architecture:

```text
RAW
 |
TRANSFORM
 |
MART
```

Benefits:

- Separation of concerns
- Easier debugging
- Better governance
- Improved maintainability
- Clear data lineage

Each layer has a specific responsibility.

---

# RAW Layer

## Purpose

Stores source data with minimal transformation.

Responsibilities:

- Initial ingestion
- Historical preservation
- Auditability

Objects:

- RAW_CUSTOMERS
- RAW_ORDERS
- RAW_PRODUCTS
- RAW_ORDER_ITEMS
- RAW_PAYMENTS

---

# TRANSFORM Layer

## Purpose

Applies business rules and data quality logic.

Responsibilities:

- Standardization
- Null handling
- Deduplication
- Data cleansing

Objects:

- CUSTOMERS_CLEAN
- ORDERS_CLEAN
- PRODUCTS_CLEAN
- PAYMENTS_CLEAN
- ORDER_ITEMS_CLEAN

---

# MART Layer

## Purpose

Provides business-ready datasets.

Responsibilities:

- Reporting
- Analytics
- Power BI consumption

Objects:

- DIM_CUSTOMERS
- DIM_PRODUCTS
- DIM_DATE
- DIM_PAYMENTS
- FACT_ORDERS

---

# Snowpipe

## Question

What is Snowpipe?

## Answer

Snowpipe is Snowflake's continuous ingestion service.

It automatically loads files from cloud storage into Snowflake tables.

Benefits:

- Serverless
- Automated ingestion
- Reduced operational effort
- Near real-time processing

---

# Storage Integration

## Question

How did Snowflake access Azure Storage?

## Answer

I used a Storage Integration with Azure Managed Identity.

Benefits:

- No storage keys
- No SAS tokens
- Centralized security
- Least privilege access

This is considered a best practice for Azure-Snowflake integration.

---

# Streams

## Question

What are Streams?

## Answer

Streams capture table changes.

They track:

- Inserts
- Updates
- Deletes

Streams provide Change Data Capture (CDC) capabilities and enable incremental processing.

---

# Tasks

## Question

What are Tasks?

## Answer

Tasks are Snowflake's native scheduling mechanism.

I used Tasks to automate incremental transformations based on data captured by Streams.

Benefits:

- Native orchestration
- Automated processing
- Reduced manual intervention

---

# Dynamic Tables

## Question

What are Dynamic Tables?

## Answer

Dynamic Tables are declarative pipelines managed by Snowflake.

Instead of manually creating Streams, Tasks, and MERGE statements, Snowflake automatically refreshes downstream datasets.

Benefits:

- Less maintenance
- Simpler architecture
- Automatic incremental processing

---

# Streams & Tasks vs Dynamic Tables

## Question

When would you choose one over the other?

## Answer

### Streams & Tasks

Use when:

- Complex orchestration is required
- Custom logic is needed
- Multiple processing stages exist

### Dynamic Tables

Use when:

- Transformations are straightforward
- Reduced operational overhead is desired
- Faster development is important

In this project I implemented both approaches to demonstrate the trade-offs.

---

# Dimensional Modeling

## Question

Why did you build a Star Schema?

## Answer

Star schemas are optimized for analytical workloads.

Benefits:

- Simpler queries
- Faster reporting
- Better Power BI performance
- Easier adoption by business users

Architecture:

```text
DIM_CUSTOMERS
DIM_PRODUCTS
DIM_DATE
DIM_PAYMENTS

        |
        |
FACT_ORDERS
```

---

# Fact Table Grain

## Question

What is the grain of FACT_ORDERS?

## Answer

One record per order transaction.

Defining grain clearly is critical because it determines:

- Aggregation behavior
- Metric calculations
- Reporting accuracy

---

# Surrogate Keys

## Question

Why did you use surrogate keys?

## Answer

Examples:

- CUSTOMER_KEY
- PRODUCT_KEY
- DATE_KEY
- PAYMENT_KEY

Benefits:

- Better join performance
- Stable identifiers
- Support for Slowly Changing Dimensions
- Reduced dependency on source systems

---

# dbt

## Question

Why did you add dbt?

## Answer

dbt introduces:

- Modular SQL development
- Automated testing
- Documentation generation
- Lineage tracking
- Dependency management

It aligns the project with modern analytics engineering practices.

---

# dbt Layers

```text
RAW
 |
STAGING
 |
MARTS
```

## Staging

Standardizes source data.

## Marts

Creates business-ready analytical models.

---

# dbt Tests

## Implemented Tests

- not_null
- unique

Future enhancements:

- relationships
- accepted_values
- custom business tests

---

# Power BI

## Question

Why Power BI?

## Answer

Power BI provides:

- Business-friendly dashboards
- Strong Snowflake connectivity
- Interactive reporting
- Executive-level insights

Dashboard pages:

- Executive Summary
- Customer Analytics
- Product Analytics
- Operational Analytics

---

# Python Automation

## Question

Why use Python if Snowflake already handles transformations?

## Answer

I intentionally kept transformation logic inside Snowflake.

Python is used for:

- Data quality checks
- Platform monitoring
- Metadata reporting
- Azure validation

This avoids duplicating warehouse functionality.

---

# Security

## Implemented Controls

### RBAC

Roles:

- DATA_ENGINEER_ROLE
- BI_ANALYST_ROLE
- AUDITOR_ROLE

### Secure Views

Protect underlying objects.

### Masking Policies

Hide sensitive data.

### Row Access Policies

Restrict access to specific data subsets.

---

# Cost Optimization

## Techniques Implemented

- Auto Suspend
- Auto Resume
- Dedicated Warehouses
- Incremental Processing
- Dynamic Tables
- Snowpipe

Monitoring:

- Resource Monitors
- Query History
- Warehouse Metering History

---

# Disaster Recovery

## Time Travel

Allows access to historical table versions.

Use Cases:

- Recover deleted data
- Audit changes
- Investigate issues

---

## Zero Copy Cloning

Benefits:

- Instant environments
- No data duplication
- Development sandboxes
- Testing environments

---

# CI/CD

## GitHub Actions

Implemented workflows:

- Python Validation
- dbt Validation
- Repository Structure Validation

Benefits:

- Automated quality checks
- Continuous validation
- Improved reliability

---

# Biggest Challenges

## Challenge 1

Designing a layered architecture while keeping it simple.

### Solution

Implemented:

RAW → TRANSFORM → MART

which balances simplicity and scalability.

---

## Challenge 2

Managing incremental processing.

### Solution

Implemented both:

- Streams & Tasks
- Dynamic Tables

to compare approaches.

---

## Challenge 3

Security and governance.

### Solution

Implemented:

- RBAC
- Masking Policies
- Row Access Policies
- Secure Views

---

# Future Enhancements

Planned improvements:

- Snowpark Python
- Snowpipe Streaming
- Azure Key Vault
- Terraform
- Azure Data Factory
- Real-Time Event Processing
- Data Sharing
- Native Apps

---

# Key Interview Takeaways

This project demonstrates practical experience with:

- Azure Blob Storage
- Snowflake Warehouses
- Storage Integrations
- External Stages
- Snowpipe
- Streams
- Tasks
- Dynamic Tables
- Time Travel
- Zero Copy Cloning
- Resource Monitors
- RBAC
- Masking Policies
- Row Access Policies
- dbt
- Power BI
- Python Automation
- GitHub Actions
- Cost Optimization
- Dimensional Modeling

---

# Closing Summary

This project simulates a production-style analytics platform that ingests retail data from Azure, processes it within Snowflake using modern analytics engineering practices, and delivers business insights through Power BI while maintaining security, governance, operational monitoring, and cost control.