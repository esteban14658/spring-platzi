toc.dat                                                                                             0000600 0004000 0002000 00000024751 14240470116 0014447 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       :    '    
            z            platzi-market    14.2    14.2 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    24731    platzi-market    DATABASE     n   CREATE DATABASE "platzi-market" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "platzi-market";
                postgres    false         ?            1259    24733 
   categorias    TABLE     ?   CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    descripcion character varying(45) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false         ?            1259    24732    categorias_id_categoria_seq    SEQUENCE     ?   CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.categorias_id_categoria_seq;
       public          postgres    false    210                    0    0    categorias_id_categoria_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;
          public          postgres    false    209         ?            1259    24751    clientes    TABLE     ?   CREATE TABLE public.clientes (
    id character varying(20) NOT NULL,
    nombre character varying(40),
    apellidos character varying(100),
    celular numeric,
    direccion character varying(80),
    correo_electronico character varying(70)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false         ?            1259    24759    compras    TABLE     ?   CREATE TABLE public.compras (
    id_compra integer NOT NULL,
    id_cliente character varying(20) NOT NULL,
    fecha timestamp without time zone,
    medio_pago character(1),
    comentario character varying(300),
    estado character(1)
);
    DROP TABLE public.compras;
       public         heap    postgres    false         ?            1259    24758    compras_id_compra_seq    SEQUENCE     ?   CREATE SEQUENCE public.compras_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.compras_id_compra_seq;
       public          postgres    false    215                    0    0    compras_id_compra_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.compras_id_compra_seq OWNED BY public.compras.id_compra;
          public          postgres    false    214         ?            1259    24770    compras_productos    TABLE     ?   CREATE TABLE public.compras_productos (
    id_compra integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer,
    total numeric(16,2),
    estado boolean
);
 %   DROP TABLE public.compras_productos;
       public         heap    postgres    false         ?            1259    24740 	   productos    TABLE       CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(45),
    id_categoria integer NOT NULL,
    codigo_barras character varying(150),
    precio_venta numeric(16,2),
    cantidad_stock integer NOT NULL,
    estado boolean
);
    DROP TABLE public.productos;
       public         heap    postgres    false         ?            1259    24739    productos_id_producto_seq    SEQUENCE     ?   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    212                    0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    211         n           2604    24736    categorias id_categoria    DEFAULT     ?   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    210    209    210         p           2604    24762    compras id_compra    DEFAULT     v   ALTER TABLE ONLY public.compras ALTER COLUMN id_compra SET DEFAULT nextval('public.compras_id_compra_seq'::regclass);
 @   ALTER TABLE public.compras ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    214    215    215         o           2604    24743    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    212    211    212                   0    24733 
   categorias 
   TABLE DATA           G   COPY public.categorias (id_categoria, descripcion, estado) FROM stdin;
    public          postgres    false    210       3339.dat           0    24751    clientes 
   TABLE DATA           a   COPY public.clientes (id, nombre, apellidos, celular, direccion, correo_electronico) FROM stdin;
    public          postgres    false    213       3342.dat           0    24759    compras 
   TABLE DATA           _   COPY public.compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) FROM stdin;
    public          postgres    false    215       3344.dat           0    24770    compras_productos 
   TABLE DATA           \   COPY public.compras_productos (id_compra, id_producto, cantidad, total, estado) FROM stdin;
    public          postgres    false    216       3345.dat           0    24740 	   productos 
   TABLE DATA           {   COPY public.productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) FROM stdin;
    public          postgres    false    212       3341.dat            0    0    categorias_id_categoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 8, true);
          public          postgres    false    209                    0    0    compras_id_compra_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.compras_id_compra_seq', 1, true);
          public          postgres    false    214                    0    0    productos_id_producto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.productos_id_producto_seq', 50, true);
          public          postgres    false    211         r           2606    24738    categorias categorias_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    210         v           2606    24757    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    213         x           2606    24764    compras compras_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id_compra);
 >   ALTER TABLE ONLY public.compras DROP CONSTRAINT compras_pkey;
       public            postgres    false    215         z           2606    24774 (   compras_productos compras_productos_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT compras_productos_pkey PRIMARY KEY (id_compra, id_producto);
 R   ALTER TABLE ONLY public.compras_productos DROP CONSTRAINT compras_productos_pkey;
       public            postgres    false    216    216         t           2606    24745    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    212         |           2606    24765    compras fk_COMPRAS_CLIENTES1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compras
    ADD CONSTRAINT "fk_COMPRAS_CLIENTES1" FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);
 H   ALTER TABLE ONLY public.compras DROP CONSTRAINT "fk_COMPRAS_CLIENTES1";
       public          postgres    false    3190    215    213         ~           2606    24780 /   compras_productos fk_COMPRAS_PRODUCTOS_COMPRAS1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_COMPRAS1" FOREIGN KEY (id_compra) REFERENCES public.compras(id_compra);
 [   ALTER TABLE ONLY public.compras_productos DROP CONSTRAINT "fk_COMPRAS_PRODUCTOS_COMPRAS1";
       public          postgres    false    215    3192    216         }           2606    24775 1   compras_productos fk_COMPRAS_PRODUCTOS_PRODUCTOS1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_PRODUCTOS1" FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 ]   ALTER TABLE ONLY public.compras_productos DROP CONSTRAINT "fk_COMPRAS_PRODUCTOS_PRODUCTOS1";
       public          postgres    false    3188    216    212         {           2606    24746 !   productos fk_PRODUCTOS_CATEGORIAS    FK CONSTRAINT     ?   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT "fk_PRODUCTOS_CATEGORIAS" FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);
 M   ALTER TABLE ONLY public.productos DROP CONSTRAINT "fk_PRODUCTOS_CATEGORIAS";
       public          postgres    false    210    3186    212                               3339.dat                                                                                            0000600 0004000 0002000 00000000221 14240470116 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Frutas y verduras	t
