SELECT
    store_id,
    store_name,
    phone AS phone_number,
    email,
    street AS street_address,
    city,
    state,
    zip_code
FROM {{ source('Sales', 'stores') }}