--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-12-11 23:49:33

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
-- TOC entry 210 (class 1259 OID 33132)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33131)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 33138)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33137)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 33144)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33143)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 33150)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255),
    patronymic text,
    birthday text NOT NULL,
    email text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    phone_number text NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33149)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 33158)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33167)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33166)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 33157)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3354 (class 0 OID 33132)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Мебель');
INSERT INTO public.category (id, name) VALUES (2, 'Бытовая техника');
INSERT INTO public.category (id, name) VALUES (3, 'Одежда');


--
-- TOC entry 3356 (class 0 OID 33138)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '4a1fa23b-50b2-44d0-9d28-8c6edfe28aec.1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '4a82356d-cb83-4a0e-9cf1-13f3c2964db2.2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '3f1c73eb-f9ed-4d61-932f-581047442552.3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '86fc46dc-4329-4931-be2e-d87625df3b9c.4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '1cb0545c-4a25-4a1e-9834-ef6b384e90ff.5.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, '3731997d-8f90-45df-971c-47adf245fa08.1.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '3649d4a9-706e-40bf-bfa2-d0901eb04fc8.2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '616a61b1-0a14-4562-9a3d-c8a14f1246ce.3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '2d7c91ee-b9c6-4c6f-a9dc-59522c5beb0e.4.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'b65ea9e2-302e-4a64-8899-fb9995b8342d.5.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '786a6a42-0a2f-4c4c-b538-d2ab1c79b1a0.1.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '0eca8476-63f6-43c8-895c-c1d5b82b738d.2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '88ead752-d776-45af-99bb-e7097fe50006.3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, 'cdcfc0df-d07c-4203-b668-5f5a70522530.4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '3a5d8e7a-f139-4525-8d75-9611aa40ad27.5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, 'e6755e47-088e-4def-acfb-24465e3384a0.1.jpeg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'faca659b-8cce-409d-8ed6-6ca4d9e53c23.2.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, 'c47eda67-997b-43d2-9bc3-5d2c77927499.3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'fe90a260-8af9-4a3c-b03e-6f5abde24bd9.4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, 'b4c7155d-f764-4831-bc3e-b2f7ae18669f.5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, 'c1de25ce-1ca4-44ae-a81d-909c09ddb148.1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'd5723fa1-7897-4b8d-b72d-73e4595cc674.2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'b5fcd562-4ad8-424f-8ebc-21e08b6843be.3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, '3ad46339-d412-42b6-be11-265aee1bbdd9.4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '2af33ff6-5f72-4a15-87c5-d876182d3741.5.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '6a9199fd-d30f-47dd-89c2-23724fd86fcc.1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, 'fb95cb69-e788-437b-bc85-c5fa31c6a990.2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '0d269291-1c49-46b9-8f19-36eb537ff4ad.3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '48e29010-41ed-490e-85a4-f3a780e1245d.4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '3286c15b-e930-484d-891d-54f6b2083c61.5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '65e3b4ce-d6b0-4e32-9592-d4b4869df332.1 (1).jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'fdee5816-76e1-4f92-84fa-5be909f19121.2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '4cac82ec-65b0-421b-adc8-7a53f344000f.3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'd6be51ca-33b4-46fc-b236-420441e956db.4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '970d8c72-3c4f-4cc6-894a-5f8b5314ab75.5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'e2ab9e4d-c37b-4f49-ba69-fed214136509.1 .jpeg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '2c8c3cbb-2fc7-4634-ac1e-7d8e2e20e6de.2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '7ae36908-26d2-45f5-a526-de79b3f2b801.3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '00583dc0-2af8-4fa4-9ea8-01c2a5907b82.4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '924a076b-4472-409d-be51-df5988243056.5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '9fcdff3f-8b87-4fdb-84e9-37845c20f254.1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, 'ca7ad971-01cb-4dd7-8e2e-09b0ec899cff.2.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '337f71a2-fdc0-48a2-bb55-99c83e89c7c9.3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, 'cbf7bfa5-ecdf-46c1-9627-ff7fb590adb8.4.jpeg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, 'dba8185c-9bd9-427f-ba2c-391ec08fc698.5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, 'a92abac7-8d2b-4a8b-ae10-57b70fe30180.img1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, '680c9dc0-5e8c-45b3-a705-4c6bd2e6f4b0.img2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '5a766684-89d3-4c40-82d3-2065c54556a8.img3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, '2a2b436e-79d2-48b0-a389-ff5650215d3a.img4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '5e5d077f-5d7b-460c-857e-33243bb2ed07.img5.jpg', 10);


