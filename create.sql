DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS "order";
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS pizza_category;
DROP TABLE IF EXISTS pizza_size;

CREATE TABLE public."order"
(
    id bigserial PRIMARY KEY,
    order_date date,
    order_time time without time zone
);

ALTER TABLE IF EXISTS public."order"
    OWNER to postgres;

CREATE TABLE public.pizza_category
(
    id bigserial,
    name "char" NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.pizza_category
    OWNER to postgres;

CREATE TABLE public.pizza_size
(
    id bigserial,
    name "char" NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.pizza_size
    OWNER to postgres;

CREATE TABLE public.pizza
(
    id CHAR(50),
    category_id integer,
    size_id integer,
    name "char" NOT NULL,
    price real NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (size_id) REFERENCES pizza_size (id),
    FOREIGN KEY (category_id) REFERENCES pizza_category (id)
);

ALTER TABLE IF EXISTS public.pizza
    OWNER to postgres;


CREATE TABLE public.order_item
(
    id bigserial,
    order_id integer NOT NULL,
    pizza_id CHAR(50) NOT NULL,
    quantity integer NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES public."order" (id),
    FOREIGN KEY (pizza_id) REFERENCES pizza (id)
);

ALTER TABLE IF EXISTS public.order_item
    OWNER to postgres;
