INSERT INTO public.pizza_size (name)
	VALUES ('S'), ('M'), ('L');
	
INSERT INTO public.pizza_category (name)
	VALUES ('Classic'), ('Supreme'), ('Veggie'), ('Chicken');

INSERT INTO public.pizza (id, category_id, size_id, ingredients, name, price)
	VALUES 
	('hawaiian_m', 1, 2, 'Sliced Ham, Pineapple, Mozzarella Cheese', 'The Hawaiian Pizza', 13.25),
	('classic_dlx_m', 1, 2, 'Pepperoni, Mushrooms, Red Onions, Red Peppers, Bacon', 'The Classic Deluxe Pizza', 16),
	('five_cheese_l', 3, 3, 'Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic', 'The Five Cheese Pizza', 18.5),
	('ital_supr_l', 2, 3, 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic', 'The Italian Supreme Pizza', 20.75),
	('mexicana_m', 3, 2, 'Tomatoes, Red Peppers, Jalapeno Peppers, Red Onions, Cilantro, Corn, Chipotle Sauce, Garlic', 'The Mexicana Pizza', 16),
	('thai_ckn_l', 4, 3, 'Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce', 'The Thai Chicken Pizza', 20.75),
	('ital_supr_m', 2, 2, 'Calabrese Salami, Capocollo, Tomatoes, Red Onions, Green Olives, Garlic', 'The Italian Supreme Pizza', 16.5),
	('prsc_argla_l', 2, 3, 'Prosciutto di San Daniele, Arugula, Mozzarella Cheese', 'The Prosciutto and Arugula Pizza', 20.75);
	
INSERT INTO public."order" (order_date, order_time)
	VALUES ('01-01-2015', '11:38:36'), ('01-01-2015', '11:57:40'), ('01-01-2015', '11:57:40');
	
INSERT INTO public.order_item (order_id, pizza_id, quantity, unit_price, total_price)
	VALUES (1, 'hawaiian_m', 1, 13.25, 13.25),
	(2, 'classic_dlx_m', 1, 16, 16),
	(2, 'five_cheese_l', 1, 18.5, 18.5), 
	(2, 'ital_supr_l', 1, 20.75, 20.75),
	(2, 'mexicana_m', 1, 16, 16),
	(2, 'thai_ckn_l', 1, 20.75, 20.75),
	(3, 'ital_supr_m', 1, 16.5, 16.5),
	(3, 'prsc_argla_l', 1, 20.75, 20.75);