2	Pastelería	t
3	Carnes y pescados	t
4	Lácteos y huevos	t
5	Bebidas	t
6	Licores	t
7	Cuidado personal	t
8	Despensa	t
\.


                                                                                                                                                                                                                                                                                                                                                                               3342.dat                                                                                            0000600 0004000 0002000 00000000306 14240470116 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4546221	Johannes	Kepler	3104583224	Cl 3 # 33 - 33	kepler@me.com
2552243	Galileo	Galilei	3462257293	Cl 1 # 11 - 11	gali@leo.com
983824	Nicolás	Copernico	3019392466	Cl 2 # 22 - 22	nico@cope.com
\.


                                                                                                                                                                                                                                                                                                                          3344.dat                                                                                            0000600 0004000 0002000 00000000050 14240470116 0014241 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4546221	1992-08-10 17:30:00	E		P
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        3345.dat                                                                                            0000600 0004000 0002000 00000000134 14240470116 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	10	3000.00	t
1	36	1	40000.00	t
1	27	1	9000.00	t
1	49	2	16400.00	t
1	24	1	4000.00	t
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                    3341.dat                                                                                            0000600 0004000 0002000 00000003750 14240470116 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Guayaba Feijoa	1	7029 A42 23	300.00	500	t
2	Mango	1	0316 R56 01	2100.00	250	t
3	Manzana	1	7923 T23 19	700.00	130	t
4	Aguacate	1	9322 Q33 02	2500.00	98	t
5	Lechuga	1	9742 S22 21	4000.00	86	t
6	Tomate	1	0483 R00 97	290.00	430	t
7	Pera	1	9999 X10 01	750.00	210	t
8	Apio	1	3390 F29 45	150.00	115	t
9	Papaya	1	5291 J34 32	4500.00	73	t
10	Limón	1	7886 N18 32	350.00	425	t
11	Brownie	2	6683 H15 20	2500.00	80	t
12	Pan tajado	2	5745 F05 47	4500.00	120	t
13	Torta	2	3831 D97 99	10000.00	35	t
14	Tortilla	2	4335 Z33 84	6400.00	87	t
15	Tostadas	2	6584 M19 25	4000.00	45	t
16	Chocorramo	2	4487 S00 97	2000.00	105	t
17	Salmón	3	4546 A00 01	28000.00	55	t
18	Punta de anca	3	3678 E57 22	12000.00	32	t
19	Posta	3	8893 O01 03	7800.00	40	t
20	Costilla de cerdo	3	4534 Q12 88	8600.00	70	t
21	Tilapia	3	5684 R53 02	17000.00	60	t
22	Merluza	3	3523 R04 00	23000.00	45	t
23	Leche de vaca	4	2323 T56 33	2500.00	500	t
24	Queso	4	7786 K19 56	4000.00	300	t
25	Huevos de gallina feliz	4	3478 M74 01	400.00	1000	t
26	Clara de huevo	4	7932 R31 46	3200.00	200	t
27	Suero costeño	4	5463 W23 33	9000.00	110	t
28	Agua	5	8965 I32 11	2000.00	600	t
29	Jugo de naranja	5	7445 T87 44	7400.00	200	t
30	Gaseosa Colombiana	5	3434 R34 63	3100.00	175	t
31	Jugo de Lulo	5	9753 W33 19	8250.00	630	t
32	Tea	5	9836 F35 69	1900.00	450	t
33	Cerveza	6	3432 G67 21	2100.00	800	t
34	Tequila	6	9529 E45 98	65000.00	764	t
35	Ron	6	1947 R07 53	55000.00	240	t
36	Aguardiente Antioqueño	6	3160 A54 94	40000.00	480	t
37	Vino	6	7891 W46 95	82000.00	560	t
38	Crema dental	7	6310 C99 73	7500.00	200	t
39	Jabón de manos	7	9371 J14 75	4900.00	90	t
40	Enjuague bucal	7	1942 T68 01	12000.00	105	t
41	Shampoo	7	6789 W01 23	9300.00	200	t
42	Desodorante	7	7333 S21 36	6900.00	85	t
43	Arroz	8	4676 I83 00	3500.00	600	t
44	Lentejas	8	7333 S21 36	3000.00	560	t
45	Harina	8	7333 S21 36	1800.00	300	t
46	Sal	8	7333 S21 36	1400.00	500	t
47	Aceite	8	7333 S21 36	6500.00	135	t
48	Cereal	8	4673 K53 98	7000.00	75	t
49	Frijol	8	2745 F40 45	8200.00	270	t
50	Café	8	6351 R33 92	7200.00	400	t
\.


                        restore.sql                                                                                         0000600 0004000 0002000 00000021745 14240470116 0015374 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "platzi-market";
