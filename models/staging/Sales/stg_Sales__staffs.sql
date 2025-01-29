SELECT 
    staff_id,
    first_name,
    last_name,
    email,
    phone AS phone_number,
    store_id,
    COALESCE(NULLIF(manager_id, 'NULL'), 'Unknown') AS manager_id
FROM {{ source('Sales', 'staffs') }}