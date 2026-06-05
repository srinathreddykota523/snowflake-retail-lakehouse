select

    order_id,
    payment_type,
    payment_installments,
    payment_value

from {{ source('raw','RAW_PAYMENTS') }}

where payment_value > 0