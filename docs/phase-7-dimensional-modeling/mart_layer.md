# MART Layer

## Overview

The MART layer is the final analytical layer of the Retail Lakehouse Analytics Platform.

It contains business-ready datasets that are optimized for reporting, dashboarding, and self-service analytics.

The MART layer consumes data from the TRANSFORM layer and organizes it into a dimensional model.

---

# Architecture

```text id="2mp8sz"
RAW Layer
      |
      v
TRANSFORM Layer
      |
      v
MART Layer
      |
      v
Power BI
```

The MART layer acts as the primary interface for business users and reporting tools.

---

# Objectives

The MART layer was designed to:

* Provide analytics-ready datasets
* Simplify business reporting
* Improve query performance
* Standardize business metrics
* Support dashboard development

---

# MART Tables

## Dimension Tables

### DIM_CUSTOMERS

Provides customer attributes used for customer analysis.

Key analyses:

* Customer segmentation
* Geographic reporting
* Customer behavior

---

### DIM_PRODUCTS

Provides product attributes.

Key analyses:

* Product performance
* Category reporting
* Product trends

---

### DIM_DATE

Provides calendar attributes.

Key analyses:

* Monthly revenue
* Quarterly trends
* Year-over-year growth

---

### DIM_PAYMENTS

Provides payment attributes.

Key analyses:

* Payment method distribution
* Payment behavior analysis

---

## Fact Table

### FACT_ORDERS

Stores business transactions and measures.

Measures include:

* Payment Value
* Product Price
* Freight Value

The fact table serves as the central analytical dataset.

---

# Reporting Architecture

Business users interact with the MART layer instead of raw operational data.

Benefits include:

* Faster reporting
* Consistent metrics
* Reduced complexity
* Improved governance

---

# Business Metrics

The MART layer supports several key performance indicators.

## Revenue

Total sales generated across all orders.

---

## Order Count

Total number of completed orders.

---

## Average Order Value

Average revenue generated per order.

---

## Top Products

Products generating the highest sales volume.

---

## Monthly Sales Trends

Revenue performance over time.

---

# Query Performance

The MART layer is optimized for analytical workloads.

Benefits include:

* Reduced join complexity
* Simplified dashboard queries
* Faster aggregations
* Better reporting performance

Future optimization techniques will include:

* Clustering
* Materialized Views
* Dynamic Tables

---

# Power BI Consumption

The MART layer is the primary source for Power BI dashboards.

Planned dashboard pages include:

## Executive Dashboard

* Revenue
* Orders
* Average Order Value
* Customer Count

---

## Customer Analytics

* Customer Distribution
* Repeat Customers
* Customer Trends

---

## Product Analytics

* Product Categories
* Top Products
* Product Revenue

---

## Operational Analytics

* Pipeline Performance
* Data Quality Metrics

---

# Governance

The MART layer is governed through Snowflake Role-Based Access Control (RBAC).

Typical access pattern:

```text id="1n08f7"
ANALYST_ROLE
      |
      v
MART Layer
```

This ensures users access curated business data rather than raw operational datasets.

---

# Future Enhancements

The MART layer will evolve to include:

* Incremental Refresh
* Dynamic Tables
* Advanced Metrics
* Customer Lifetime Value
* Cohort Analysis
* Data Sharing

---

# Summary

The MART layer represents the final analytical layer of the platform.

It transforms cleansed operational data into business-ready datasets that support reporting, dashboarding, and enterprise analytics.

This layer serves as the foundation for all future business intelligence and reporting workloads within the project.
