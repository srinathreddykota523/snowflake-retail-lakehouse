# Streams and Tasks vs Dynamic Tables

## Overview

Snowflake provides multiple approaches for incremental data processing.

This project demonstrates both approaches.

---

# Streams and Tasks

Architecture:

RAW
|
v
Stream
|
v
Task
|
v
MERGE
|
v
Target Table

Benefits:

* Fine-grained control
* Complex orchestration
* Mature pattern

Challenges:

* More maintenance
* More SQL code
* Scheduling management

---

# Dynamic Tables

Architecture:

RAW
|
v
Dynamic Table
|
v
Target Table

Benefits:

* Declarative design
* Reduced maintenance
* Automatic refreshes
* Simpler implementation

Challenges:

* Less control
* Newer feature set

---

# When to Use Streams and Tasks

Recommended when:

* Complex orchestration is required
* Custom logic is needed
* Multi-step workflows exist

---

# When to Use Dynamic Tables

Recommended when:

* Data transformations are straightforward
* Low operational overhead is desired
* Rapid development is important

---

# Project Decision

The project implements both patterns to demonstrate Snowflake platform capabilities.

Streams and Tasks provide enterprise-grade orchestration.

Dynamic Tables demonstrate modern Snowflake-native pipeline development.
