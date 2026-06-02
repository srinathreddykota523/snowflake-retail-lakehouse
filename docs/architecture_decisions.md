# Architecture Decisions

## Overview

This document captures the major architectural decisions made during the development of the Retail Lakehouse Analytics Platform.

The purpose of this document is to explain not only what was implemented, but also why specific technologies, patterns, and design approaches were chosen.

Documenting architectural decisions improves maintainability, knowledge sharing, and project governance.

---

# Decision 1

## Azure Blob Storage Instead of Snowflake Internal Stage

### Decision

Azure Blob Storage was selected as the primary landing zone for source datasets.

---

### Alternatives Considered

* Snowflake Internal Stage
* Azure Blob Storage

---

### Selected Option

Azure Blob Storage

---

### Rationale

The project already had access to an Azure subscription.

Using Azure Blob Storage more closely reflects real-world enterprise architectures where cloud object storage acts as the system of record for raw data.

Benefits include:

* Cloud-native design
* Better scalability
* Lower storage costs
* Integration with Azure services
* Separation of storage and compute

---

### Impact

Positive:

* More realistic architecture
* Better interview value
* Easier future integration with Azure services

Negative:

* Additional configuration complexity

---

# Decision 2

## Snowpipe Instead of Manual COPY INTO

### Decision

Snowpipe was selected as the long-term ingestion mechanism.

---

### Alternatives Considered

* Manual COPY INTO
* Snowpipe

---

### Selected Option

Snowpipe

---

### Rationale

Snowpipe enables automated ingestion and reduces operational overhead.

Benefits include:

* Event-driven ingestion
* Reduced manual intervention
* Improved scalability
* Modern cloud architecture

Manual COPY INTO was used initially during development for validation and testing.

---

### Impact

Positive:

* Supports automation
* Reduces operational effort
* Production-ready design

---

# Decision 3

## Layered Data Architecture

### Decision

The warehouse was divided into multiple logical layers.

---

### Architecture

```text
RAW
  |
TRANSFORM
  |
MART
```

---

### Alternatives Considered

Single-layer warehouse design.

---

### Selected Option

Multi-layer architecture.

---

### Rationale

Separating ingestion, transformation, and reporting improves maintainability and governance.

Benefits include:

* Clear separation of concerns
* Easier debugging
* Better scalability
* Improved data lineage

---

# Decision 4

## Star Schema Instead of Normalized Reporting Tables

### Decision

A dimensional model was implemented using a star schema.

---

### Alternatives Considered

* Fully normalized reporting model
* Star schema

---

### Selected Option

Star schema

---

### Rationale

Star schemas are optimized for analytical workloads.

Benefits include:

* Simpler queries
* Faster reporting
* Better Power BI performance
* Easier business adoption

---

### Impact

Positive:

* Improved reporting performance
* Simplified analytics

---

# Decision 5

## Surrogate Keys in Dimensions

### Decision

Dimension tables use surrogate keys.

---

### Examples

```text
CUSTOMER_KEY
PRODUCT_KEY
DATE_KEY
PAYMENT_KEY
```

---

### Alternatives Considered

Natural business keys only.

---

### Selected Option

Surrogate keys.

---

### Rationale

Benefits include:

* Stable identifiers
* Better join performance
* Future support for Slowly Changing Dimensions
* Reduced dependency on source systems

---

# Decision 6

## Dedicated Warehouses by Workload

### Decision

Separate Snowflake warehouses were created.

---

### Warehouses

```text
INGEST_WH
TRANSFORM_WH
ANALYTICS_WH
```

---

### Alternatives Considered

Single shared warehouse.

---

### Selected Option

Workload isolation.

---

### Rationale

Benefits include:

* Improved performance
* Reduced resource contention
* Better cost visibility
* Easier troubleshooting

---

# Decision 7

## Managed Identity Instead of Storage Keys

### Decision

Snowflake Storage Integration with Azure Managed Identity was selected.

---

### Alternatives Considered

* Storage Account Keys
* SAS Tokens
* Managed Identity

---

### Selected Option

Managed Identity

---

### Rationale

Benefits include:

* Improved security
* No embedded credentials
* Reduced secret management
* Enterprise best practice

---

### Impact

Positive:

* Stronger security posture
* Easier credential governance

---

# Decision 8

## Environment Variables for Secrets

### Decision

Secrets are stored outside the repository.

---

### Files

```text
.env
.env.example
```

---

### Rationale

Benefits include:

* Secure development
* Prevent accidental credential exposure
* Support multiple environments

---

### Security Policy

Never commit:

* Passwords
* Storage Keys
* SAS Tokens
* Client Secrets
* Connection Strings

---

# Decision 9

## Documentation-First Development

### Decision

Major project phases include technical documentation.

---

### Documents

Examples:

* Project Overview
* Snowflake Setup
* Data Model
* Azure Setup
* Transformation Layer
* MART Layer

---

### Rationale

Benefits include:

* Better maintainability
* Improved onboarding
* Demonstrates engineering discipline
* Stronger portfolio presentation

---

# Future Decisions

The following architectural decisions will be evaluated in future phases:

* Streams vs Dynamic Tables
* dbt vs Native SQL Transformations
* Azure Data Factory Integration
* Azure Key Vault Integration
* GitHub Actions CI/CD Design
* Power BI Deployment Architecture

---

# Summary

The architecture prioritizes:

* Simplicity
* Scalability
* Security
* Maintainability
* Cloud-native design

The selected technologies and patterns align with common enterprise data engineering practices and provide a strong foundation for future enhancements.
