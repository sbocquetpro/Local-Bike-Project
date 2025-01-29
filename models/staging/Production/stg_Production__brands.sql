SELECT 
    brand_id,
    brand_name
FROM {{source('Production','brands')}}