--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-14 01:32:18 EST

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16500)
-- Name: dcr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dcr (
    dcrid integer NOT NULL,
    sales integer NOT NULL
);


ALTER TABLE public.dcr OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16499)
-- Name: dcr_dcrid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dcr_dcrid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcr_dcrid_seq OWNER TO postgres;

--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 221
-- Name: dcr_dcrid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dcr_dcrid_seq OWNED BY public.dcr.dcrid;


--
-- TOC entry 224 (class 1259 OID 16507)
-- Name: deposit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposit (
    depid integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public.deposit OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16506)
-- Name: deposit_depid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposit_depid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposit_depid_seq OWNER TO postgres;

--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 223
-- Name: deposit_depid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposit_depid_seq OWNED BY public.deposit.depid;


--
-- TOC entry 238 (class 1259 OID 16579)
-- Name: deposits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deposits (
    eid integer NOT NULL,
    depid integer NOT NULL,
    datedeposited timestamp without time zone NOT NULL
);


ALTER TABLE public.deposits OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16578)
-- Name: deposits_depid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposits_depid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposits_depid_seq OWNER TO postgres;

--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 237
-- Name: deposits_depid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposits_depid_seq OWNED BY public.deposits.depid;


--
-- TOC entry 236 (class 1259 OID 16577)
-- Name: deposits_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deposits_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposits_eid_seq OWNER TO postgres;

--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 236
-- Name: deposits_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deposits_eid_seq OWNED BY public.deposits.eid;


--
-- TOC entry 218 (class 1259 OID 16486)
-- Name: drawerverif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drawerverif (
    verifid integer NOT NULL,
    reg integer NOT NULL,
    curramount integer NOT NULL,
    enteredamount integer NOT NULL,
    overshort integer NOT NULL
);


ALTER TABLE public.drawerverif OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16485)
-- Name: drawerverif_verifid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drawerverif_verifid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drawerverif_verifid_seq OWNER TO postgres;

--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 217
-- Name: drawerverif_verifid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drawerverif_verifid_seq OWNED BY public.drawerverif.verifid;


--
-- TOC entry 216 (class 1259 OID 16479)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    eid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    ssn integer NOT NULL,
    pos character varying(50) NOT NULL,
    status boolean NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16478)
-- Name: employee_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_eid_seq OWNER TO postgres;

--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 215
-- Name: employee_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_eid_seq OWNED BY public.employee.eid;


--
-- TOC entry 220 (class 1259 OID 16493)
-- Name: imprestverif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imprestverif (
    impid integer NOT NULL,
    ones integer NOT NULL,
    fives integer NOT NULL,
    tens integer NOT NULL,
    twenties integer NOT NULL,
    fifties integer NOT NULL,
    hundreds integer NOT NULL,
    pennies numeric(3,1) NOT NULL,
    nickels integer NOT NULL,
    dimes integer NOT NULL,
    quarters integer NOT NULL
);


ALTER TABLE public.imprestverif OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16492)
-- Name: imprestverif_impid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imprestverif_impid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imprestverif_impid_seq OWNER TO postgres;

--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 219
-- Name: imprestverif_impid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imprestverif_impid_seq OWNED BY public.imprestverif.impid;


--
-- TOC entry 226 (class 1259 OID 16518)
-- Name: nonotc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nonotc (
    upcn bigint NOT NULL,
    item integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.nonotc OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16662)
-- Name: nonotcoperations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nonotcoperations (
    upcn bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.nonotcoperations OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16707)
-- Name: nonotcprice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nonotcprice (
    upcn bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.nonotcprice OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16616)
-- Name: operates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operates (
    eid integer NOT NULL,
    upcop bigint NOT NULL,
    dateoperated timestamp without time zone NOT NULL
);


ALTER TABLE public.operates OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16615)
-- Name: operates_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operates_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operates_eid_seq OWNER TO postgres;

--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 242
-- Name: operates_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operates_eid_seq OWNED BY public.operates.eid;


--
-- TOC entry 229 (class 1259 OID 16534)
-- Name: operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operations (
    upcop bigint NOT NULL,
    boh integer NOT NULL,
    shelfcap integer NOT NULL,
    quickpick integer NOT NULL
);


ALTER TABLE public.operations OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16513)
-- Name: otc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otc (
    upco bigint NOT NULL,
    item integer NOT NULL,
    otcname character varying(100) NOT NULL,
    otcid character varying(50) NOT NULL
);


ALTER TABLE public.otc OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16647)
-- Name: otcoperations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otcoperations (
    upco bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.otcoperations OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16692)
-- Name: otcprice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otcprice (
    upco bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.otcprice OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16598)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    eid integer NOT NULL,
    dcrid integer NOT NULL,
    dateposted timestamp without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16597)
