WITH product_sales AS (
    SELECT 
        ss.store_id,         -- Identifiant du magasin
        ss.store_name,       -- Nom du magasin
        ss.product_id,       -- Identifiant du produit
        ss.product_name,     -- Nom du produit
        ss.category_name,    -- Catégorie du produit
        -- Calcul du nombre total d'articles vendus pour ce produit
        SUM(ss.item_quantity) AS total_quantity_sold,
        -- Calcul du chiffre d'affaires total généré par ce produit
        SUM(ss.total_sales) AS total_sales,
    FROM {{ ref('int_store_sales') }} ss  -- Source des ventes en magasin
    GROUP BY ss.store_id, ss.store_name, ss.product_id, ss.product_name, ss.category_name
),

product_stock AS (
    SELECT 
        s.store_id,         -- Identifiant du magasin
        s.product_id,       -- Identifiant du produit
        s.product_quantity AS current_stock, -- Stock actuel du produit
        -- Définition du statut de stock en fonction de la quantité disponible
        CASE 
            WHEN s.product_quantity = 0 THEN 'RUPTURE'         -- Plus aucun stock
            WHEN s.product_quantity < 10 THEN 'STOCK FAIBLE'   -- Moins de 10 unités restantes
            ELSE 'EN STOCK'                                    -- Stock suffisant
        END AS stock_status
    FROM {{ ref('stg_Production__stocks') }} s 
)

SELECT 
    ps.*,               -- Toutes les colonnes issues du CTE product_sales
    psk.current_stock,  -- Ajout de la quantité actuelle en stock
    psk.stock_status    -- Ajout du statut de stock (RUPTURE, STOCK FAIBLE, EN STOCK)
FROM product_sales ps
LEFT JOIN product_stock psk 
    ON ps.store_id = psk.store_id 
    AND ps.product_id = psk.product_id

