WITH customer_sales AS (
    SELECT 
        ss.store_id,
        ss.store_name,
        ss.customer_id,
        c.first_name,
        c.last_name,
        c.email,
        c.city,
        c.state,
        c.zip_code,
        ss.product_id,
        ss.product_name,
        ss.category_name,
        ss.item_quantity,
        ss.item_price,
        ss.discount,
        ss.total_sales,
        ss.ordered_at
    FROM {{ ref('int_store_sales') }} ss
    JOIN {{ ref('stg_Sales__customers') }} c ON ss.customer_id = c.customer_id
)

SELECT * FROM customer_sales
