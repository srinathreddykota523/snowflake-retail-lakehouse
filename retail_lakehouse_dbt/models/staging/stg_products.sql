select

    product_id,

    coalesce(
        product_category_name,
        'UNKNOWN'
    ) as product_category_name,

    product_weight_g

from {{ source('raw','RAW_PRODUCTS') }}

where product_id is not null