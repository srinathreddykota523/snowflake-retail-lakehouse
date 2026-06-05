# dbt Integration

## Overview

The project integrates dbt (Data Build Tool) to manage transformations using modern analytics engineering practices.

dbt introduces:

* Modular SQL development
* Dependency management
* Automated testing
* Documentation generation
* Data lineage tracking

---

# Architecture

RAW
|
v
dbt Staging Models
|
v
dbt Mart Models
|
v
Power BI

---

# Benefits

* Reusable SQL
* Version-controlled transformations
* Automated testing
* Improved maintainability

---

# Model Layers

## Staging

Raw data standardization.

Examples:

* stg_customers
* stg_orders
* stg_products

---

## Marts

Business-ready analytical models.

Examples:

* dim_customers
* dim_products
* fact_orders

---

# Testing

Implemented tests include:

* not_null
* unique

Future enhancements may include:

* accepted_values
* relationships
* custom tests

---

# Documentation

dbt automatically generates:

* Model lineage
* Dependency graphs
* Column documentation

This improves platform transparency and maintainability.

---

# Business Value

dbt standardizes transformation development and aligns the project with modern analytics engineering best practices.
