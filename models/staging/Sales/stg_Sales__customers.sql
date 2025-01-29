select
    customer_id,
    first_name,
    last_name,
    COALESCE(NULLIF(phone, 'NULL'), 'Unknown') AS phone_number,
    email,
    street AS street_adress,
    city,
    state,
    zip_code
FROM {{source('Sales','customers')}}