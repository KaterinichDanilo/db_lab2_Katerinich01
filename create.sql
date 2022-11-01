CREATE TABLE public."order"
(
    id integer NOT NULL,
    order_date date,
    order_time time without time zone,
    total_price real,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public."order"
    OWNER to postgres;

CREATE TABLE public.pizza_category
(
    id integer NOT NULL,
    name "char" NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.pizza_category
    OWNER to postgres;

CREATE TABLE public.pizza_size
(
    id integer NOT NULL,
    name "char" NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.pizza_size
    OWNER to postgres;

CREATE TABLE public.pizza
(
    id integer NOT NULL,
    category_id integer,
    size_id integer,
    ingredients text,
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
    id integer NOT NULL,
    order_id integer NOT NULL,
    pizza_id integer NOT NULL,
    quantity integer NOT NULL DEFAULT 1,
    unit_price real NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES public."order" (id),
    FOREIGN KEY (pizza_id) REFERENCES pizza (id)
);

ALTER TABLE IF EXISTS public.order_item
    OWNER to postgres;
