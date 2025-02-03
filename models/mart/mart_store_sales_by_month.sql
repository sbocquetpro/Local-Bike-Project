WITH monthly_sales AS (
    SELECT  
        FORMAT_DATE('%Y-%m', ordered_at) AS year_month, -- Convertit la date de commande en format "YYYY-MM" pour obtenir une agrégation mensuelle
        -- Identifiants du magasin
        store_id,
        store_name,
        -- Catégorie du produit
        category_name,
        -- Somme totale des ventes
        ROUND(SUM(total_sales),2) AS total_sales
    FROM {{ ref('int_store_sales') }}
    GROUP BY store_id, store_name, year_month, category_name  -- Regroupement des données par mois, magasin et catégorie
)

SELECT * 
FROM monthly_sales
ORDER BY 
    year_month ASC,  -- Trie les résultats par ordre chronologique
    store_id ASC,  -- Trie ensuite par magasin
    category_name ASC  -- Trie enfin par catégorie de produit