-- Name: posts_dcrid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_dcrid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_dcrid_seq OWNER TO postgres;

--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 240
-- Name: posts_dcrid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_dcrid_seq OWNED BY public.posts.dcrid;


--
-- TOC entry 239 (class 1259 OID 16596)
-- Name: posts_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_eid_seq OWNER TO postgres;

--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 239
-- Name: posts_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_eid_seq OWNED BY public.posts.eid;


--
-- TOC entry 244 (class 1259 OID 16632)
-- Name: prescriptionoperations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptionoperations (
    upcp bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.prescriptionoperations OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16677)
-- Name: prescriptionprice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptionprice (
    upcp bigint NOT NULL,
    upcop bigint NOT NULL,
    dateupdated timestamp without time zone NOT NULL
);


ALTER TABLE public.prescriptionprice OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16523)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    upcp bigint NOT NULL,
    prescriptionname character varying(100) NOT NULL,
    expiration date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16529)
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    upc bigint NOT NULL,
    retailp integer NOT NULL,
    salep integer NOT NULL,
    mumd integer NOT NULL
);


ALTER TABLE public.price OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16541)
-- Name: verifysdrawer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verifysdrawer (
    eid integer NOT NULL,
    verifid integer NOT NULL,
    dateverifieddrawer timestamp without time zone NOT NULL
);


ALTER TABLE public.verifysdrawer OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16539)
-- Name: verifysdrawer_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verifysdrawer_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verifysdrawer_eid_seq OWNER TO postgres;

--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 230
-- Name: verifysdrawer_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verifysdrawer_eid_seq OWNED BY public.verifysdrawer.eid;


--
-- TOC entry 231 (class 1259 OID 16540)
-- Name: verifysdrawer_verifid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verifysdrawer_verifid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verifysdrawer_verifid_seq OWNER TO postgres;

--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 231
-- Name: verifysdrawer_verifid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verifysdrawer_verifid_seq OWNED BY public.verifysdrawer.verifid;


--
-- TOC entry 235 (class 1259 OID 16560)
-- Name: verifysimprest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verifysimprest (
    eid integer NOT NULL,
    impid integer NOT NULL,
    dateverifiedimprest timestamp without time zone NOT NULL
);


ALTER TABLE public.verifysimprest OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16558)
-- Name: verifysimprest_eid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verifysimprest_eid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verifysimprest_eid_seq OWNER TO postgres;

--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 233
-- Name: verifysimprest_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verifysimprest_eid_seq OWNED BY public.verifysimprest.eid;


--
-- TOC entry 234 (class 1259 OID 16559)
-- Name: verifysimprest_impid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.verifysimprest_impid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.verifysimprest_impid_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 234
-- Name: verifysimprest_impid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.verifysimprest_impid_seq OWNED BY public.verifysimprest.impid;


--
-- TOC entry 3536 (class 2604 OID 16503)
-- Name: dcr dcrid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dcr ALTER COLUMN dcrid SET DEFAULT nextval('public.dcr_dcrid_seq'::regclass);


--
-- TOC entry 3537 (class 2604 OID 16510)
-- Name: deposit depid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit ALTER COLUMN depid SET DEFAULT nextval('public.deposit_depid_seq'::regclass);


--
-- TOC entry 3543 (class 2604 OID 16582)
-- Name: deposits eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits ALTER COLUMN eid SET DEFAULT nextval('public.deposits_eid_seq'::regclass);


--
-- TOC entry 3544 (class 2604 OID 16583)
-- Name: deposits depid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits ALTER COLUMN depid SET DEFAULT nextval('public.deposits_depid_seq'::regclass);


--
-- TOC entry 3534 (class 2604 OID 16489)
-- Name: drawerverif verifid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawerverif ALTER COLUMN verifid SET DEFAULT nextval('public.drawerverif_verifid_seq'::regclass);


--
-- TOC entry 3533 (class 2604 OID 16482)
-- Name: employee eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN eid SET DEFAULT nextval('public.employee_eid_seq'::regclass);


--
-- TOC entry 3535 (class 2604 OID 16496)
-- Name: imprestverif impid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imprestverif ALTER COLUMN impid SET DEFAULT nextval('public.imprestverif_impid_seq'::regclass);


--
-- TOC entry 3547 (class 2604 OID 16619)
-- Name: operates eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operates ALTER COLUMN eid SET DEFAULT nextval('public.operates_eid_seq'::regclass);


--
-- TOC entry 3545 (class 2604 OID 16601)
-- Name: posts eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN eid SET DEFAULT nextval('public.posts_eid_seq'::regclass);


--
-- TOC entry 3546 (class 2604 OID 16602)
-- Name: posts dcrid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN dcrid SET DEFAULT nextval('public.posts_dcrid_seq'::regclass);


