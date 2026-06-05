select

    dc.customer_key,

    dp.product_key,

    dd.date_key,

    dpay.payment_key,

    oi.order_id,

    oi.order_item_id,

    oi.price,

    oi.freight_value,

    p.payment_value

from {{ ref('stg_order_items') }} oi

join {{ ref('stg_orders') }} o
    on oi.order_id = o.order_id

join {{ ref('dim_customers') }} dc
    on o.customer_id = dc.customer_id

join {{ ref('dim_products') }} dp
    on oi.product_id = dp.product_id

join {{ ref('stg_payments') }} p
    on oi.order_id = p.order_id

join {{ ref('dim_payments') }} dpay
    on p.payment_type = dpay.payment_type

join {{ ref('dim_date') }} dd
    on cast(o.order_purchase_timestamp as date)
        = dd.date_day