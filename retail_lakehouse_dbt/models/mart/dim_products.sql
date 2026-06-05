select

    row_number() over(
        order by product_id
    ) as product_key,

    product_id,
    product_category_name,
    product_weight_g

from {{ ref('stg_products') }}