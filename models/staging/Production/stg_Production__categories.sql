SELECT 
    category_id,
    category_name
FROM {{source('Production','categories')}}