--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2018-01-10 16:35:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2199 (class 1262 OID 12292)
-- Dependencies: 2198
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2201 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 216 (class 1255 OID 16401)
-- Name: generate_data(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION generate_data(rows integer) RETURNS void
    LANGUAGE plpgsql
    AS $$ 
BEGIN DELETE FROM user_log; 
FOR i IN 1 .. rows 
LOOP 
INSERT INTO user_log 
VALUES ( i, md5(random() :: TEXT), md5(random() :: TEXT), clock_timestamp(), md5(random() :: TEXT) || md5(random() :: TEXT) ); 
END LOOP; 
END $$;


ALTER FUNCTION public.generate_data(rows integer) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 16426)
-- Name: partition_for_user_log(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION partition_for_user_log() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$ 
DECLARE v_parition_name TEXT; 
BEGIN 
v_parition_name := format('user_log_%s', 1 + NEW.id % 4); 
EXECUTE 'INSERT INTO ' || v_parition_name || ' VALUES ( ($1).* )' 
USING NEW; 
RETURN NULL; 
END; 
$_$;


ALTER FUNCTION public.partition_for_user_log() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16384)
-- Name: Staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Staff" (
    id_worker integer NOT NULL,
    "FIO" character varying
);


ALTER TABLE "Staff" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16394)
-- Name: user_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_log (
    id integer NOT NULL,
    name character varying(32),
    account_type character varying(32),
    "time" timestamp without time zone,
    query character varying(256)
);


ALTER TABLE user_log OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16392)
-- Name: user_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_log_id_seq OWNER TO postgres;

--
-- TOC entry 2202 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_log_id_seq OWNED BY user_log.id;


--
-- TOC entry 199 (class 1259 OID 16402)
-- Name: user_log_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_log_1 (
    id integer DEFAULT nextval('user_log_id_seq'::regclass),
    name character varying(32),
    account_type character varying(32),
    "time" timestamp without time zone,
    query character varying(256)
)
INHERITS (user_log);


ALTER TABLE user_log_1 OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16408)
-- Name: user_log_2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_log_2 (
    id integer DEFAULT nextval('user_log_id_seq'::regclass),
    name character varying(32),
    account_type character varying(32),
    "time" timestamp without time zone,
    query character varying(256)
)
INHERITS (user_log);


ALTER TABLE user_log_2 OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16414)
-- Name: user_log_3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_log_3 (
    id integer DEFAULT nextval('user_log_id_seq'::regclass),
    name character varying(32),
    account_type character varying(32),
    "time" timestamp without time zone,
    query character varying(256)
)
INHERITS (user_log);


ALTER TABLE user_log_3 OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16420)
-- Name: user_log_4; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_log_4 (
    id integer DEFAULT nextval('user_log_id_seq'::regclass),
    name character varying(32),
    account_type character varying(32),
    "time" timestamp without time zone,
    query character varying(256)
)
INHERITS (user_log);


ALTER TABLE user_log_4 OWNER TO postgres;

--
-- TOC entry 2047 (class 2604 OID 16397)
-- Name: user_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log ALTER COLUMN id SET DEFAULT nextval('user_log_id_seq'::regclass);


--
-- TOC entry 2187 (class 0 OID 16384)
-- Dependencies: 196
-- Data for Name: Staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Staff" (id_worker, "FIO") FROM stdin;
1	Иванов Иван Иванович
2	Касаткина Юлия Владимировна
3	Кипятков Олег Викторович
4	Родина Тамара Семеновна
5	Кривенко Римма Риммовна
\.


--
-- TOC entry 2189 (class 0 OID 16394)
-- Dependencies: 198
-- Data for Name: user_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log (id, name, account_type, "time", query) FROM stdin;
\.


--
-- TOC entry 2190 (class 0 OID 16402)
-- Dependencies: 199
-- Data for Name: user_log_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log_1 (id, name, account_type, "time", query) FROM stdin;
4	e2cbc34a1450b87fe43b66431d68c180	c9f111aa1fefadd036138d062e0120b9	2017-12-27 11:19:44.005937	2fa239465c322996d0ab0494de845c9c9a99a86eeefb3c690e55e95d524cd6ae
8	66090bd4a51c8a9b3ed04528f587cd57	932087c0745fadb8f3444faea7a8c1dc	2017-12-27 11:19:44.145938	004d26251f5d87de04f20f387a41de73858ce703e4cc8bf5b810687dbadf53d1
\.