--
-- TOC entry 3539 (class 2604 OID 16544)
-- Name: verifysdrawer eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysdrawer ALTER COLUMN eid SET DEFAULT nextval('public.verifysdrawer_eid_seq'::regclass);


--
-- TOC entry 3540 (class 2604 OID 16545)
-- Name: verifysdrawer verifid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysdrawer ALTER COLUMN verifid SET DEFAULT nextval('public.verifysdrawer_verifid_seq'::regclass);


--
-- TOC entry 3541 (class 2604 OID 16563)
-- Name: verifysimprest eid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysimprest ALTER COLUMN eid SET DEFAULT nextval('public.verifysimprest_eid_seq'::regclass);


--
-- TOC entry 3542 (class 2604 OID 16564)
-- Name: verifysimprest impid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysimprest ALTER COLUMN impid SET DEFAULT nextval('public.verifysimprest_impid_seq'::regclass);


--
-- TOC entry 3555 (class 2606 OID 16505)
-- Name: dcr dcr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dcr
    ADD CONSTRAINT dcr_pkey PRIMARY KEY (dcrid);


--
-- TOC entry 3557 (class 2606 OID 16512)
-- Name: deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (depid);


--
-- TOC entry 3573 (class 2606 OID 16585)
-- Name: deposits deposits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_pkey PRIMARY KEY (eid, depid);


--
-- TOC entry 3551 (class 2606 OID 16491)
-- Name: drawerverif drawerverif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drawerverif
    ADD CONSTRAINT drawerverif_pkey PRIMARY KEY (verifid);


--
-- TOC entry 3549 (class 2606 OID 16484)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (eid);


--
-- TOC entry 3553 (class 2606 OID 16498)
-- Name: imprestverif imprestverif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imprestverif
    ADD CONSTRAINT imprestverif_pkey PRIMARY KEY (impid);


--
-- TOC entry 3561 (class 2606 OID 16522)
-- Name: nonotc nonotc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotc
    ADD CONSTRAINT nonotc_pkey PRIMARY KEY (upcn);


--
-- TOC entry 3583 (class 2606 OID 16666)
-- Name: nonotcoperations nonotcoperations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcoperations
    ADD CONSTRAINT nonotcoperations_pkey PRIMARY KEY (upcn, upcop);


--
-- TOC entry 3589 (class 2606 OID 16711)
-- Name: nonotcprice nonotcprice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcprice
    ADD CONSTRAINT nonotcprice_pkey PRIMARY KEY (upcn, upcop);


--
-- TOC entry 3577 (class 2606 OID 16621)
-- Name: operates operates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operates
    ADD CONSTRAINT operates_pkey PRIMARY KEY (eid, upcop);


--
-- TOC entry 3567 (class 2606 OID 16538)
-- Name: operations operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operations
    ADD CONSTRAINT operations_pkey PRIMARY KEY (upcop);


--
-- TOC entry 3559 (class 2606 OID 16517)
-- Name: otc otc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otc
    ADD CONSTRAINT otc_pkey PRIMARY KEY (upco);


--
-- TOC entry 3581 (class 2606 OID 16651)
-- Name: otcoperations otcoperations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcoperations
    ADD CONSTRAINT otcoperations_pkey PRIMARY KEY (upco, upcop);


--
-- TOC entry 3587 (class 2606 OID 16696)
-- Name: otcprice otcprice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcprice
    ADD CONSTRAINT otcprice_pkey PRIMARY KEY (upco, upcop);


--
-- TOC entry 3575 (class 2606 OID 16604)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (eid, dcrid);


--
-- TOC entry 3579 (class 2606 OID 16636)
-- Name: prescriptionoperations prescriptionoperations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionoperations
    ADD CONSTRAINT prescriptionoperations_pkey PRIMARY KEY (upcp, upcop);


--
-- TOC entry 3585 (class 2606 OID 16681)
-- Name: prescriptionprice prescriptionprice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionprice
    ADD CONSTRAINT prescriptionprice_pkey PRIMARY KEY (upcp, upcop);


--
-- TOC entry 3563 (class 2606 OID 16528)
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (upcp);


--
-- TOC entry 3565 (class 2606 OID 16533)
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (upc);


--
-- TOC entry 3569 (class 2606 OID 16547)
-- Name: verifysdrawer verifysdrawer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysdrawer
    ADD CONSTRAINT verifysdrawer_pkey PRIMARY KEY (eid, verifid);


--
-- TOC entry 3571 (class 2606 OID 16566)
-- Name: verifysimprest verifysimprest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysimprest
    ADD CONSTRAINT verifysimprest_pkey PRIMARY KEY (eid, impid);


--
-- TOC entry 3594 (class 2606 OID 16591)
-- Name: deposits deposits_depid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_depid_fkey FOREIGN KEY (depid) REFERENCES public.deposit(depid);


