--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: maybes; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE maybes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    profile_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    prefer boolean DEFAULT true
);


ALTER TABLE public.maybes OWNER TO clausti;

--
-- Name: maybes_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE maybes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maybes_id_seq OWNER TO clausti;

--
-- Name: maybes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE maybes_id_seq OWNED BY maybes.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body text
);


ALTER TABLE public.messages OWNER TO clausti;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO clausti;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    gender character varying(255),
    about_me text,
    friends_wanted boolean DEFAULT false,
    dating_wanted boolean DEFAULT false,
    hookups_wanted boolean DEFAULT false,
    men_wanted boolean DEFAULT false,
    women_wanted boolean DEFAULT false,
    height integer,
    body_type character varying(255),
    religion character varying(255),
    education character varying(255),
    children character varying(255),
    pets character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    nonbinary_wanted boolean DEFAULT false,
    user_id integer NOT NULL,
    profile_photo_file_name character varying(255),
    profile_photo_content_type character varying(255),
    profile_photo_file_size integer,
    profile_photo_updated_at timestamp without time zone
);


ALTER TABLE public.profiles OWNER TO clausti;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO clausti;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: saved_searches; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE saved_searches (
    id integer NOT NULL,
    user_id integer NOT NULL,
    username character varying(255),
    gender character varying(255),
    friends_wanted boolean,
    dating_wanted boolean,
    hookups_wanted boolean,
    men_wanted boolean,
    women_wanted boolean,
    nonbinary_wanted boolean,
    height integer,
    body_type character varying(255),
    religion character varying(255),
    education character varying(255),
    children character varying(255),
    pets character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.saved_searches OWNER TO clausti;

--
-- Name: saved_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE saved_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_searches_id_seq OWNER TO clausti;

--
-- Name: saved_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE saved_searches_id_seq OWNED BY saved_searches.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO clausti;

--
-- Name: stars; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE stars (
    id integer NOT NULL,
    user_id integer NOT NULL,
    profile_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stars OWNER TO clausti;

--
-- Name: stars_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE stars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_id_seq OWNER TO clausti;

--
-- Name: stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE stars_id_seq OWNED BY stars.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: clausti; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_digest character varying(255) NOT NULL,
    session_token character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO clausti;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: clausti
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO clausti;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: clausti
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY maybes ALTER COLUMN id SET DEFAULT nextval('maybes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY saved_searches ALTER COLUMN id SET DEFAULT nextval('saved_searches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY stars ALTER COLUMN id SET DEFAULT nextval('stars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: clausti
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: maybes; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY maybes (id, user_id, profile_id, created_at, updated_at, prefer) FROM stdin;
60	2	5	2013-11-12 23:03:13.185067	2013-11-13 01:51:13.670749	f
86	2	9	2013-11-13 02:26:09.640574	2013-11-13 02:26:09.640574	t
37	2	8	2013-11-12 20:01:11.615518	2013-11-13 03:41:39.829938	f
33	9	3	2013-11-12 06:50:49.161333	2013-11-12 06:50:49.161333	f
22	1	2	2013-11-08 06:11:40.354185	2013-11-08 06:25:30.195909	t
23	1	4	2013-11-08 06:18:37.086452	2013-11-08 06:56:01.640204	f
28	3	1	2013-11-09 02:23:23.90963	2013-11-09 02:26:51.800126	t
30	3	8	2013-11-09 02:26:28.785593	2013-11-09 02:26:52.339611	t
29	3	2	2013-11-09 02:26:07.121606	2013-11-09 02:26:53.075568	t
27	3	4	2013-11-09 02:15:05.200342	2013-11-09 02:30:47.555607	f
31	3	5	2013-11-09 02:26:46.171656	2013-11-09 02:30:55.995577	f
77	4	2	2013-11-12 23:42:28.898184	2013-11-12 23:42:28.898184	f
57	2	4	2013-11-12 23:01:37.145485	2013-11-12 23:01:37.145485	t
\.


--
-- Name: maybes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('maybes_id_seq', 87, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY messages (id, sender_id, recipient_id, created_at, updated_at, body) FROM stdin;
5	3	2	2013-11-08 18:41:04.490127	2013-11-08 18:41:04.490127	Lorem Ipsum, even more lorems
17	2	8	2013-11-09 01:05:02.499963	2013-11-09 01:05:02.499963	New message!!!
20	2	4	2013-11-09 01:26:10.83973	2013-11-09 01:26:10.83973	CHEATAHS NEVER PROSPER
21	4	2	2013-11-09 01:27:08.620634	2013-11-09 01:27:08.620634	WHATEVER LOSER I DIDN"T GET NEARLY ENOUGH SLEEP LAST NIGHT
22	2	3	2013-11-09 01:27:50.110655	2013-11-09 01:27:50.110655	PENNY YORE BEAUTIFUL
26	3	5	2013-11-09 02:00:04.669856	2013-11-09 02:00:04.669856	I'm a message form!
27	3	1	2013-11-09 02:13:16.836776	2013-11-09 02:13:16.836776	I'm a message form!
28	3	1	2013-11-09 02:30:14.153842	2013-11-09 02:30:14.153842	I'm a message form!
29	3	1	2013-11-09 02:30:38.405666	2013-11-09 02:30:38.405666	I'm a message form!
30	2	5	2013-11-09 04:47:20.560616	2013-11-09 04:47:20.560616	I'm a message form!
32	2	1	2013-11-09 07:37:30.929019	2013-11-09 07:37:30.929019	asdfkjsdflkasdfI'm a message form!
35	1	3	2013-11-12 01:29:42.25123	2013-11-12 01:29:42.25123	I'm a message form!
36	1	5	2013-11-12 01:40:59.855697	2013-11-12 01:40:59.855697	Dear Jerry, \r\n\r\nYou're adorable. 
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('messages_id_seq', 36, true);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY profiles (id, username, gender, about_me, friends_wanted, dating_wanted, hookups_wanted, men_wanted, women_wanted, height, body_type, religion, education, children, pets, created_at, updated_at, nonbinary_wanted, user_id, profile_photo_file_name, profile_photo_content_type, profile_photo_file_size, profile_photo_updated_at) FROM stdin;
8	annieante	female		f	f	f	f	f	\N	\N	\N	\N	\N	\N	2013-11-08 01:06:26.413767	2013-11-11 22:26:50.52714	f	8	antelope-facecloseup.jpg	image/jpeg	58137	2013-11-11 22:26:50.181311
9	chicohuahua	male		f	f	f	f	f	\N	\N	\N	\N	\N	\N	2013-11-12 04:47:52.818221	2013-11-12 06:43:55.744856	f	9	chihuahua.jpeg	image/jpeg	44441	2013-11-12 06:43:55.424236
1	bobthecat	female	What about bob?	f	t	t	f	f	65	skinny	Allah	some high school	\N	bearded dragons	2013-11-05 18:55:31.311646	2013-11-12 02:24:22.440871	t	1	bobcat5849.jpg	image/jpeg	2027423	2013-11-11 22:25:45.623567
4	chenythechetah	female	I am so fast. \r\n\r\nmolestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamic	t	t	f	t	t	62	lean	Buddhist	PhD	have kids & want more	ball pythons	2013-11-07 00:33:50.03688	2013-11-12 00:34:14.308741	t	4	7444370-portrait-of-a-cheetah-acinonyx-jubatus-sitting-upright-south-africa.jpg	image/jpeg	146537	2013-11-11 22:29:42.50057
5	jerrygiraffe	female		f	t	t	f	f	\N	\N	\N	\N	\N	\N	2013-11-07 00:42:22.586851	2013-11-11 22:06:34.063987	f	5	giraffe_portrait.jpg	image/jpeg	253191	2013-11-11 22:06:33.730821
3	pennypen	female		f	f	f	f	f	\N	\N	\N	\N	\N	\N	2013-11-05 18:59:00.560394	2013-11-11 22:28:27.400351	f	3	Adelie_Penguin.jpg	image/jpeg	151724	2013-11-11 22:28:27.150091
2	garythegrey	male	asfdsd this is some more stuff about me	f	f	f	f	f	58	chubby	Jehovah	some high school	have kids	cats	2013-11-05 18:57:50.52293	2013-11-11 22:24:02.300264	f	2	Canis_lupus_4.jpg	image/jpeg	39407	2013-11-11 22:24:01.698999
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('profiles_id_seq', 9, true);


--
-- Data for Name: saved_searches; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY saved_searches (id, user_id, username, gender, friends_wanted, dating_wanted, hookups_wanted, men_wanted, women_wanted, nonbinary_wanted, height, body_type, religion, education, children, pets, created_at, updated_at) FROM stdin;
3	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-11-05 18:59:00.566234	2013-11-05 18:59:00.566234
8	8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-11-08 01:06:26.438405	2013-11-08 01:06:26.438405
1	1	\N	\N	f	t	t	f	t	t	69	lean	Jehovah	some high school	have kids	dogs	2013-11-05 18:55:31.319733	2013-11-08 07:14:35.654351
2	2	\N	\N	f	t	t	f	t	t	59		Jehovah	high school	have kids & want more	bearded dragons	2013-11-05 18:57:50.528951	2013-11-09 07:30:11.017776
5	5	\N	\N	f	t	t	f	f	f	\N				don't want kids		2013-11-07 00:42:22.593316	2013-11-11 19:38:19.10733
4	4	\N	\N	t	f	f	f	f	f	\N		Buddhist				2013-11-07 00:21:03.508749	2013-11-12 00:02:26.611351
9	9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-11-12 04:47:52.851722	2013-11-12 04:47:52.851722
\.


--
-- Name: saved_searches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('saved_searches_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY schema_migrations (version) FROM stdin;
20131105073846
20131103005521
20131103005635
20131103005659
20131103005709
20131103005715
20131103005722
20131103043937
20131105051119
20131105072445
20131106220818
20131106221423
20131108072956
20131108182646
20131111175744
20131111184948
20131111234435
20131112192140
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY stars (id, user_id, profile_id, created_at, updated_at) FROM stdin;
148	4	9	2013-11-13 00:56:06.4146	2013-11-13 00:56:06.4146
21	1	5	2013-11-11 18:14:31.921339	2013-11-11 18:14:31.921339
22	1	2	2013-11-11 18:14:43.706195	2013-11-11 18:14:43.706195
23	1	8	2013-11-11 18:14:57.652442	2013-11-11 18:14:57.652442
24	1	3	2013-11-11 18:15:20.420435	2013-11-11 18:15:20.420435
84	4	2	2013-11-13 00:19:04.553391	2013-11-13 00:19:04.553391
28	9	8	2013-11-12 06:44:28.270757	2013-11-12 06:44:28.270757
167	4	3	2013-11-13 01:06:21.042201	2013-11-13 01:06:21.042201
280	2	3	2013-11-13 03:53:43.695987	2013-11-13 03:53:43.695987
281	2	9	2013-11-13 03:53:53.029062	2013-11-13 03:53:53.029062
282	2	1	2013-11-13 04:29:14.525901	2013-11-13 04:29:14.525901
\.


--
-- Name: stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('stars_id_seq', 282, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: clausti
--

COPY users (id, email, password_digest, session_token, created_at, updated_at) FROM stdin;
5	jerry@thegiraffe.com	$2a$10$ze4t/U1Z9L1Exp1MiivzVOUTzWsOJHg8xJaHTKHHkJa/IVyeXkVtG	EHDLbkoIFhA_-mntRHQwZw	2013-11-07 00:42:22.581628	2013-11-11 22:13:24.271097
8	annie@theantelope.com	$2a$10$XboDWSw.YBRRI.x.9SQf/uuRXVKo6ZOTCmv1i.0RgPNKg9U8rUWsC	5LwSdZStTVijWF-qRkXPbA	2013-11-08 01:06:26.408801	2013-11-11 22:26:56.459173
3	penny@thepenguin.com	$2a$10$3xInNth0/GqCCQXbZoycU.VTzm73RtNma0hVdqSfDPHoZwmQQynym	GQrFoYOwNr6sPe0UfpBsug	2013-11-05 18:59:00.55549	2013-11-11 22:28:35.778679
1	bob@bob.com	$2a$10$5ToopRAyOHrt5M1WfhdCMuMnGMGCmeRUF2dOyaKboUH/TzIeEzLNy	WzSPD9qysVSzFyAMMCWBAA	2013-11-05 18:55:31.251388	2013-11-12 04:47:16.396281
9	chico@thechihuahua.com	$2a$10$Z/0R.iRnZ9fOZZ/.A8fEteN1nXbcJmrAmLA5HkAYQhbBFSWPnN.wq	-ZcR9aRACuNzNckuh6fZsA	2013-11-12 04:47:52.79908	2013-11-12 17:31:36.688066
4	cheny@thechetah.com	$2a$10$PA0jbRNKCvezVBckG/V3zeyDrJBos6Y9VEPXGWbyZxICA5I6bw1ru	csFbYebwvVYY9V_9n9TUYg	2013-11-07 00:21:03.467976	2013-11-13 01:47:25.896379
2	gary@thegreywolf.com	$2a$10$DYOO0FYz29ym8TIHBmxJaeKxQ61kIKqO0ZF9qOGiz5flTakDVZKu2	AgVyyAc5xGoeQwEp-N5fwA	2013-11-05 18:57:50.517188	2013-11-13 03:48:18.805586
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: clausti
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- Name: maybes_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY maybes
    ADD CONSTRAINT maybes_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: saved_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY saved_searches
    ADD CONSTRAINT saved_searches_pkey PRIMARY KEY (id);


--
-- Name: stars_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: clausti; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_maybes_on_prefer; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE INDEX index_maybes_on_prefer ON maybes USING btree (prefer);


--
-- Name: index_maybes_on_user_id_and_profile_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_maybes_on_user_id_and_profile_id ON maybes USING btree (user_id, profile_id);


--
-- Name: index_messages_on_recipient_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE INDEX index_messages_on_recipient_id ON messages USING btree (recipient_id);


--
-- Name: index_messages_on_sender_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE INDEX index_messages_on_sender_id ON messages USING btree (sender_id);


--
-- Name: index_profiles_on_user_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_profiles_on_user_id ON profiles USING btree (user_id);


--
-- Name: index_profiles_on_username; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_profiles_on_username ON profiles USING btree (username);


--
-- Name: index_saved_searches_on_user_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_saved_searches_on_user_id ON saved_searches USING btree (user_id);


--
-- Name: index_stars_on_user_id_and_profile_id; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_stars_on_user_id_and_profile_id ON stars USING btree (user_id, profile_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_session_token; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_session_token ON users USING btree (session_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: clausti; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: clausti
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM clausti;
GRANT ALL ON SCHEMA public TO clausti;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