--
-- TOC entry 3358 (class 0 OID 33144)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-10 09:58:00', '50f390e1-ad54-4f3c-99c1-4b2260b364aa', 1450, 3, 4, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-10 11:55:00', '739ec273-8163-4499-b423-0de060b5e095', 17995, 1, 4, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 0, '2022-12-09 11:10:00', '894ef9f1-892c-42b0-8c99-a2dedfdbf18f', 3000, 2, 4, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2022-12-09 23:41:00', '840d92bf-eb93-45a8-9d58-35fb338b315f', 2520, 0, 4, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-11 23:14:19.809776', '454d47a3-27c7-486a-9e32-572a19728d82', 1450, 1, 6, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 0, '2022-12-09 11:10:00', '894ef9f1-892c-42b0-8c99-a2dedfdbf18f', 338, 2, 4, 6);


--
-- TOC entry 3360 (class 0 OID 33150)
-- Dependencies: 216
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role, patronymic, birthday, email, firstname, lastname, phone_number) VALUES (3, 'admin', '$2a$10$mzgGp/rcI4jWUi5vwCf9KeCIxJP4QB9ytTuScgQny2txLd7WrVxAi', 'ROLE_ADMIN', 'Иванович', '20.10.1995', 'example_admin@gmail.com', 'Иван', 'Иванов', '89507743621');
INSERT INTO public.person (id, login, password, role, patronymic, birthday, email, firstname, lastname, phone_number) VALUES (4, 'user_1', '$2a$10$zWzuqxv.VS/E..NtM2601O/0q6JFgIFk/FDBlUoQzKPFh12P2Q9se', 'ROLE_USER', 'Артемович', '10.12.1990', 'example_user@mail.ru', 'Кирилл', 'Сеулов', '89603348612');
INSERT INTO public.person (id, login, password, role, patronymic, birthday, email, firstname, lastname, phone_number) VALUES (6, 'krivoy_1', '$2a$10$vJlJx/vYvXqizEPJp.7PL.g7nSO7ie3pgGgYvSEeza.E.DRWH6bze', 'ROLE_ADMIN', 'Киркорович', '01.01.1970', 'kirkorov@mail.ru', 'Александр', 'Иванов', '89519326544');


