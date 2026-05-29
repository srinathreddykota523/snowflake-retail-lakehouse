# Data Ingestion Pipeline

## Overview

This phase implements the raw data ingestion layer of the Retail Lakehouse Analytics Platform.

The objective is to load source retail datasets into Snowflake while preserving the original data structure and enabling future transformations.

The ingestion layer follows a simple and scalable architecture:

```text
CSV Files
    |
    v
Snowflake Stage
    |
    v
RAW Schema Tables
    |
    v
Validation Checks
```

This approach separates ingestion from transformation and follows modern ELT principles.

---

# Objectives

The ingestion layer was designed to:

* Load source data into Snowflake
* Preserve raw source records
* Establish repeatable ingestion processes
* Support future automation with Snowpipe
* Enable data quality validation
* Create a foundation for downstream transformations

---

# Source Dataset

The project uses the Olist Brazilian E-Commerce Dataset.

The following source files are ingested:

| Source File     | Description          |
| --------------- | -------------------- |
| customers.csv   | Customer information |
| orders.csv      | Order-level data     |
| products.csv    | Product catalog      |
| order_items.csv | Order line items     |
| payments.csv    | Payment transactions |

---

# Snowflake Objects Created

## File Format

### CSV_FORMAT

Defines how Snowflake interprets incoming CSV files.

Configuration includes:

* CSV file type
* Header skipping
* Null handling
* Quoted field support

Purpose:

* Standardized ingestion
* Consistent parsing behavior
* Reusable configuration

---

## Internal Stage

### RETAIL_STAGE

Stores uploaded source files before loading into tables.

Purpose:

* Centralized file storage
* Staging area for ingestion
* Simplified data loading

Benefits:

* Supports manual loading
* Can be extended to Snowpipe automation
* Enables ingestion auditing

---

# RAW Layer Design

The RAW schema stores source data with minimal transformation.

Guiding principles:

* Preserve source structure
* Avoid business logic
* Maintain auditability
* Enable reprocessing when necessary

---

# Raw Tables

## RAW_CUSTOMERS

Stores customer information.

Typical attributes include:

* Customer Identifier
* Customer Location
* Customer State

Purpose:

Supports customer analytics and dimensional modeling.

---

## RAW_ORDERS

Stores order-level transactions.

Typical attributes include:

* Order Identifier
* Customer Identifier
* Order Status
* Purchase Timestamp
* Delivery Timestamp

Purpose:

Acts as the primary business transaction source.

---

## RAW_PRODUCTS

Stores product information.

Typical attributes include:

* Product Identifier
* Product Category
* Product Dimensions
* Product Weight

Purpose:

Supports product performance analysis.

---

## RAW_ORDER_ITEMS

Stores individual order line items.

Typical attributes include:

* Order Identifier
* Product Identifier
* Price
* Freight Cost

Purpose:

Provides transaction-level sales detail.

---

## RAW_PAYMENTS

Stores payment information.

Typical attributes include:

* Order Identifier
* Payment Type
* Installments
* Payment Value

Purpose:

Supports payment and revenue analysis.

---

# Data Loading Strategy

Data is loaded using Snowflake COPY INTO commands.

General process:

```text
Upload File
      |
      v
RETAIL_STAGE
      |
      v
COPY INTO
      |
      v
RAW Table
```

Advantages:

* Fast bulk loading
* Native Snowflake functionality
* Scalable architecture
* Repeatable execution

---

# Data Validation

After ingestion, validation checks are performed to ensure data quality.

---

## Row Count Validation

Verifies that records were successfully loaded.

Examples:

* Customer row counts
* Order row counts
* Product row counts
* Payment row counts

Purpose:

Detect incomplete loads.

---

## Null Value Checks

Critical business identifiers are checked for null values.

Examples:

* customer_id
* order_id
* product_id

Purpose:

Identify missing key values.

---

## Duplicate Detection

Checks are performed against business keys.

Examples:

* Duplicate customers
* Duplicate orders

Purpose:

Identify ingestion anomalies.

---

# ELT Design Principles

This project follows an ELT (Extract, Load, Transform) approach.

Traditional ETL:

```text
Extract
   |
Transform
   |
Load
```

Snowflake ELT:

```text
Extract
   |
Load
   |
Transform
```

Reason:

Snowflake provides scalable compute resources that allow transformations to occur directly within the platform.

Benefits include:

* Simpler architecture
* Faster processing
* Better scalability
* Reduced operational complexity

---

# Current Architecture

```text
                        Snowflake

                             |
                             v

                     RAW.RETAIL_STAGE

                             |
                             v

        ------------------------------------------------
        |              |             |                |
        v              v             v                v

 RAW_CUSTOMERS   RAW_ORDERS   RAW_PRODUCTS   RAW_PAYMENTS
                        |
                        |
                        v
                RAW_ORDER_ITEMS
```

---

# Future Enhancements

The ingestion layer will be enhanced in future phases with:

## Snowpipe

Automated file ingestion.

Benefits:

* Event-driven loading
* Reduced manual effort
* Near real-time processing

---

## Streams

Change data capture support.

Benefits:

* Incremental processing
* Reduced compute costs

---

## Tasks

Automated scheduling.

Benefits:

* Hands-free pipeline execution
* Operational automation

---

# Lessons Learned

Key concepts demonstrated during this phase:

* Snowflake File Formats
* Internal Stages
* COPY INTO Commands
* Raw Data Layer Design
* ELT Architecture
* Data Validation Techniques

These components form the foundation for the transformation and analytics layers that will be implemented in later phases.

---

# Deliverables

The following artifacts were created during this phase:

## SQL Scripts

```text
sql/raw/
├── 01_create_file_formats.sql
├── 02_create_stages.sql
├── 03_create_raw_tables.sql
├── 04_load_raw_data.sql
└── 05_validation_queries.sql
```

## Snowflake Objects

```text
CSV_FORMAT
RETAIL_STAGE

RAW_CUSTOMERS
RAW_ORDERS
RAW_PRODUCTS
RAW_ORDER_ITEMS
RAW_PAYMENTS
```

## Validation

* Row Count Checks
* Null Value Checks
* Duplicate Detection

This completes the implementation of the Raw Data Ingestion Layer.
