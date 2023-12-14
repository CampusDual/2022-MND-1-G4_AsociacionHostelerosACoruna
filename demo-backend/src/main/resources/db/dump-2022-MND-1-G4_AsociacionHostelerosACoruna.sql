--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16 (Debian 11.16-0+deb10u1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-02-02 11:00:15

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

--DROP DATABASE "Master_UDC_2022_G4";
--
-- TOC entry 2964 (class 1262 OID 204970)
-- Name: Master_UDC_2022_G4; Type: DATABASE; Schema: -; Owner: -
--

--CREATE DATABASE "Master_UDC_2022_G4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


\connect "Master_UDC_2022_G4"

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

--CREATE SCHEMA public;


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 197 (class 1259 OID 205115)
-- Name: contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname1 character varying(255) NOT NULL,
    id_user integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 205113)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 196
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 199 (class 1259 OID 205126)
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    description character varying(255),
    name character varying(255)
);


--
-- TOC entry 198 (class 1259 OID 205124)
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 198
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- TOC entry 200 (class 1259 OID 205135)
-- Name: profiles_sections_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles_sections_map (
    profile_id integer NOT NULL,
    section_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 205140)
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    alias character varying(255),
    description character varying(255),
    name character varying(255)
);


--
-- TOC entry 201 (class 1259 OID 205138)
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 201
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- TOC entry 204 (class 1259 OID 205151)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255),
    name character varying(255),
    nif character varying(255),
    password character varying(255),
    surname1 character varying(255),
    surname2 character varying(255)
);


--
-- TOC entry 203 (class 1259 OID 205149)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 205 (class 1259 OID 205160)
-- Name: users_profiles_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_profiles_map (
    user_id integer NOT NULL,
    profile_id integer NOT NULL
);


--
-- TOC entry 2805 (class 2604 OID 205118)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 2806 (class 2604 OID 205129)
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- TOC entry 2807 (class 2604 OID 205143)
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- TOC entry 2808 (class 2604 OID 205154)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2950 (class 0 OID 205115)
-- Dependencies: 197
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.contacts VALUES (68, 'Twinfin', 'B2589547', 53);
INSERT INTO public.contacts VALUES (66, 'A Buserana', 'B78548595', 51);
INSERT INTO public.contacts VALUES (78, 'Atlántico 57', 'B95213145', 63);
INSERT INTO public.contacts VALUES (81, 'Bar Tracio', 'B85475541', 66);
INSERT INTO public.contacts VALUES (79, 'Caprice Estadio', 'B79521146', 64);
INSERT INTO public.contacts VALUES (73, 'Cervecería Estrella de Galicia', 'B78957425', 58);
INSERT INTO public.contacts VALUES (75, 'Cervecería Yates´s', 'B69850427', 60);
INSERT INTO public.contacts VALUES (61, 'Esquiniña', 'B89547878', 46);
INSERT INTO public.contacts VALUES (64, 'Kvras', 'B45878159', 49);
INSERT INTO public.contacts VALUES (67, 'La Maleta', 'B47485987', 52);
INSERT INTO public.contacts VALUES (77, 'La Mar Salada', 'B95879412', 62);
INSERT INTO public.contacts VALUES (69, 'La Pala', 'B84958745', 54);
INSERT INTO public.contacts VALUES (65, 'La Urbana', 'B89583745', 50);
INSERT INTO public.contacts VALUES (76, 'Le Tavernier', 'B85474892', 61);
INSERT INTO public.contacts VALUES (80, 'Oasis', 'B85478521', 65);
INSERT INTO public.contacts VALUES (70, 'O´Sampaio', 'B78545893', 55);
INSERT INTO public.contacts VALUES (71, 'Pier', 'B15895867', 56);
INSERT INTO public.contacts VALUES (62, 'Rubia y Gallega', 'B85478659', 47);
INSERT INTO public.contacts VALUES (72, 'Sham-Rock', 'B41589516', 57);
INSERT INTO public.contacts VALUES (74, 'The Breen''s Tavern', 'B56987945', 59);
INSERT INTO public.contacts VALUES (85, 'Conde Bar', 'B44235678', 70);
INSERT INTO public.contacts VALUES (63, 'Bogart Baar', 'B87854587', 48);


--
-- TOC entry 2952 (class 0 OID 205126)
-- Dependencies: 199
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profiles VALUES (2, 'Acceso general', 'Administrador');
INSERT INTO public.profiles VALUES (1, 'Acceso general', 'Administrador');
INSERT INTO public.profiles VALUES (3, 'Acceso Restringido', 'Usuario');


