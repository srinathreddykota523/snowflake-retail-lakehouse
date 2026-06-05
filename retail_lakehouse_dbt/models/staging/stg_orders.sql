select

    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_customer_date

from {{ source('raw','RAW_ORDERS') }}

where order_id is not null