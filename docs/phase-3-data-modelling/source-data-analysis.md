# Source Data Analysis

## Source System

Retail transactional data exported as CSV files.

---

# Source Tables

## Customers

Contains customer attributes.

Primary Key:

customer_id

---

## Orders

Contains order-level information.

Primary Key:

order_id

Foreign Key:

customer_id

---

## Products

Contains product attributes.

Primary Key:

product_id

---

## Order Items

Contains line-item sales transactions.

Primary Key:

order_item_id

Foreign Keys:

order_id
product_id

---

## Payments

Contains payment details.

Primary Key:

payment_id

Foreign Key:

order_id

---

# Data Quality Considerations

Potential issues:

* Missing customer records
* Duplicate orders
* Null product categories
* Invalid payment values

These issues will be addressed during transformation.
