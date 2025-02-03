WITH monthly_sales AS (
    SELECT
        FORMAT_DATE('%Y-%m', ordered_at) AS year_month,
        store_id,
        store_name,
        category_name,
        ROUND(SUM(total_sales),2) AS total_sales
    FROM {{ ref('int_store_sales') }}
    GROUP BY store_id, store_name, year_month, category_name
)

SELECT * FROM monthly_sales
ORDER BY year_month ASC, store_id ASC, category_name ASC