--
-- TOC entry 2953 (class 0 OID 205135)
-- Dependencies: 200
-- Data for Name: profiles_sections_map; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profiles_sections_map VALUES (1, 1);
INSERT INTO public.profiles_sections_map VALUES (2, 2);
INSERT INTO public.profiles_sections_map VALUES (2, 1);
INSERT INTO public.profiles_sections_map VALUES (3, 3);
INSERT INTO public.profiles_sections_map VALUES (1, 3);
INSERT INTO public.profiles_sections_map VALUES (2, 3);


--
-- TOC entry 2955 (class 0 OID 205140)
-- Dependencies: 202
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sections VALUES (1, 'CONTACTS', 'Perfiles y secciones a los que puede acceder cada perfil.', 'Contactos');
INSERT INTO public.sections VALUES (2, 'GESTOR', 'El Gestor tendrá todos los privilegios.', 'Contactos');
INSERT INTO public.sections VALUES (3, 'HOME', 'Página de Inicio.', 'Home');


--
-- TOC entry 2957 (class 0 OID 205151)
-- Dependencies: 204
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'demo', 'Demo', NULL, 'C5rCRzh9s2DPHYrnnLS/eg==', 'Demo', NULL);
INSERT INTO public.users VALUES (47, 'rubia', NULL, NULL, 'l0k1FC1HFKfOWcaQHxG86w==', NULL, NULL);
INSERT INTO public.users VALUES (48, 'bogart', NULL, NULL, 'GvwLJlWM00LJycW1zye5pg==', NULL, NULL);
INSERT INTO public.users VALUES (49, 'kvras', NULL, NULL, 'pRfE11x8DNW+v4EgrasVpw==', NULL, NULL);
INSERT INTO public.users VALUES (50, 'urbana', NULL, NULL, 'prMDi5j9c6yuhlHdlpVLXQ==', NULL, NULL);
INSERT INTO public.users VALUES (2, 'gestor', 'Gestor', NULL, 'OG7VcI0zgEl+8hKeu4pVWw==', 'Gestor', NULL);
INSERT INTO public.users VALUES (52, 'maleta', NULL, NULL, 'eEknt8j19ahtfDFtz9tQhQ==', NULL, NULL);
INSERT INTO public.users VALUES (53, 'twinfin', NULL, NULL, 'jDmG3yRaThh+wfJsCwgi8Q==', NULL, NULL);
INSERT INTO public.users VALUES (55, 'sampaio', NULL, NULL, '6s1lDkIXnX9VJmIsBfSlmQ==', NULL, NULL);
INSERT INTO public.users VALUES (56, 'pier', NULL, NULL, 'MNs4u9bm6sLpnGp34cmg/g==', NULL, NULL);
INSERT INTO public.users VALUES (57, 'sham', NULL, NULL, 'z10EAo/6IaN9s7tcUCbW5Q==', NULL, NULL);
INSERT INTO public.users VALUES (58, 'estrella', NULL, NULL, 'vNw1qjJHHoAypTggZAM5uQ==', NULL, NULL);
INSERT INTO public.users VALUES (59, 'breens', NULL, NULL, 'jSNAiaO4HuuPezRnRQqEbw==', NULL, NULL);
INSERT INTO public.users VALUES (60, 'yates', NULL, NULL, 'heP1B+f/bzC04X7hL/nnew==', NULL, NULL);
INSERT INTO public.users VALUES (61, 'tavernier', NULL, NULL, '6bgn8POLtK5m9D9hd2/ybA==', NULL, NULL);
INSERT INTO public.users VALUES (46, 'esquiniña', NULL, NULL, 'HOQ/ij9T4+t98WOTqXUTUQ==', NULL, NULL);
INSERT INTO public.users VALUES (63, 'atlantico', NULL, NULL, '/LGW+ZiSj+l6q0acrP6xxw==', NULL, NULL);
INSERT INTO public.users VALUES (64, 'caprice', NULL, NULL, 'XsrC636krvmQq7/HrdW0CA==', NULL, NULL);
INSERT INTO public.users VALUES (65, 'oasis', NULL, NULL, '+vjc0xjOsevRzRRRS4F1FQ==', NULL, NULL);
INSERT INTO public.users VALUES (66, 'tracio', NULL, NULL, 'BQkYYUjsi2bM4MtCXTXEUg==', NULL, NULL);
INSERT INTO public.users VALUES (54, 'pala', NULL, NULL, 'TeGtJ4otuSs88lN1KZsEtg==', NULL, NULL);
INSERT INTO public.users VALUES (51, 'buserana1', NULL, NULL, 'jmTdItEusOi+z8W+cfXL4A==', NULL, NULL);
INSERT INTO public.users VALUES (62, 'saladita', NULL, NULL, 'LxNXxFzMxadcFvMTV4Qf5g==', NULL, NULL);
INSERT INTO public.users VALUES (70, 'conde', NULL, NULL, 'xzZlPNT8hpNfNBRPvwn/qw==', NULL, NULL);


