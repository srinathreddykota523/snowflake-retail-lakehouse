CREATE OR REPLACE TABLE RAW_CUSTOMERS (
    customer_id STRING,
    customer_unique_id STRING,
    customer_zip_code_prefix STRING,
    customer_city STRING,
    customer_state STRING
);

CREATE OR REPLACE TABLE RAW_ORDERS (
    order_id STRING,
    customer_id STRING,
    order_status STRING,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE OR REPLACE TABLE RAW_PRODUCTS (
    product_id STRING,
    product_category_name STRING,
    product_name_lenght NUMBER,
    product_description_lenght NUMBER,
    product_photos_qty NUMBER,
    product_weight_g NUMBER,
    product_length_cm NUMBER,
    product_height_cm NUMBER,
    product_width_cm NUMBER
);

CREATE OR REPLACE TABLE RAW_ORDER_ITEMS (
    order_id STRING,
    order_item_id NUMBER,
    product_id STRING,
    seller_id STRING,
    shipping_limit_date TIMESTAMP,
    price NUMBER(10,2),
    freight_value NUMBER(10,2)
);

CREATE OR REPLACE TABLE RAW_PAYMENTS (
    order_id STRING,
    payment_sequential NUMBER,
    payment_type STRING,
    payment_installments NUMBER,
    payment_value NUMBER(10,2)
);

SHOW TABLES IN SCHEMA RAW;