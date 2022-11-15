INSERT INTO public.pizza_size (name)
	VALUES ('S'), ('M'), ('L');
	
INSERT INTO public.pizza_category (name)
	VALUES ('Classic'), ('Supreme'), ('Veggie'), ('Chicken');

INSERT INTO public.pizza (id, category_id, size_id, name, price)
	VALUES 
	('hawaiian_m', 1, 2, 'The Hawaiian Pizza', 13.25),
	('classic_dlx_m', 1, 2, 'The Classic Deluxe Pizza', 16),
	('five_cheese_l', 3, 3, 'The Five Cheese Pizza', 18.5),
	('ital_supr_l', 2, 3, 'The Italian Supreme Pizza', 20.75),
	('mexicana_m', 3, 2, 'The Mexicana Pizza', 16),
	('thai_ckn_l', 4, 3, 'The Thai Chicken Pizza', 20.75),
	('ital_supr_m', 2, 2, 'The Italian Supreme Pizza', 16.5),
	('prsc_argla_l', 2, 3, 'The Prosciutto and Arugula Pizza', 20.75);
	
INSERT INTO public."order" (order_date, order_time)
	VALUES ('01-01-2015', '11:38:36'), ('01-01-2015', '11:57:40'), ('01-01-2015', '11:57:40');
	
INSERT INTO public.order_item (order_id, pizza_id, quantity)
	VALUES (1, 'hawaiian_m', 1),
	(2, 'classic_dlx_m', 1),
	(2, 'five_cheese_l', 1), 
	(2, 'ital_supr_l', 1),
	(2, 'mexicana_m', 1),
	(2, 'thai_ckn_l', 1),
	(3, 'ital_supr_m', 1),
	(3, 'prsc_argla_l', 1);