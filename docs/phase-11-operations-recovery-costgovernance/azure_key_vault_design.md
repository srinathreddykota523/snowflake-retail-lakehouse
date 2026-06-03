# Azure Key Vault Design

## Overview

Azure Key Vault is Microsoft's cloud service for securely storing secrets, keys, and certificates.

Future versions of this platform may integrate Azure Key Vault for centralized secret management.

---

# Objectives

* Eliminate hardcoded credentials
* Centralize secret storage
* Improve security posture
* Support CI/CD pipelines

---

# Potential Secrets

Examples include:

* Snowflake passwords
* Service principals
* API keys
* Application secrets

---

# Proposed Architecture

GitHub Actions
|
v
Azure Key Vault
|
v
Snowflake Deployment

---

# Benefits

* Enhanced security
* Improved governance
* Centralized secret management
* Enterprise readiness

---

# Current Implementation

Current project secrets are managed using:

.env
.env.example

No secrets are committed to Git.
