WITH store_sales AS (
    SELECT 
        o.store_id,
        s.store_name,
        o.customer_id,
        oi.product_id,
        p.product_name,
        c.category_name,
        oi.item_quantity,
        oi.item_price,
        oi.discount,
        ROUND(oi.item_price * oi.item_quantity *(1 - oi.discount),2) AS total_sales,
        o.ordered_at
    FROM {{ ref('stg_Sales__orders') }} o
    JOIN {{ ref('stg_Sales__order_items') }} oi ON o.order_id = oi.order_id
    JOIN {{ ref('stg_Sales__stores') }} s ON o.store_id = s.store_id
    JOIN {{ ref('stg_Production__products') }} p ON oi.product_id = p.product_id
    JOIN {{ ref('stg_Production__categories') }} c ON p.category_id = c.category_id
)

SELECT * FROM store_sales