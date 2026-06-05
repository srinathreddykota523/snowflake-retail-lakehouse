select

    customer_id,
    customer_unique_id,

    upper(trim(customer_city))
        as customer_city,

    upper(trim(customer_state))
        as customer_state

from {{ source('raw','RAW_CUSTOMERS') }}

where customer_id is not null