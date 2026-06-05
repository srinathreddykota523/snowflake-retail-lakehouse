select distinct

    row_number() over(
        order by payment_type
    ) as payment_key,

    payment_type

from {{ ref('stg_payments') }}