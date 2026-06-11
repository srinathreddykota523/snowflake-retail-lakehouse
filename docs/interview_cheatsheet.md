# Snowflake Interview Cheatsheet

# Retail Lakehouse Analytics Platform

---

# 1. Tell me about your Snowflake project.

I built an end-to-end Retail Lakehouse Analytics Platform using Azure Blob Storage, Snowflake, dbt, Python, Power BI, and GitHub Actions.

Architecture:

Azure Blob Storage → Snowpipe → RAW → TRANSFORM → MART → Power BI

The platform includes:

- Storage Integrations
- External Stages
- Snowpipe
- Streams & Tasks
- Dynamic Tables
- Star Schema
- dbt
- Security Governance
- CI/CD

---

# 2. Why Snowflake?

Benefits:

- Separation of Compute and Storage
- Auto Scaling
- Auto Suspend / Resume
- Time Travel
- Zero Copy Cloning
- Secure Data Sharing
- Minimal Infrastructure Management

---

# 3. What are Virtual Warehouses?

Virtual Warehouses are independent compute clusters used to process queries.

In my project:

- INGEST_WH
- TRANSFORM_WH
- ANALYTICS_WH
- DYNAMIC_WH

Benefits:

- Workload isolation
- Independent scaling
- Cost control

---

# 4. What is Snowpipe?

Snowpipe is Snowflake's serverless continuous ingestion service.

Purpose:

Automatically loads files from cloud storage into Snowflake tables.

Benefits:

- Automated ingestion
- Near real-time loading
- No dedicated warehouse required

---

# 5. What is a Storage Integration?

A Storage Integration securely connects Snowflake to cloud storage.

In my project:

Snowflake ↔ Azure Blob Storage

using Azure Managed Identity.

Benefits:

- No storage keys
- No SAS tokens
- Better security

---

# 6. What is an External Stage?

An External Stage is a Snowflake object that references files stored in cloud storage.

Example:

Azure Blob Storage → External Stage → Snowflake

Purpose:

- File discovery
- File access
- Data ingestion

---

# 7. What are Streams?

Streams provide Change Data Capture (CDC).

They track:

- Inserts
- Updates
- Deletes

I used Streams on RAW tables to capture incoming changes.

---

# 8. What are Tasks?

Tasks are Snowflake's scheduling mechanism.

I used Tasks to:

- Execute MERGE statements
- Automate transformations
- Process Stream changes

Example:

Customer Stream → Task → Customers Table

---

# 9. What are Dynamic Tables?

Dynamic Tables automatically maintain transformed datasets.

Instead of:

Streams + Tasks + MERGE

you define:

```sql
CREATE DYNAMIC TABLE ...
```

Benefits:

- Less maintenance
- Automatic refresh
- Simplified architecture

---

# 10. Streams & Tasks vs Dynamic Tables?

Streams & Tasks:

Pros:

- More control
- Complex orchestration

Cons:

- More maintenance

Dynamic Tables:

Pros:

- Simpler
- Declarative

Cons:

- Less granular control

---

# 11. What is Time Travel?

Time Travel allows querying historical versions of data.

Use Cases:

- Recover accidental deletes
- Audit historical data
- Restore previous states

Example:

```sql
SELECT *
FROM DIM_CUSTOMERS
AT (OFFSET => -3600);
```

---

# 12. What is Zero Copy Cloning?

Creates instant copies of databases, schemas, or tables.

Benefits:

- No data duplication
- Fast environment creation
- Development sandboxes

Use Cases:

- Testing
- Development
- Recovery

---

# 13. Explain Snowflake Architecture.

Snowflake has three layers:

1. Database Storage Layer
2. Compute Layer (Warehouses)
3. Cloud Services Layer

Benefits:

- Independent scaling
- Better performance
- Reduced contention

---

# 14. Why use a Star Schema?

Star Schema improves analytics performance.

Structure:

```text
DIMENSIONS
     |
     |
FACT TABLE
```

Benefits:

- Faster reporting
- Simpler queries
- Better Power BI performance

---

# 15. Difference Between Fact and Dimension Tables?

Fact Table:

Stores measurable business events.

Examples:

- Revenue
- Quantity
- Price

Dimension Table:

Stores descriptive attributes.

Examples:

- Customer
- Product
- Date

---

# 16. What is the grain of your Fact Table?

FACT_ORDERS grain:

One record per order transaction.

Grain determines:

- Aggregation behavior
- Metric calculations
- Reporting consistency

---

# 17. Why Surrogate Keys?

Examples:

- CUSTOMER_KEY
- PRODUCT_KEY

Benefits:

- Better performance
- Stable identifiers
- Support SCDs

---

# 18. What is RBAC?

Role-Based Access Control.

Implemented Roles:

- DATA_ENGINEER_ROLE
- BI_ANALYST_ROLE
- AUDITOR_ROLE

Benefits:

- Least privilege access
- Improved governance
- Better security

---

# 19. What are Secure Views?

Secure Views hide underlying table implementation.

Benefits:

- Data protection
- Secure sharing
- Governance

---

# 20. What are Masking Policies?

Masking Policies dynamically hide sensitive data.

Example:

Data Engineer:

```text
ABC12345
```

Analyst:

```text
********
```

---

# 21. What are Row Access Policies?

Row Access Policies restrict access to specific rows.

Example:

Analysts can only see:

```text
STATE = 'SP'
```

while engineers can see all states.

---

# 22. What is dbt?

dbt (Data Build Tool) is a transformation framework.

Benefits:

- Modular SQL
- Testing
- Documentation
- Lineage Tracking

---

# 23. Why did you use dbt?

To implement:

```text
RAW
 ↓
STAGING
 ↓
MARTS
```

Benefits:

- Cleaner transformations
- Automated testing
- Better maintainability

---

# 24. What dbt Tests Did You Use?

Implemented:

- unique
- not_null

Future:

- relationships
- accepted_values

---

# 25. Why Power BI?

Power BI provides:

- Business dashboards
- Executive reporting
- Interactive analytics

Dashboard Pages:

- Executive Summary
- Customer Analytics
- Product Analytics
- Operational Analytics

---

# 26. Why Python?

Python is used for:

- Data Quality Checks
- Health Monitoring
- Metadata Reporting
- Azure Validation

Transformations remain in Snowflake.

---

# 27. How Did You Control Costs?

Implemented:

- Auto Suspend
- Auto Resume
- Dedicated Warehouses
- Incremental Processing
- Snowpipe
- Dynamic Tables

Monitoring:

- Resource Monitors
- Query History

---

# 28. Explain Your CI/CD Setup.

GitHub Actions workflows:

- Python Validation
- dbt Validation
- Repository Validation

Benefits:

- Continuous testing
- Early issue detection
- Improved quality

---

# 29. What Would You Improve Next?

Future Roadmap:

- Snowpark Python
- Snowpipe Streaming
- Azure Key Vault
- Terraform
- Azure Data Factory
- Real-Time Event Processing

---

# 30. What Makes This Project Production-Like?

Features include:

- Azure Cloud Integration
- Storage Integrations
- Snowpipe
- CDC Processing
- Dynamic Tables
- Star Schema
- dbt
- Power BI
- Security Controls
- Governance
- Cost Optimization
- CI/CD

This simulates a real-world cloud analytics platform rather than a simple data warehouse demo.