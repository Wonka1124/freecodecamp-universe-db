--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    has_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    temperature integer,
    has_water boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    population integer,
    moon_count integer,
    description text
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    average_mass integer,
    is_habitable boolean
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    temperature integer NOT NULL,
    mass integer,
    is_visible boolean NOT NULL,
    distance_from_earth numeric,
    description text
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 13600, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy', true, 10000, 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in Local Group', true, 12000, 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Looks like a sombrero hat', false, 9000, 29350000, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Famous for spiral structure', true, 500, 23160000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', true, 13000, 20870000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 4500, 0.00038, 25, true, 'Earth''s natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 4500, 0.000005, -100, false, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 4500, 0.00002, -100, false, 'Smaller Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 4, true, 4500, 0.00042, -130, false, 'Most volcanically active body');
INSERT INTO public.moon VALUES (5, 'Europa', 4, true, 4500, 0.00042, -160, true, 'May have subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, true, 4500, 0.00042, -160, true, 'Largest moon in Solar System');
INSERT INTO public.moon VALUES (7, 'Callisto', 4, true, 4500, 0.00042, -140, true, 'Heavily cratered');
INSERT INTO public.moon VALUES (8, 'Titan', 5, true, 4500, 0.0012, -180, true, 'Only moon with dense atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, true, 4000, 0.0012, -200, true, 'Cryovolcanoes');
INSERT INTO public.moon VALUES (10, 'Triton', 11, true, 4500, 0.03, -235, true, 'Largest Neptune moon');
INSERT INTO public.moon VALUES (11, 'Charon', 12, true, 4000, 0.04, -220, true, 'Pluto''s moon');
INSERT INTO public.moon VALUES (12, 'Rhea', 5, true, 4500, 0.0012, -175, false, 'Second-largest Saturn moon');
INSERT INTO public.moon VALUES (13, 'Iapetus', 5, true, 4500, 0.0012, -140, false, 'Two-toned surface');
INSERT INTO public.moon VALUES (14, 'Dione', 5, true, 4500, 0.0012, -180, true, 'Icy surface');
INSERT INTO public.moon VALUES (15, 'Tethys', 5, true, 4500, 0.0012, -185, true, 'Highly reflective');
INSERT INTO public.moon VALUES (16, 'Hyperion', 5, false, 4500, 0.0012, -180, false, 'Irregular shape');
INSERT INTO public.moon VALUES (17, 'Miranda', 11, true, 4500, 0.03, -170, true, 'Uranian moon');
INSERT INTO public.moon VALUES (18, 'Ariel', 11, true, 4500, 0.03, -200, true, 'Smooth icy surface');
INSERT INTO public.moon VALUES (19, 'Umbriel', 11, true, 4500, 0.03, -200, false, 'Dark moon');
INSERT INTO public.moon VALUES (20, 'Oberon', 11, true, 4500, 0.03, -200, false, 'Outermost large Uranian moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 4540, 0, NULL, 1, 'Our home planet');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 4600, 0.00014, 0, 2, 'The Red Planet');
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, true, 4500, 0.00016, 0, 0, 'Hottest planet');
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, true, 4600, 0.00059, 0, 95, 'Largest planet');
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, true, 4500, 0.0012, 0, 146, 'Planet with rings');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, true, 4500, 0.00005, 0, 0, 'Smallest planet');
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, false, true, 3500, 600, 0, 0, 'First habitable zone exoplanet');
INSERT INTO public.planet VALUES (8, 'Proxima b', 3, false, true, 4850, 4.2, 0, 0, 'Potentially habitable exoplanet');
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 4, false, true, 5000, 159, 0, 0, 'Gas giant with evaporating atmosphere');
INSERT INTO public.planet VALUES (10, 'Gliese 581c', 5, false, true, 7000, 20.4, 0, 0, 'Super-Earth');
INSERT INTO public.planet VALUES (11, 'WASP-17b', 6, false, true, 1300, 1370, 0, 0, 'Hot Jupiter');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, false, true, 7000, 39.5, 0, 0, 'Potentially habitable');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky surface', 5, true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large with gaseous composition', 1000, false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Composed of ice and gas', 800, false);
INSERT INTO public.planet_type VALUES (4, 'Ocean', 'Surface covered in water', 6, true);
INSERT INTO public.planet_type VALUES (5, 'Desert', 'Dry rocky surface', 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1, true, 0, 'Our solar system''s star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 2, true, 8.6, 'Brightest star in night sky');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, 1, true, 4.3, 'Nearest binary star system');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, 11, true, 643, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Vega', 1, 9600, 2, true, 25, 'One of brightest stars');
INSERT INTO public.star VALUES (6, 'Polaris', 1, 6000, 5, true, 433, 'North Star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- PostgreSQL database dump complete
--