--
-- TOC entry 2958 (class 0 OID 205160)
-- Dependencies: 205
-- Data for Name: users_profiles_map; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_profiles_map VALUES (1, 1);
INSERT INTO public.users_profiles_map VALUES (2, 2);
INSERT INTO public.users_profiles_map VALUES (46, 3);
INSERT INTO public.users_profiles_map VALUES (47, 3);
INSERT INTO public.users_profiles_map VALUES (48, 3);
INSERT INTO public.users_profiles_map VALUES (49, 3);
INSERT INTO public.users_profiles_map VALUES (50, 3);
INSERT INTO public.users_profiles_map VALUES (51, 3);
INSERT INTO public.users_profiles_map VALUES (52, 3);
INSERT INTO public.users_profiles_map VALUES (53, 3);
INSERT INTO public.users_profiles_map VALUES (54, 3);
INSERT INTO public.users_profiles_map VALUES (55, 3);
INSERT INTO public.users_profiles_map VALUES (56, 3);
INSERT INTO public.users_profiles_map VALUES (57, 3);
INSERT INTO public.users_profiles_map VALUES (58, 3);
INSERT INTO public.users_profiles_map VALUES (59, 3);
INSERT INTO public.users_profiles_map VALUES (60, 3);
INSERT INTO public.users_profiles_map VALUES (61, 3);
INSERT INTO public.users_profiles_map VALUES (62, 3);
INSERT INTO public.users_profiles_map VALUES (63, 3);
INSERT INTO public.users_profiles_map VALUES (64, 3);
INSERT INTO public.users_profiles_map VALUES (65, 3);
INSERT INTO public.users_profiles_map VALUES (66, 3);
INSERT INTO public.users_profiles_map VALUES (70, 3);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 196
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contacts_id_seq', 85, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 198
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profiles_id_seq', 5, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 201
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 5, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 70, true);


--
-- TOC entry 2810 (class 2606 OID 205123)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 205134)
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 205148)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 205168)
-- Name: sections uk_3hhqmvx0pt70xjvmjdo5a76go; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT uk_3hhqmvx0pt70xjvmjdo5a76go UNIQUE (alias);


--
-- TOC entry 2818 (class 2606 OID 205170)
-- Name: users uk_ow0gan20590jrb00upg3va2fn; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_ow0gan20590jrb00upg3va2fn UNIQUE (login);


--
-- TOC entry 2820 (class 2606 OID 205159)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 205164)
-- Name: users_profiles_map users_profiles_map_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_profiles_map
    ADD CONSTRAINT users_profiles_map_pkey PRIMARY KEY (user_id, profile_id);


--
-- TOC entry 2823 (class 2606 OID 205806)
-- Name: contacts fk69f21wxfjm7u5pyf6t4j76lgx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk69f21wxfjm7u5pyf6t4j76lgx FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 2827 (class 2606 OID 205186)
-- Name: users_profiles_map fkgu8qveimyui706fn78n4xbenf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_profiles_map
    ADD CONSTRAINT fkgu8qveimyui706fn78n4xbenf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2824 (class 2606 OID 205171)
-- Name: profiles_sections_map fkkqferkfgrrnho62b21rya9ej9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles_sections_map
    ADD CONSTRAINT fkkqferkfgrrnho62b21rya9ej9 FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 2825 (class 2606 OID 205176)
-- Name: profiles_sections_map fknbjkd2pgwcyijblewp1d33rox; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles_sections_map
    ADD CONSTRAINT fknbjkd2pgwcyijblewp1d33rox FOREIGN KEY (profile_id) REFERENCES public.profiles(id);


--
-- TOC entry 2826 (class 2606 OID 205181)
-- Name: users_profiles_map fksv94wyv9yb3b2hmvr5f48o281; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_profiles_map
    ADD CONSTRAINT fksv94wyv9yb3b2hmvr5f48o281 FOREIGN KEY (profile_id) REFERENCES public.profiles(id);


-- Completed on 2023-02-02 11:00:17

--
-- PostgreSQL database dump complete
--

