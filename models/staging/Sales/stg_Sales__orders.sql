SELECT 
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date AS ordered_at,
    required_date AS required_at,
    CASE 
        WHEN shipped_date = 'NULL' THEN NULL
        ELSE CAST(shipped_date AS DATE)
    END AS shipped_at,
    TIMESTAMP_DIFF(
        CASE 
            WHEN shipped_date = 'NULL' THEN NULL
            ELSE CAST(shipped_date AS DATE)
        END, 
        order_date, 
        DAY
    ) AS processing_time
FROM {{source('Sales','orders')}}