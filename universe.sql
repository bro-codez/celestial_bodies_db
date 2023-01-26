--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    date_discovered date NOT NULL,
    description text,
    distance_in_ly integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    date_discovered date,
    distance_in_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    mean_radius_km integer NOT NULL,
    distance_from_earth_km numeric(6,4) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    radius_in_km integer NOT NULL,
    distance_in_km integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    date_discovered date,
    distance_in_ly integer,
    is_dead boolean,
    is_dwarf boolean,
    solar_mass numeric(10,4),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'V Puppis', '2000-01-01', 'Probable trinary system, composed of a binary with orbit t=1.4544859 d, black hole orbits binary with orbit t=5.47 yr', 960);
INSERT INTO public.blackhole VALUES (2, 'Gaia BH1 (TIC 125470397)', '2022-01-01', 'Binary system with orbit t=185.63 d and eccentricity e=0.45[7]', 155);
INSERT INTO public.blackhole VALUES (3, 'A0620-00 (V616 Mon)', '1986-01-01', 'Binary star system with orbit t=7.75 h', 3000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'disk-shaped', '1610-04-01', 100);
INSERT INTO public.galaxy VALUES (2, 'Bodes Galaxy', 'spiral', '1774-12-31', 12000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'spiral', '1200-12-31', 200000);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'round', '1779-06-20', 400000);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'lenticular', '2020-04-12', 500000);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 'ring', '1950-10-10', 960000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, 93.4400);
INSERT INTO public.moon VALUES (2, 'Earth_Trojan', 1, 1737, 93.4400);
INSERT INTO public.moon VALUES (3, 'Earth_Crosser', 1, 1737, 93.4400);
INSERT INTO public.moon VALUES (4, 'Earth_Quasi', 1, 1737, 93.4400);
INSERT INTO public.moon VALUES (5, 'Apophis', 1, 1737, 93.4400);
INSERT INTO public.moon VALUES (6, 'Deimos', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (7, 'Phobos', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (8, 'Mars Trojan', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (9, 'Mars Crossing', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (10, 'Ceres', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (11, 'Pallas', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (12, 'Vesta', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (13, 'Hygiea', 4, 1737, 93.4400);
INSERT INTO public.moon VALUES (14, 'Io', 5, 1737, 93.4400);
INSERT INTO public.moon VALUES (15, 'Europa', 5, 1737, 93.4400);
INSERT INTO public.moon VALUES (16, 'Ganymede', 5, 1737, 93.4400);
INSERT INTO public.moon VALUES (17, 'Callisto', 5, 1737, 93.4400);
INSERT INTO public.moon VALUES (18, 'Jupiter Trojan', 5, 1737, 93.4400);
INSERT INTO public.moon VALUES (19, 'Mimas', 6, 1737, 93.4400);
INSERT INTO public.moon VALUES (20, 'Enceladus', 6, 1737, 93.4400);
INSERT INTO public.moon VALUES (21, 'Tethys', 6, 1737, 93.4400);
INSERT INTO public.moon VALUES (22, 'Dione', 6, 1737, 93.4400);
INSERT INTO public.moon VALUES (23, 'Rhea', 6, 1737, 93.4400);
INSERT INTO public.moon VALUES (24, 'Titan', 6, 1737, 93.4400);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, 10000);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 2439, 78000);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 243988, 78000);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2436698, 9800089);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4564366, 56700089);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 4564366, 56700089);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4564366, 56700089);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1664366, 370089);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 1664366, 370089);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, 1664366, 370089);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, 1664366, 370089);
INSERT INTO public.planet VALUES (12, 'Sedna', 1, 1664366, 370089);
INSERT INTO public.planet VALUES (13, 'Haumea', 1, 1664366, 370089);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', '0001-01-01', 8, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'UY Scuti', 'Strange Giant', '1998-10-21', 5219, true, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'VY Canis Majoris', 'Light bender', '1960-06-04', 39000, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'RW Cephei', 'Phantom fire', '1990-08-30', 35000, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'KW Sagittarii', 'Fearless Fighter', '1920-02-12', 78000, true, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'Chewing gum', '1999-12-19', 643, false, NULL, NULL, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

