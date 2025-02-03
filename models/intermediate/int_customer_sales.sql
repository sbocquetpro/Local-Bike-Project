WITH customer_sales AS (
    SELECT 
        iss.store_id,
        iss.store_name,
        iss.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.city,
        c.state,
        c.zip_code,
        iss.product_id,
        iss.product_name,
        iss.category_name,
        iss.item_quantity,
        iss.item_price,
        iss.discount,
        iss.total_sales,
        iss.ordered_at
    FROM {{ ref('int_store_sales') }} iss
    JOIN {{ ref('stg_Sales__customers') }} c ON iss.customer_id = c.customer_id
)

SELECT * FROM customer_sales