--
-- TOC entry 3362 (class 0 OID 33158)
-- Dependencies: 218
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (2, '2022-12-07 13:19:18.945412', 'Размеры (ШхГхВ): 75,2х43х75 см. Комод неотъемлемая часть мебели квартиры или дома. Комод деревянный Ксения станет надежным помощником в хранении вещей. Комод для хранения представлен в нескольких цветах: белый, крафт белый, серый, дуб сонома и бук, что позволит вписать в интерьер комнаты и сочетать с другой мебелью в доме. Комод для вещей идет в двух вариантах: с ручками и без них. Во втором варианте в комоде убраны ручки и удлинен фасад, за который и происходит открывание. Универсальность тумбы позволяет использовать ее, как детскую мебель в комнате вашего ребенка, в четырех больших ящиках поместятся игрушки и вещи. Поставьте его вместе с письменным столом Альянс арт. 100243145 в детской и он станет помощником в хранении учебников, тетрадей и канцелярии. В спальне он выступит как тумба для ТВ. А поставив в прихожей, комод Ксения будет сочетаться с обувницей Грация арт. 114272890 и настенной вешалкой Глория арт. 73452816. Мебельная фабрика «Стендмебель» использует только высококачественные материалы и фурнитуру, мы заботимся о наших покупателях и хотим, чтобы наша мебель прослужила Вам как можно дольше. Мы делаем все возможное, чтобы наша продукция доезжала даже в самые дальние уголки нашей страны целой и радовало Вас, для этого мы упаковываем нашу продукцию в картон, а по периметру укрепляем упаковку пенопластом. Для сборки Вам понадобится отвертка или шуроповерт, ключ шестигранник идет в комплекте. Гарантия: 12 месяцев', 3960, 'Стендмебель - фабрика мебели', 'Стендмебель Комод с ящиками Ксения СТМ для вещей', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (3, '2022-12-07 13:22:03.441873', 'Размеры (ШхГхВ): 60х25,6х75 смНаша обувница Джулия станет прекрасным решением для удобного хранения обуви в прихожей, создав комфорт и чистоту в Вашем доме. Основное преимущество данной модели - её компактные размеры, позволяющие сэкономить несколько квадратных метров пола прихожей даже небольшой квартиры, обувная полка подойдет для хранения мужской, женской и детской обуви. Благодаря классическому дизайну, универсальности и актуальным цветовым решениям этажерка для обуви отлично дополнит Ваш комплект мебели любого стиля. Обувница в прихожую или как ее еще называют, галошница оснащена изолированной полочкой под аксессуары, которая станет незаменимой для домашних мелочей, ключей, перчаток, шапок, шарфов или предметов по уходу за обувью. В закрытом состоянии используйте её, чтобы поставить сумочку или пакет, положить зонт. Обувница белая, как и другие цвета имеет три наклонные полки для обуви в прихожую общей вместимостью до 9 пар обуви. Обувница для обуви сделана из сертифицированных и высококачественных ЛДСП, поэтому она прослужит Вам не один год. Собрать полки для обуви легко в домашних условиях. К набору прилагается подробная инструкция по сборке. Габаритные размеры обувницы (ШхВхГ) 60х25,6х75 см. Так же предлагаем другие наши товары бренда Стендмебель: Вешалка Глория артикул 73452816, Обувница Дина артикул 73474145, Вешалка Грация-2 артикул 112396129.', 2520, 'Стендмебель - фабрика мебели', 'Стендмебель Обувница Джулия СТМ, тумба для обуви', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (4, '2022-12-07 13:26:58.157306', 'Размеры (ШхГхВ): 100х38,6х74,6 см Компьютерный стол Софи привлекает своей функциональностью, строгим дизайном и высоким уровнем прочности. Наш стол выполнен в трех цветах поэтому для него найдется место в любой комнате Вашего дома. Может использоваться как детский, компьютерный столик для учебы и отдыха или в кабинет и использовать его как рабочий стол. Вы можете расставить на него косметику и использовать как туалетный столик в спальню. В открытые полочки можно положить не только любимые книги и игрушки, но и различную мелочь для дома. Так же стол отлично впишется в любой офис и станет удобным рабочим местом для сотрудника. Модели обладают стандартной высотой, которая обеспечит вам и вашему ребенку комфортную посадку. Для стола используются сертифицированные, высококачественные ЛДСП, поэтому наша мебель прослужит вам не один год. К набору прилагается подробная инструкция по сборке.', 3000, 'Стендмебель - фабрика мебели', 'Стендмебель Стол письменный Софи СТМ, компьютерный', 'Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, '2022-12-07 13:28:32.15849', 'Джинсы молодежные на лето и осень - незаменимая вещь современного модного базового мужского гардероба. Удобные и функциональные - эти штаны брюки используются в качестве рабочей одежды, для дома, для спорта, для бега. Разнообразие моделей джинсовых брюк широкое: трубы, бананы, бойфренды, джоггеры, slim, бриджи, мотоджинсы. Особой популярностью пользуются прямые и зауженные к низу классические джинсы со средней и высокой посадкой. В коллекции бренда EREMES представлены синие голубые джинсы для мужчин высокого роста ( до 190 см), отлично сочетаются с рубашкой, толстовкой, худи, пиджаком и водолазкой. Модель штанов классического прямого кроя, застежка молния и шарнирная пуговица, накладные карманы сзади, штаны не зауженные, без флиса. Идеальная посадка обеспечена за счет точных лекал с фабрик Турции. Штаны подойдут обладателям больших размеров и высоким мальчикам подросткам. В них удобно водить автомобиль и мотоцикл. Мужские брюки комфортно носить в летний период. Подарок любимому другу папе. Турецкие джинсы мужские прямые широкие штаны классика брюки для невысоких мужская одежда для мальчиков рваные американки брюки с карманами без утепления скинни осень зима casual слоучи момы из плотного денима skinny с потертостями спортивки оверсайз стрейч светлые узкие молодежные слим большие зимние потертые по бокам больших размеров летние брюки', 1450, 'EREMES', 'Eremes Джинсы мужские прямые классические', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-07 13:30:15.388635', 'Футболка мужская хлопок спортивная однотонная базовая модная свободная пляжная с коротким рукавом. Стильная хлопковая футболка классического кроя - это вещь унисекс, которая подойдет и мужчинам, и женщинам. СОСТАВ: ХЛОПОК 100% ПЛОТНОСТЬ 180 гр/мк в. Молодежная женская и мужская футболка выполнена из плотной хлопковой ткани и имеет круглый вырез горловины. Удлиненная футболка подходит для отдыха, туризма и занятий спортом: фитнеса, йоги, бега и тренировок в зале. В ней можно отправиться на прогулку в город. Базовая футболка вписывается в школьную форму и офисный стиль. Ее можно носить дома или надеть в школу и на работу в офис под пиджак. Трикотажная футболка оптимальна для носки летом. Она является базовой вещью и будет прекрасно сочетаться со всеми вещами в вашем гардеробе, в том числе в стиле оверсайз. Красивая футболка подойдет парням и девушкам любого роста - высоким и невысоким. Ее могут носить взрослые и подростки. В ассортименте большой выбор ярких цветов. Вы можете подарить ее на день рождения любимому мужу, маме, брату или папе. У нас есть акции и распродажи, вы можете купить наши товары в подарок со скидкой!', 338, 'UZcotton', 'UZcotton Футболка мужская хлопок спортивная однотонная базовая', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-07 13:40:01.044088', 'Мужская футбольная куртка для тренировок в прохладную погоду. Утепленная модель дополнена стегаными вставками на подкладке и рукавах. Застежка на молнию и глубокий прилегающий капюшон. Современный приталенный крой.', 11249, 'ВАЙЛДБЕРРИЗ', 'adidas Куртка', 'Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, '2022-12-07 13:41:23.465261', '**5 в 1: Планетарный миксер с 3-мя насадками, Блендер, Мясорубка. Технология SmartMIX - прибор автоматически подбирает оптимальную мощность работы для каждого вида и количества ингредиентов. Технология PROtect+ защита двигателя от перегрева.** Надёжная конструкция со стальными шестернями. Планетарное вращение насадок. Чаша из нержавеющей стали. Объем чаши 5 л. 6 скоростных режимов. Плавная регулировка скорости. Импульсивный режим. Венчик для взбивания. Насадка для смешивания. Крюк для замешивания теста. Крышка чаши для добавления ингредиентов. Мясорубка: 2 диска из нержавеющей стали (5 и 7 мм). Кувшин блендера из высокопрочного стекла объемом 1,5 л.Низкий уровень шума. Система безопасного включения. Защита двигателя от перегрева. Отсек для намотки сетевого шнура. Прорезиненные ножки. Мощность: 1100 Вт.', 10999, 'ВАЙЛДБЕРРИЗ', 'Polaris Планетарный миксер / Кухонная машина PKM 1104, (POLARIS)', 'Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-07 13:43:50.106265', 'Беспроводной ручной портативный пылесос отлично подойдет для уборки различных помещений. В комплекте присутствуют фильтр, вертикальный стакан или контейнер для воды, есть насадки, но набор идет без мешка. Присутствует 3 бака для воды. В одном вода очищается, в другом - хранится в чистом виде, а в третий - поступает грязная. Также есть функция самоочистки пылесоса. И сухая, и влажная уборка с ним станут намного проще и быстрее. Щетка имеет мощный аккумулятор и работает на батарейка. Компактный мобильный пылесос может использоваться как швабра. Моющий прибор хорошо подойдет для уборки шерсти с дивана, чистки ковров, для пыли и грязи, или просто для мытья полов. Мобильный аккумуляторный пылесос очень хороший помощник для дома.', 17995, 'Официальный магазин Polaris', 'Redkey Вертикальный пылесос , моющий пылесос', 'Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Новая стиральная машина ATLANT серии INTENSE EXPERT имеет уникальный дизайн, который прекрасно дополнит любой интерьер своим внешним видом. С помощью новых сенсорных технологий достаточно легкого касания для выбора функций и программ. Светодиодные индикаторы и сегментный дисплей машины размещены на панели управления под небольшим углом, что облегчает визуальное восприятие отображаемой информации о работе машины. Благодаря интеллектуальным программам она не только интуитивно понятна в управлении, но и обеспечивает превосходные результаты стирки при низком потреблении воды и электроэнергии. Кроме того, действует увеличенная гарантия 5 лет на двигатель.', 4200, 'ВАЙЛДБЕРРИЗ', 'ATLANT Стиральная машина CMA-80 C 1214-01', 'Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-11 23:28:31.389531', 'Привет, ты уже видела эту красоту? Это же удобный и при этом модный женский свитер Москва из высококачественной турецкой пряжи! Вязаный оверсайз джемпер с надписью moscow - современный тренд, идет девочкам, взрослым женщинам, беременным и кормящим мамам. Удлиненная утепленная кофта с длинными рукавами и воротником-стойкой - прекрасный выбор на зиму, осень, демисезон и весну. Зимняя кофточка с крупным узором представлена в разных цветах: черном, красном, зеленом и коричневом цвете. Подростковый свитшот с высокой горловиной без выреза идеален подросткам в школу и дома под рваные джинсы с дырками, брюки из хлопка. Также шерстяная фуфайка с синим принтом огня отлично смотрится с укороченной юбкой, ее можно надеть поверх короткого платья и белой рубашки. Наверняка вы часто видели в аниме наруто и в корейских дорамах, сериалах такой элемент, как трикотажный oversize пуловер с объемными плечами. Широкая осенняя туника из мягкого акрила и шерсти приятна к коже, на ощупь как пушистое облако, дополнит праздничный образ на новый год. Яркий цветной новогодний в рубчик балахон сядет на 42, 44, 48, 50, 52 размер, а за счет свободного кроя подойдет полным девушкам. Весенний спортивный свитерок вязки лапша сохранит форму после стирки, сочетается с верхней одеждой из трикотажа и кардиганами с капюшоном. Домашняя демисезонная водолазка с хомутом и большим рисунком Москва - базовое трендовое изделие в шкаф модницы. Такая стильная акриловая вещь без молнии, замка и пуговиц - идеальный вариант для любителей стиля гранж, эмо и панк. Ждем вас с открытым сердцем!**', 3600, 'Indi knitwear', 'Indi knitwear Свитер женский оверсайз вязаный с горлом Москва новогодний', 'Кирьяново', 1);


--
-- TOC entry 3364 (class 0 OID 33167)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 50, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 6, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 215
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 6, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 9, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 217
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 10, true);


--
-- TOC entry 3191 (class 2606 OID 33136)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 33142)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 33148)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 33156)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 33171)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 33165)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 41156)
-- Name: person uk_2ldqhx89sy06ya51rrnndhwmc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_2ldqhx89sy06ya51rrnndhwmc UNIQUE (phone_number);


--
-- TOC entry 3201 (class 2606 OID 41154)
-- Name: person uk_fwmwi44u55bo4rvwsv0cln012; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT uk_fwmwi44u55bo4rvwsv0cln012 UNIQUE (email);


--
-- TOC entry 3205 (class 2606 OID 33173)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3209 (class 2606 OID 33179)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3211 (class 2606 OID 33189)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3210 (class 2606 OID 33184)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3208 (class 2606 OID 33174)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3213 (class 2606 OID 33199)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3212 (class 2606 OID 33194)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-11 23:49:34

--
-- PostgreSQL database dump complete
--
