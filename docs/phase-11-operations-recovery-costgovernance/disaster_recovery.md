# Disaster Recovery

## Overview

The platform uses Snowflake-native recovery features.

Implemented capabilities include:

* Time Travel
* Zero Copy Cloning

---

# Time Travel

Provides access to historical table states.

Benefits:

* Recover accidental deletes
* Recover accidental updates
* Audit historical data

---

# Zero Copy Cloning

Creates instant copies of databases and schemas.

Benefits:

* Development environments
* Testing environments
* Recovery scenarios

---

# Recovery Strategy

Production
|
v
Clone
|
v
Development / Testing

This minimizes risk while supporting rapid development.
