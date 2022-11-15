SELECT "order".id, SUM(order_item.quantity)
FROM "order"
LEFT JOIN order_item ON order_item.order_id = "order".id
GROUP BY "order".id
ORDER BY "order".id;

SELECT TRIM(pizza.id), SUM(order_item.quantity)
FROM pizza
LEFT JOIN order_item ON order_item.pizza_id = pizza.id
GROUP BY pizza.id
ORDER BY pizza.id;

SELECT "order".id, SUM(order_item.quantity*pizza.price) 
FROM "order"
LEFT JOIN order_item ON order_item.order_id = "order".id
LEFT JOIN pizza ON order_item.pizza_id = pizza.id
GROUP BY "order".id
ORDER BY "order".id;