--
-- TOC entry 2191 (class 0 OID 16408)
-- Dependencies: 200
-- Data for Name: user_log_2; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log_2 (id, name, account_type, "time", query) FROM stdin;
1	85e8a6e721dfa61e438a1864d473fb41	b16a01ea953ece3fb8ac9be07e0f5e9f	2017-12-27 11:19:43.525932	1b800fa0c02a22ce30f2baf7d70df00135b982642907e24088d8de20bfe350bc
5	e00493a90e8d1b1f188e6a11ddee5555	a4aef5c4fe09b48cad26b98f0f8b8638	2017-12-27 11:19:44.145938	ad943834c083aee2ac9325f9b6393c782260d5cd7d367736a94a17decb915ce9
9	36fef6efca6ed9129ede1bb288d6f18b	314f97ef1fee4ded0ed0ee72174e03e8	2017-12-27 11:19:44.145938	7bf4b23bf837d3fd59ef3df9aa0522afbeec720d2c128dda08baa63cb7b7b0a5
\.


--
-- TOC entry 2192 (class 0 OID 16414)
-- Dependencies: 201
-- Data for Name: user_log_3; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log_3 (id, name, account_type, "time", query) FROM stdin;
2	a276af4f61056c49af24d0e5c01f56c0	b81930a7d31f5c93f713bfc3bf64fc10	2017-12-27 11:19:43.755935	c40a70c73f45a9e033b402c9df52c38296cd16a50099522acfc1973a50adebb9
6	0e0012971d945cec6924af6e7ed25bbe	83fc486aa1497a5ade0f5277f170bec1	2017-12-27 11:19:44.145938	800d05ac88b001ed2debc68ec5cec3c4f550357b97fbffaa513afcc8297e0e82
10	5c04deeeec8e181289a9875b803172e1	0b4d375ee1b60ffe6ecd3db49faa6c57	2017-12-27 11:19:44.145938	e254dd590af92ba55b4378d64247dca1bc5ee15c2aa4376def8d40164423e82f
\.


--
-- TOC entry 2193 (class 0 OID 16420)
-- Dependencies: 202
-- Data for Name: user_log_4; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_log_4 (id, name, account_type, "time", query) FROM stdin;
3	34d6aec5ac6a4d181c7aa8a22de5d10b	f5530baeb47f5a506eb25140463b7f7e	2017-12-27 11:19:43.895935	b13a76e25f337920a3a4a95e5e4158a1a118f7df3dedca86e6465ee745777c80
7	9e0762074150efe947e9923cf9bc4607	bf3fa4006bb7cfd75a086eaa73d50f39	2017-12-27 11:19:44.145938	461bb6aecbc24103c8d80d10db3ae8fe7f01b6b9f87413f4365440118b6e87aa
\.


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 197
-- Name: user_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_log_id_seq', 1, false);


--
-- TOC entry 2053 (class 2606 OID 16391)
-- Name: Staff id_worker_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Staff"
    ADD CONSTRAINT id_worker_pk PRIMARY KEY (id_worker);


--
-- TOC entry 2058 (class 2606 OID 16407)
-- Name: user_log_1 user_log_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log_1
    ADD CONSTRAINT user_log_1_pkey PRIMARY KEY (id);


--
-- TOC entry 2060 (class 2606 OID 16413)
-- Name: user_log_2 user_log_2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log_2
    ADD CONSTRAINT user_log_2_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 2606 OID 16419)
-- Name: user_log_3 user_log_3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log_3
    ADD CONSTRAINT user_log_3_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 16425)
-- Name: user_log_4 user_log_4_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log_4
    ADD CONSTRAINT user_log_4_pkey PRIMARY KEY (id);


--
-- TOC entry 2056 (class 2606 OID 16399)
-- Name: user_log user_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_log
    ADD CONSTRAINT user_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2054 (class 1259 OID 16400)
-- Name: log_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX log_user_id ON user_log USING btree (id);


--
-- TOC entry 2065 (class 2620 OID 16427)
-- Name: user_log partition_users; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER partition_users BEFORE INSERT ON user_log FOR EACH ROW EXECUTE PROCEDURE partition_for_user_log();


-- Completed on 2018-01-10 16:35:47

--
-- PostgreSQL database dump complete
--

