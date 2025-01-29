SELECT 
    CONCAT(order_id, '-', item_id) AS order_items_id,
    order_id,
    item_id,
    product_id,
    quantity AS item_quantity,
    list_price AS item_price,
    discount
FROM {{source('Sales','order_items')}}