--
-- Name: platzi-market; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "platzi-market" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE "platzi-market" OWNER TO postgres;

\connect -reuse-previous=on "dbname='platzi-market'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    descripcion character varying(45) NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_categoria_seq OWNER TO postgres;

--
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id character varying(20) NOT NULL,
    nombre character varying(40),
    apellidos character varying(100),
    celular numeric,
    direccion character varying(80),
    correo_electronico character varying(70)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id_compra integer NOT NULL,
    id_cliente character varying(20) NOT NULL,
    fecha timestamp without time zone,
    medio_pago character(1),
    comentario character varying(300),
    estado character(1)
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- Name: compras_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_id_compra_seq OWNER TO postgres;

--
-- Name: compras_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_id_compra_seq OWNED BY public.compras.id_compra;


--
-- Name: compras_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras_productos (
    id_compra integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer,
    total numeric(16,2),
    estado boolean
);


ALTER TABLE public.compras_productos OWNER TO postgres;

--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(45),
    id_categoria integer NOT NULL,
    codigo_barras character varying(150),
    precio_venta numeric(16,2),
    cantidad_stock integer NOT NULL,
    estado boolean
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- Name: compras id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN id_compra SET DEFAULT nextval('public.compras_id_compra_seq'::regclass);


--
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id_categoria, descripcion, estado) FROM stdin;
\.
COPY public.categorias (id_categoria, descripcion, estado) FROM '$$PATH$$/3339.dat';

--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, apellidos, celular, direccion, correo_electronico) FROM stdin;
\.
COPY public.clientes (id, nombre, apellidos, celular, direccion, correo_electronico) FROM '$$PATH$$/3342.dat';

--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) FROM stdin;
\.
COPY public.compras (id_compra, id_cliente, fecha, medio_pago, comentario, estado) FROM '$$PATH$$/3344.dat';

--
-- Data for Name: compras_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras_productos (id_compra, id_producto, cantidad, total, estado) FROM stdin;
\.
COPY public.compras_productos (id_compra, id_producto, cantidad, total, estado) FROM '$$PATH$$/3345.dat';

--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) FROM stdin;
\.
COPY public.productos (id_producto, nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado) FROM '$$PATH$$/3341.dat';

--
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 8, true);


--
-- Name: compras_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_compra_seq', 1, true);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 50, true);


--
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id_compra);


--
-- Name: compras_productos compras_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT compras_productos_pkey PRIMARY KEY (id_compra, id_producto);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- Name: compras fk_COMPRAS_CLIENTES1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT "fk_COMPRAS_CLIENTES1" FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


--
-- Name: compras_productos fk_COMPRAS_PRODUCTOS_COMPRAS1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_COMPRAS1" FOREIGN KEY (id_compra) REFERENCES public.compras(id_compra);


--
-- Name: compras_productos fk_COMPRAS_PRODUCTOS_PRODUCTOS1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_productos
    ADD CONSTRAINT "fk_COMPRAS_PRODUCTOS_PRODUCTOS1" FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- Name: productos fk_PRODUCTOS_CATEGORIAS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT "fk_PRODUCTOS_CATEGORIAS" FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           