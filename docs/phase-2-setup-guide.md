# Development Setup Guide

## Purpose

This document describes the local development environment, tools, and workflow used for the Retail Lakehouse Analytics Platform.

The objective is to establish a consistent development process that follows industry best practices for Snowflake projects.

---

# Development Environment

The project uses the following tools.

| Tool               | Purpose                     |
| ------------------ | --------------------------- |
| Visual Studio Code | Development Environment     |
| Snowflake          | Cloud Data Platform         |
| Git                | Version Control             |
| GitHub             | Repository Hosting          |
| Python             | Utility Scripts             |
| dbt                | Analytics Engineering       |
| Power BI           | Reporting and Visualization |

---

# Local Project Setup

## Clone Repository

```bash
git clone https://github.com/<your-username>/snowflake-retail-lakehouse.git

cd snowflake-retail-lakehouse
```

---

## Create Python Virtual Environment

### Windows

```bash
python -m venv venv

venv\Scripts\activate
```

### Linux / Mac

```bash
python -m venv venv

source venv/bin/activate
```

---

## Install Dependencies

```bash
pip install -r requirements.txt
```

Verify installation:

```bash
pip list
```

---

# Visual Studio Code Setup

## Required Extensions

Install the following extensions.

### Snowflake Extension

Official Snowflake extension for SQL development.

Features:

* Run SQL directly from VS Code
* Connect to Snowflake
* Execute scripts
* View query results

---

### GitHub Pull Requests and Issues

Provides GitHub integration.

Features:

* View commits
* Manage pull requests
* Track changes

---

### SQLTools

Improves SQL editing experience.

Features:

* SQL formatting
* Syntax highlighting
* Query assistance

---

### Python

Official Python extension.

Features:

* Python execution
* Linting
* Debugging

---

# Snowflake Connection Setup

## Create Connection

Open VS Code.

Press:

```text
Ctrl + Shift + P
```

Search:

```text
Snowflake: Add Connection
```

---

## Connection Details

Enter:

```text
Account Identifier
Username
Password
Role
Warehouse
Database
Schema
```

Example:

```text
Role:
ACCOUNTADMIN

Warehouse:
INGEST_WH

Database:
RETAIL_LAKEHOUSE

Schema:
RAW
```

---

# Verify Connection

Create a temporary SQL file.

Example:

```sql
SELECT CURRENT_USER();

SELECT CURRENT_ROLE();

SELECT CURRENT_DATABASE();
```

Execute using the Snowflake extension.

Expected result:

* User name returned
* Active role returned
* Active database returned

---

# Project Development Workflow

The project follows a simple workflow.

```text
Write SQL
      |
      v
Run SQL from VS Code
      |
      v
Validate Results
      |
      v
Commit Changes
      |
      v
Push to GitHub
```

---

# Git Workflow

All development changes should be committed regularly.

Small commits are preferred over large commits.

---

## Check Status

```bash
git status
```

---

## Stage Changes

```bash
git add .
```

---

## Commit Changes

```bash
git commit -m "Meaningful commit message"
```

Examples:

```bash
git commit -m "Create Snowflake database setup script"

git commit -m "Implement role-based access control"

git commit -m "Add retail star schema"
```

---

## Push Changes

```bash
git push
```

---

# Branching Strategy

For this project, development will be performed directly on:

```text
main
```

Reason:

* Single developer project
* Portfolio repository
* Simplified workflow

In enterprise environments, feature branches would typically be used.

---

# SQL Development Standards

The project follows consistent SQL formatting.

---

## Naming Convention

### Databases

```text
RETAIL_LAKEHOUSE
```

### Schemas

```text
RAW
TRANSFORM
MART
ADMIN
```

### Warehouses

```text
INGEST_WH
TRANSFORM_WH
ANALYTICS_WH
```

### Tables

```text
FACT_ORDERS
DIM_CUSTOMERS
DIM_PRODUCTS
```

---

# Documentation Standards

Every major phase should include documentation.

Current documentation structure:

```text
docs/
├── project_overview.md
├── snowflake_setup.md
├── setup_guide.md
```

Additional documentation will be added as the project evolves.

---

# Security Best Practices

Never commit:

```text
Passwords
Secrets
Private Keys
Tokens
Credentials
```

Store sensitive values in:

```text
.env
```

The .env file is excluded by Git.

---

# Project Structure

```text
snowflake-retail-lakehouse/
│
├── datasets/
├── sql/
├── dbt/
├── python/
├── dashboards/
├── docs/
└── .github/
```

Each folder serves a dedicated purpose and follows a modular architecture.

---

# Validation Checklist

Before committing code:

* SQL executed successfully
* Objects created successfully
* Documentation updated
* Git status reviewed
* No credentials committed

---

# Development Philosophy

The project is designed to demonstrate:

* Snowflake engineering skills
* Data warehousing concepts
* Analytics engineering practices
* Git discipline
* Documentation quality
* Production-ready project organization

The goal is not only to build a working solution, but also to showcase engineering best practices that are commonly expected in professional data engineering environments.
