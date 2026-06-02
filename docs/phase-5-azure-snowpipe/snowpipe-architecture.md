# Snowpipe Architecture

## Overview

Snowpipe is Snowflake's continuous data ingestion service.

It enables automated loading of files from cloud storage into Snowflake tables.

Within this project, Snowpipe is used to automate ingestion from Azure Blob Storage into the RAW layer.

---

# Architecture

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

---

# Components

## Azure Blob Storage

Stores source retail datasets.

---

## Storage Integration

Provides secure authentication between Snowflake and Azure.

Benefits:

* No embedded credentials
* Managed identity authentication
* Least privilege access

---

## External Stage

Represents Azure Blob Storage within Snowflake.

Purpose:

* File discovery
* Data access
* Loading source files

---

## Snowpipe

Automates ingestion into RAW tables.

Pipes created:

* CUSTOMERS_PIPE
* ORDERS_PIPE
* PRODUCTS_PIPE
* ORDER_ITEMS_PIPE
* PAYMENTS_PIPE

---

# Monitoring

Snowpipe status can be monitored using:

```sql
SHOW PIPES;
```

and

```sql
SELECT SYSTEM$PIPE_STATUS('<PIPE_NAME>');
```

Monitoring helps detect:

* Failed loads
* Delayed ingestion
* Configuration issues

---

# Benefits

Snowpipe provides:

* Automated ingestion
* Reduced manual effort
* Scalable processing
* Simplified operations

---

# Cost Considerations

Snowpipe is serverless.

Charges are incurred only when files are processed.

Benefits:

* No dedicated warehouse required
* Pay-per-use model
* Operational efficiency

---

# Future Enhancements

Future versions of this project will include:

* Azure Event Grid Integration
* Event-Driven Auto Ingestion
* Real-Time Data Loading
* Advanced Monitoring Dashboards

These enhancements will further improve automation and reduce operational overhead.
