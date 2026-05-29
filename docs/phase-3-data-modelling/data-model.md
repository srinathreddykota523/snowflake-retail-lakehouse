# Data Model

## Modeling Approach

The project follows a dimensional modeling approach using a star schema.

This design is optimized for analytical workloads and dashboard reporting.

---

# Star Schema

```text
                     DIM_DATE
                         |
                         |
DIM_CUSTOMERS ---- FACT_ORDERS ---- DIM_PRODUCTS
                         |
                         |
                    DIM_PAYMENTS
```

---

# Fact Table

## FACT_ORDERS

Stores transactional sales data.

Grain:

One record per order item.

Measures:

* Sales Amount
* Quantity
* Freight Cost

Foreign Keys:

* customer_key
* product_key
* payment_key
* date_key

---

# Dimension Tables

## DIM_CUSTOMERS

Customer attributes.

Examples:

* Customer ID
* City
* State

---

## DIM_PRODUCTS

Product attributes.

Examples:

* Product Name
* Category

---

## DIM_PAYMENTS

Payment attributes.

Examples:

* Payment Type
* Installments

---

## DIM_DATE

Calendar dimension.

Examples:

* Day
* Month
* Quarter
* Year
