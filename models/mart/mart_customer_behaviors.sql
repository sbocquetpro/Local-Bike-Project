WITH customer_aggregates AS (
    SELECT 
        ics.customer_id,
        CONCAT(ics.first_name, ' ', ics.last_name) AS customer_name,
        ics.email,
        ics.city,
        ics.state,
        ics.zip_code,
        COUNT(DISTINCT ics.ordered_at) AS total_orders, 
        SUM(ics.total_sales) AS total_revenue, 
        MAX(ics.ordered_at) AS last_order_date, 
        RANK() OVER (
            PARTITION BY ics.customer_id 
            ORDER BY SUM(ics.item_quantity) DESC, 
                     SUM(ics.total_sales) DESC
        ) AS product_rank,
        ics.product_id AS favorite_product_id,
        ics.product_name AS favorite_product_name
    FROM {{ ref('int_customer_sales') }} ics
    GROUP BY ics.customer_id, ics.first_name, ics.last_name, ics.email, ics.city, ics.state, ics.zip_code, ics.product_id, ics.product_name
)

SELECT * EXCEPT(product_rank) FROM customer_aggregates
WHERE product_rank = 1

