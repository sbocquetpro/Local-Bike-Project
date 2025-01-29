SELECT 
    product_id,
    product_name,
    brand_id,
    category_id,
    model_year,
    list_price AS product_price
FROM {{source('Production','products')}}