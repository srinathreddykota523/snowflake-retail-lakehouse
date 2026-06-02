# Streams and Tasks

## Overview

Streams and Tasks provide Snowflake-native automation capabilities.

Together they enable Change Data Capture (CDC) and scheduled processing without external orchestration tools.

---

# Architecture

Azure Blob Storage
|
v
Snowpipe
|
v
RAW
|
v
Streams
|
v
Tasks
|
v
TRANSFORM

---

# Streams

Streams track changes occurring in source tables.

Tracked changes include:

* Inserts
* Updates
* Deletes

Benefits:

* Incremental processing
* Reduced compute costs
* Faster transformations

---

# Tasks

Tasks automate SQL execution.

Benefits:

* Native scheduling
* Reduced operational overhead
* Simplified orchestration

---

# Implemented Streams

* CUSTOMER_STREAM
* ORDER_STREAM
* PRODUCT_STREAM
* PAYMENT_STREAM
* ORDER_ITEM_STREAM

---

# Implemented Tasks

* CUSTOMER_TRANSFORM_TASK
* ORDER_TRANSFORM_TASK
* PRODUCT_TRANSFORM_TASK
* PAYMENT_TRANSFORM_TASK
* ORDER_ITEM_TRANSFORM_TASK

---

# Benefits

* Automated transformations
* CDC support
* Reduced processing costs
* Scalable architecture
