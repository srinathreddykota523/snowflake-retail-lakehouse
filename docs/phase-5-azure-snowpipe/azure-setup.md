# Azure Setup

## Overview

This project uses Microsoft Azure Blob Storage as the cloud landing zone for source retail datasets.

Azure Blob Storage serves as the source layer for Snowflake ingestion and provides scalable, secure, and cost-effective storage.

---

# Azure Resources

## Subscription

Personal Azure Subscription

---

## Storage Account

```text
retaillakehouse523
```

Purpose:

* Centralized cloud storage
* Landing zone for source files
* Integration point with Snowflake

---

## Container

```text
retail-data
```

Purpose:

Stores all source datasets used within the project.

---

# Container Structure

```text
retail-data/

├── customers/
│   └── customers.csv

├── orders/
│   └── orders.csv

├── products/
│   └── products.csv

├── order_items/
│   └── order_items.csv

└── payments/
    └── payments.csv
```

---

# Security Architecture

The project follows a credential-free integration model.

Snowflake accesses Azure using a Storage Integration and Azure-managed identity.

No storage keys or SAS tokens are embedded in SQL scripts.

Benefits:

* Improved security
* Reduced secret management
* Production-grade architecture

---

# Access Control

The Snowflake managed identity was assigned:

Storage Blob Data Reader

This allows Snowflake to read data from Azure Blob Storage while maintaining least-privilege access.

---

# Benefits of Azure Blob Storage

* Highly scalable
* Cost-effective
* Cloud-native integration
* Secure access control
* Supports future automation with Event Grid

---

# Future Enhancements

Planned Azure improvements:

* Azure Event Grid
* Azure Key Vault
* Azure Data Factory
* Power BI Service Deployment
* Automated CI/CD integration

These enhancements will further align the project with enterprise data platform architectures.
