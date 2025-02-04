WITH customer_orders AS (
    SELECT 
        cs.customer_id,  -- Identifiant unique du client
        -- Construction du nom complet du client
        CONCAT(cs.first_name, ' ', cs.last_name) AS customer_name,  
        -- Informations de contact et localisation
        cs.email,
        cs.city,
        cs.state,
        cs.zip_code,
        -- Nombre total de commandes distinctes passées par le client
        COUNT(DISTINCT cs.ordered_at) AS total_orders, 
        -- Chiffre d'affaires total généré par le client
        SUM(cs.total_sales) AS total_revenue, 
        -- Date de la dernière commande passée
        MAX(cs.ordered_at) AS last_order_date,
         CASE 
            WHEN MAX(cs.ordered_at) >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) 
            THEN 'Yes' 
            ELSE 'No' 
        END AS is_active
    FROM {{ ref('int_customer_sales') }} cs  
    GROUP BY cs.customer_id, cs.first_name, cs.last_name, cs.email, cs.city, cs.state, cs.zip_code
),

customer_favorites AS (
    SELECT 
        cs.customer_id,  -- Identifiant du client
        cs.product_id AS favorite_product_id,  -- Identifiant du produit favori
        cs.product_name AS favorite_product_name,  -- Nom du produit favori
        -- Total des quantités achetées pour ce produit par le client
        SUM(cs.item_quantity) AS total_quantity,
        -- Chiffre d'affaires total généré par ce produit pour ce client
        SUM(cs.total_sales) AS total_sales,
        -- Classement des produits favoris du client en fonction des quantités achetées
        -- En cas d'égalité, le produit ayant généré le plus de revenus est privilégié
        RANK() OVER (
            PARTITION BY cs.customer_id 
            ORDER BY SUM(cs.item_quantity) DESC,  -- Priorité à la quantité achetée
                     SUM(cs.total_sales) DESC    -- En cas d'égalité, priorité au CA généré
        ) AS product_rank  
    FROM {{ ref('int_customer_sales') }} cs 
    GROUP BY cs.customer_id, cs.product_id, cs.product_name
)

SELECT 
    co.*,  -- Toutes les informations de la table customer_orders
    cf.favorite_product_id,  -- Produit favori du client
    cf.favorite_product_name  -- Nom du produit favori
FROM customer_orders co
JOIN customer_favorites cf ON co.customer_id = cf.customer_id 
WHERE cf.product_rank = 1  -- On ne garde que le produit favori (classé 1er)


