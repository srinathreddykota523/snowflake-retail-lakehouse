# Data Access Model

## Overview

The project follows a role-based access control model.

---

# Access Architecture

DATA_ENGINEER_ROLE
|
RAW
TRANSFORM
MART

BI_ANALYST_ROLE
|
MART

AUDITOR_ROLE
|
SECURE VIEWS

---

# Principle of Least Privilege

Users receive only the permissions required to perform their duties.

---

# Security Layers

1. Role-Based Access
2. Secure Views
3. Masking Policies
4. Row Access Policies

---

# Business Benefits

* Improved governance
* Reduced exposure
* Regulatory support
* Controlled analytics access