--
-- TOC entry 3595 (class 2606 OID 16586)
-- Name: deposits deposits_eid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_eid_fkey FOREIGN KEY (eid) REFERENCES public.employee(eid);


--
-- TOC entry 3604 (class 2606 OID 16667)
-- Name: nonotcoperations nonotcoperations_upcn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcoperations
    ADD CONSTRAINT nonotcoperations_upcn_fkey FOREIGN KEY (upcn) REFERENCES public.nonotc(upcn);


--
-- TOC entry 3605 (class 2606 OID 16672)
-- Name: nonotcoperations nonotcoperations_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcoperations
    ADD CONSTRAINT nonotcoperations_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3610 (class 2606 OID 16712)
-- Name: nonotcprice nonotcprice_upcn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcprice
    ADD CONSTRAINT nonotcprice_upcn_fkey FOREIGN KEY (upcn) REFERENCES public.nonotc(upcn);


--
-- TOC entry 3611 (class 2606 OID 16717)
-- Name: nonotcprice nonotcprice_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nonotcprice
    ADD CONSTRAINT nonotcprice_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3598 (class 2606 OID 16622)
-- Name: operates operates_eid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operates
    ADD CONSTRAINT operates_eid_fkey FOREIGN KEY (eid) REFERENCES public.employee(eid);


--
-- TOC entry 3599 (class 2606 OID 16627)
-- Name: operates operates_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operates
    ADD CONSTRAINT operates_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3602 (class 2606 OID 16652)
-- Name: otcoperations otcoperations_upco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcoperations
    ADD CONSTRAINT otcoperations_upco_fkey FOREIGN KEY (upco) REFERENCES public.otc(upco);


--
-- TOC entry 3603 (class 2606 OID 16657)
-- Name: otcoperations otcoperations_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcoperations
    ADD CONSTRAINT otcoperations_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3608 (class 2606 OID 16697)
-- Name: otcprice otcprice_upco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcprice
    ADD CONSTRAINT otcprice_upco_fkey FOREIGN KEY (upco) REFERENCES public.otc(upco);


--
-- TOC entry 3609 (class 2606 OID 16702)
-- Name: otcprice otcprice_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otcprice
    ADD CONSTRAINT otcprice_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3596 (class 2606 OID 16610)
-- Name: posts posts_dcrid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_dcrid_fkey FOREIGN KEY (dcrid) REFERENCES public.dcr(dcrid);


--
-- TOC entry 3597 (class 2606 OID 16605)
-- Name: posts posts_eid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_eid_fkey FOREIGN KEY (eid) REFERENCES public.employee(eid);


--
-- TOC entry 3600 (class 2606 OID 16642)
-- Name: prescriptionoperations prescriptionoperations_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionoperations
    ADD CONSTRAINT prescriptionoperations_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3601 (class 2606 OID 16637)
-- Name: prescriptionoperations prescriptionoperations_upcp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionoperations
    ADD CONSTRAINT prescriptionoperations_upcp_fkey FOREIGN KEY (upcp) REFERENCES public.prescriptions(upcp);


--
-- TOC entry 3606 (class 2606 OID 16687)
-- Name: prescriptionprice prescriptionprice_upcop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionprice
    ADD CONSTRAINT prescriptionprice_upcop_fkey FOREIGN KEY (upcop) REFERENCES public.operations(upcop);


--
-- TOC entry 3607 (class 2606 OID 16682)
-- Name: prescriptionprice prescriptionprice_upcp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptionprice
    ADD CONSTRAINT prescriptionprice_upcp_fkey FOREIGN KEY (upcp) REFERENCES public.prescriptions(upcp);


--
-- TOC entry 3590 (class 2606 OID 16548)
-- Name: verifysdrawer verifysdrawer_eid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysdrawer
    ADD CONSTRAINT verifysdrawer_eid_fkey FOREIGN KEY (eid) REFERENCES public.employee(eid);


--
-- TOC entry 3591 (class 2606 OID 16553)
-- Name: verifysdrawer verifysdrawer_verifid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysdrawer
    ADD CONSTRAINT verifysdrawer_verifid_fkey FOREIGN KEY (verifid) REFERENCES public.drawerverif(verifid);


--
-- TOC entry 3592 (class 2606 OID 16567)
-- Name: verifysimprest verifysimprest_eid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysimprest
    ADD CONSTRAINT verifysimprest_eid_fkey FOREIGN KEY (eid) REFERENCES public.employee(eid);


--
-- TOC entry 3593 (class 2606 OID 16572)
-- Name: verifysimprest verifysimprest_impid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifysimprest
    ADD CONSTRAINT verifysimprest_impid_fkey FOREIGN KEY (impid) REFERENCES public.imprestverif(impid);


-- Completed on 2022-11-14 01:32:19 EST

--
-- PostgreSQL database dump complete
--

