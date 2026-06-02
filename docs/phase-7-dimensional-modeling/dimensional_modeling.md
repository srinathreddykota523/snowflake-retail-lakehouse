# Dimensional Modeling

## Overview

The Retail Lakehouse Analytics Platform uses a dimensional modeling approach based on the Kimball methodology.

Dimensional modeling organizes data into fact and dimension tables to support analytical workloads, reporting, and business intelligence applications.

This approach is widely adopted in modern data warehouses because it simplifies querying and improves reporting performance.

---

# Why Dimensional Modeling

Operational systems are optimized for transactions.

Analytics systems are optimized for reporting.

A dimensional model bridges this gap by organizing data into structures that are easy for analysts and reporting tools to consume.

Benefits include:

* Simplified business reporting
* Improved query performance
* Easier dashboard development
* Consistent business definitions
* Better scalability

---

# Modeling Methodology

This project follows the Kimball dimensional modeling approach.

Core principles include:

* Star schema design
* Fact and dimension separation
* Surrogate keys
* Business-oriented modeling

The goal is to create a reporting layer that is intuitive and efficient.

---

# Star Schema

The MART layer follows a star schema design.

```text id="9a0b9t"
                     DIM_DATE
                         |
                         |
DIM_CUSTOMERS ---- FACT_ORDERS ---- DIM_PRODUCTS
                         |
                         |
                    DIM_PAYMENTS
```

The fact table sits at the center and is surrounded by descriptive dimensions.

---

# Fact Table

## FACT_ORDERS

The fact table stores measurable business events.

In this project, each record represents an order transaction associated with a customer, product, payment type, and purchase date.

### Measures

* Payment Value
* Product Price
* Freight Value

### Foreign Keys

* CUSTOMER_KEY
* PRODUCT_KEY
* DATE_KEY
* PAYMENT_KEY

### Purpose

Provides the foundation for:

* Revenue analysis
* Sales trends
* Product performance
* Customer behavior analysis

---

# Dimension Tables

Dimension tables provide business context for facts.

---

## DIM_CUSTOMERS

Stores customer-related attributes.

Examples:

* Customer ID
* Customer City
* Customer State

Business Use Cases:

* Customer segmentation
* Regional analysis
* Customer behavior reporting

---

## DIM_PRODUCTS

Stores product information.

Examples:

* Product ID
* Product Category
* Product Weight

Business Use Cases:

* Product performance
* Category analysis
* Inventory reporting

---

## DIM_DATE

Stores calendar attributes.

Examples:

* Date
* Day
* Month
* Quarter
* Year

Business Use Cases:

* Time-series analysis
* Monthly reporting
* Trend analysis

---

## DIM_PAYMENTS

Stores payment-related attributes.

Examples:

* Payment Type

Business Use Cases:

* Payment method analysis
* Customer payment behavior

---

# Surrogate Keys

The project uses surrogate keys instead of relying solely on business keys.

Examples:

```text id="vg4nkl"
CUSTOMER_KEY
PRODUCT_KEY
DATE_KEY
PAYMENT_KEY
```

Benefits include:

* Improved join performance
* Stable identifiers
* Support for future Slowly Changing Dimensions
* Reduced dependency on source systems

---

# Grain Definition

One of the most important aspects of dimensional modeling is defining grain.

## FACT_ORDERS Grain

One record per order transaction.

The grain determines how metrics are calculated and how data is aggregated.

Clearly defining grain helps avoid reporting inconsistencies.

---

# Business Metrics Supported

The dimensional model supports:

* Total Revenue
* Order Count
* Average Order Value
* Top Products
* Customer Counts
* Monthly Revenue Trends

These metrics will be consumed by Power BI dashboards in later phases.

---

# Design Decisions

Several design decisions were made to keep the model simple while remaining production-oriented.

### Star Schema

Chosen for simplicity and performance.

### Physical Tables

Used instead of views to support future incremental processing.

### Surrogate Keys

Implemented to improve scalability and support future enhancements.

### Dedicated MART Layer

Separates analytics workloads from ingestion and transformation workloads.

---

# Future Enhancements

Future versions of the model may include:

* Slowly Changing Dimensions (Type 2)
* Customer Lifetime Value calculations
* Product Hierarchies
* Factless Fact Tables
* Aggregate Tables
* Dynamic Tables

These enhancements would further improve analytical capabilities.

---

# Summary

The dimensional model provides an analytics-ready structure that supports reporting, dashboarding, and business intelligence use cases.

By separating facts from dimensions and implementing a star schema design, the project follows industry-standard data warehousing practices commonly used in enterprise analytics platforms.
