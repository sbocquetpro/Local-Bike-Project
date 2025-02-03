WITH product_stock_sales AS (
    SELECT 
        iss.store_id,
        iss.store_name,
        iss.product_id,
        iss.product_name,
        iss.category_name,
        SUM(iss.item_quantity) AS total_quantity_sold,
        SUM(iss.total_sales) AS total_sales,
        SAFE_DIVIDE(SUM(iss.total_sales), SUM(iss.item_quantity)) AS avg_price,
        sps.product_quantity AS current_stock, 
        CASE 
            WHEN sps.product_quantity = 0 THEN 'RUPTURE'
            WHEN sps.product_quantity < 10 THEN 'STOCK FAIBLE'
            ELSE 'EN STOCK'
        END AS stock_status
    FROM {{ ref('int_store_sales') }} iss
    LEFT JOIN {{ ref('stg_Production__stocks') }} sps ON iss.product_id = sps.product_id AND iss.store_id = sps.store_id
    GROUP BY iss.store_id, iss.store_name, iss.product_id, iss.product_name, iss.category_name, sps.product_quantity
)

SELECT * FROM product_stock_sales
