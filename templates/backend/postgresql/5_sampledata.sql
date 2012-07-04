--
-- PostgreSQL database dump
--

drop database if exists sampledata<%= name %>;

CREATE DATABASE sampledata<%= name %>  WITH OWNER = postgres  ENCODING = 'UTF8' TABLESPACE = pg_default;

\connect sampledata<%= name %> postgres

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer_w_ter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer_w_ter (
    customernumber integer NOT NULL,
    customername character varying(50),
    contactlastname character varying(50),
    contactfirstname character varying(50),
    phone character varying(50),
    addressline1 character varying(50),
    addressline2 character varying(50),
    city character varying(50),
    state character varying(50),
    postalcode character varying(15),
    country character varying(50),
    employeenumber integer,
    creditlimit numeric(30,17),
    territory character varying(10)
);


ALTER TABLE public.customer_w_ter OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customers (
    customernumber integer NOT NULL,
    customername character varying(50) NOT NULL,
    contactlastname character varying(50) NOT NULL,
    contactfirstname character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50),
    city character varying(50) NOT NULL,
    state character varying(50),
    postalcode character varying(15),
    country character varying(50) NOT NULL,
    salesrepemployeenumber integer,
    creditlimit numeric(17,0)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: department_managers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE department_managers (
    region character varying(50) NOT NULL,
    manager_name character varying(50) NOT NULL,
    email character varying(50)
);


ALTER TABLE public.department_managers OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees (
    employeenumber integer NOT NULL,
    lastname character varying(50) NOT NULL,
    firstname character varying(50) NOT NULL,
    extension character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    officecode character varying(20) NOT NULL,
    reportsto integer,
    jobtitle character varying(50) NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: offices; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE offices (
    officecode character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    addressline1 character varying(50) NOT NULL,
    addressline2 character varying(50),
    state character varying(50),
    country character varying(50) NOT NULL,
    postalcode character varying(10) NOT NULL,
    territory character varying(10) NOT NULL
);


ALTER TABLE public.offices OWNER TO postgres;

--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orderdetails (
    ordernumber integer NOT NULL,
    productcode character varying(50) NOT NULL,
    quantityordered integer NOT NULL,
    priceeach numeric(17,0) NOT NULL,
    orderlinenumber smallint NOT NULL
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- Name: orderfact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orderfact (
    ordernumber integer,
    productcode character varying(50),
    quantityordered integer,
    priceeach numeric(30,17),
    orderlinenumber integer,
    totalprice real,
    orderdate timestamp without time zone,
    requireddate timestamp without time zone,
    shippeddate timestamp without time zone,
    status character varying(15),
    comments character varying,
    customernumber integer,
    time_id character varying(10),
    qtr_id bigint,
    month_id bigint,
    year_id bigint
);


ALTER TABLE public.orderfact OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE orders (
    ordernumber integer NOT NULL,
    orderdate timestamp without time zone NOT NULL,
    requireddate timestamp without time zone NOT NULL,
    shippeddate timestamp without time zone,
    status character varying(15) NOT NULL,
    comments character varying,
    customernumber integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE payments (
    customernumber integer NOT NULL,
    checknumber character varying(50) NOT NULL,
    paymentdate timestamp without time zone NOT NULL,
    amount numeric(17,0) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    productcode character varying(50) NOT NULL,
    productname character varying(70) NOT NULL,
    productline character varying(50) NOT NULL,
    productscale character varying(10) NOT NULL,
    productvendor character varying(50) NOT NULL,
    productdescription character varying NOT NULL,
    quantityinstock smallint NOT NULL,
    buyprice numeric(17,0) NOT NULL,
    msrp numeric(17,0) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: quadrant_actuals; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quadrant_actuals (
    region character varying(50) NOT NULL,
    department character varying(50) NOT NULL,
    positiontitle character varying(50) NOT NULL,
    actual numeric(18,4),
    budget numeric(18,4),
    variance numeric(18,4)
);


ALTER TABLE public.quadrant_actuals OWNER TO postgres;

--
-- Name: time; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "time" (
    time_id character varying(10),
    month_id integer,
    qtr_id integer,
    year_id integer,
    month_name character(3),
    month_desc character varying(9),
    qtr_name character varying(4),
    qtr_desc character varying(9)
);


ALTER TABLE public."time" OWNER TO postgres;

--
-- Name: trial_balance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trial_balance (
    "Type" character(1),
    "Account_Num" integer,
    "Category" character varying(57),
    "Category2" character varying(57),
    "Detail" character varying(57),
    "Amount" integer
);


ALTER TABLE public.trial_balance OWNER TO postgres;

--
-- Data for Name: customer_w_ter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer_w_ter (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, employeenumber, creditlimit, territory) FROM stdin;
103	Atelier graphique	Schmitt	Carine	40.32.2555	54, rue Royale	\N	Nantes	\N	44000	France	1370	100.00000000000000000	EMEA
112	Signal Gift Stores	King	Sue	7025551838	8489 Strong St.	\N	Las Vegas	NV	83030	USA	1166	100.00000000000000000	NA
114	Australian Collectors, Co.	Ferguson	Peter	03 9520 4555	636 St Kilda Road	Level 3	Melbourne	Victoria	3004	Australia	1611	100.00000000000000000	APAC
119	La Rochelle Gifts	Labrune	Janine	40.67.8555	67, rue des Cinquante Otages	\N	Nantes	\N	44000	France	1370	100.00000000000000000	EMEA
121	Baane Mini Imports	Bergulfsen	Jonas	07-98 9555	Erling Skakkes gate 78	\N	Stavern	\N	4110	Norway	1504	100.00000000000000000	EMEA
124	Mini Gifts Distributors Ltd.	Nelson	Valarie	4155551450	5677 Strong St.	\N	San Rafael	CA	97562	USA	1165	100.00000000000000000	NA
128	Blauer See Auto, Co.	Keitel	Roland	+49 69 66 90 2555	Lyonerstr. 34	\N	Frankfurt	\N	60528	Germany	1504	100.00000000000000000	EMEA
129	Mini Wheels Co.	Murphy	Julie	6505555787	5557 North Pendale Street	\N	San Francisco	CA	94217	USA	1165	100.00000000000000000	NA
131	Land of Toys Inc.	Yu	Kwai	2125557818	897 Long Airport Avenue	\N	NYC	NY	10022	USA	1323	100.00000000000000000	NA
141	Euro+ Shopping Channel	Freyre	Diego	(91) 555 94 44	C/ Moralzarzal, 86	\N	Madrid	\N	28034	Spain	1370	100.00000000000000000	EMEA
144	Volvo Model Replicas, Co	Berglund	Christina	0921-12 3555	Berguvsv‰gen  8	\N	LuleÂ	\N	S-958 22	Sweden	1504	100.00000000000000000	EMEA
145	Danish Wholesale Imports	Petersen	Jytte	31 12 3555	VinbÊltet 34	\N	Kobenhavn	\N	1734	Denmark	1401	100.00000000000000000	EMEA
146	Saveley & Henriot, Co.	Saveley	Mary	78.32.5555	2, rue du Commerce	\N	Lyon	\N	69004	France	1337	100.00000000000000000	EMEA
148	Dragon Souveniers, Ltd.	Natividad	Eric	+65 221 7555	Bronz Sok., Bronz Apt. 3/6 Tesvikiye	\N	Singapore	\N	079903	Singapore	1621	100.00000000000000000	Japan
151	Muscle Machine Inc	Young	Jeff	2125557413	4092 Furth Circle	Suite 400	NYC	NY	10022	USA	1286	100.00000000000000000	NA
157	Diecast Classics Inc.	Yu	Kyung	2155551555	7586 Pompton St.	\N	Allentown	PA	70267	USA	1216	100.00000000000000000	NA
161	Technics Stores Inc.	Hirano	Juri	6505556809	9408 Furth Circle	\N	Burlingame	CA	94217	USA	1165	100.00000000000000000	NA
166	Handji Gifts& Co	Victorino	Wendy	+65 224 1555	Village Close - 106 Linden Road Sandown	2nd Floor	Singapore	\N	069045	Singapore	1612	100.00000000000000000	APAC
167	Herkku Gifts	Oeztan	Veysel	+47 2267 3215	Drammen 121, PR 744 Sentrum	\N	Bergen	\N	N 5804	Norway	1504	100.00000000000000000	EMEA
168	American Souvenirs Inc	Franco	Sue	2035557845	149 Spinnaker Dr.	Suite 101	New Haven	CT	97823	USA	1286	0.00000000000000000	NA
171	Daedalus Designs Imports	RancÈ	Martine	20.16.1555	184, chaussÈe de Tournai	\N	Lille	\N	59000	France	1370	100.00000000000000000	EMEA
172	La Corne D'abondance, Co.	Bertrand	Marie	(1) 42.34.2555	265, boulevard Charonne	\N	Paris	\N	75012	France	1337	100.00000000000000000	EMEA
173	Cambridge Collectables Co.	Tseng	Kyung	6175555555	4658 Baden Av.	\N	Cambridge	MA	51247	USA	1188	100.00000000000000000	NA
175	Gift Depot Inc.	King	Julie	2035552570	25593 South Bay Ln.	\N	Bridgewater	CT	97562	USA	1323	100.00000000000000000	NA
177	Osaka Souveniers Co.	Kentary	Mory	+81 06 6342 5555	Dojima Avanza 4F, 1-6-20 Dojima, Kita-ku	\N	Osaka	Osaka	 530-0003	Japan	1621	100.00000000000000000	Japan
181	Vitachrome Inc.	Frick	Michael	2125551500	2678 Kingston Rd.	Suite 101	NYC	NY	10022	USA	1286	100.00000000000000000	NA
186	Toys of Finland, Co.	Karttunen	Matti	90-224 8555	Keskuskatu 45	\N	Helsinki	\N	21240	Finland	1501	100.00000000000000000	EMEA
187	AV Stores, Co.	Ashworth	Victoria	(171) 555-1555	Fauntleroy Circus	\N	Manchester	\N	EC2 5NT	UK	1501	100.00000000000000000	EMEA
189	Clover Collections, Co.	Cassidy	Dean	+353 1862 1555	25 Maiden Lane	Floor No. 4	Dublin	\N	2	Ireland	1504	100.00000000000000000	EMEA
198	Auto-Moto Classics Inc.	Taylor	Leslie	6175558428	16780 Pompton St.	\N	Brickhaven	MA	58339	USA	1216	100.00000000000000000	NA
201	UK Collectables, Ltd.	Devon	Elizabeth	(171) 555-2282	Berkeley Gardens 12  Brewery	\N	Liverpool	\N	WX1 6LT	UK	1501	100.00000000000000000	EMEA
202	Canadian Gift Exchange Network	Tannamuri	Yoshi	(604) 555-3392	1900 Oak St.	\N	Vancouver	BC	V3F 2K1	Canada	1323	100.00000000000000000	NA
204	Online Mini Collectables	Barajas	Miguel	6175557555	7635 Spinnaker Dr.	\N	Brickhaven	MA	58339	USA	1188	100.00000000000000000	NA
205	Toys4GrownUps.com	Young	Julie	6265557265	78934 Hillside Dr.	\N	Pasadena	CA	90003	USA	1166	100.00000000000000000	NA
209	Mini Caravy	Citeaux	FrÈdÈrique	88.60.1555	24, place KlÈber	\N	Strasbourg	\N	67000	France	1370	100.00000000000000000	EMEA
211	King Kong Collectables, Co.	Sunwoo	Michael	+852 2251 1555	Bank of China Tower, 1 Garden Road	Level 25	Central Hong Kong	\N		Hong Kong	1621	100.00000000000000000	Japan
216	Enaco Distributors	Saavedra	Eduardo	(93) 203 4555	Rambla de CataluÒa, 23	\N	Barcelona	\N	08022	Spain	1702	100.00000000000000000	EMEA
219	Boards & Toys Co.	Young	Leslie	3105552373	4097 Douglas Av.	\N	Glendale	CA	92561	USA	1166	100.00000000000000000	NA
227	Heintze Collectables	Ibsen	Palle	86 21 3555	Smagsloget 45	\N	≈rhus	\N	8200	Denmark	1401	100.00000000000000000	EMEA
233	QuÈbec Home Shopping Network	FresniËre	Jean	(514) 555-8054	43 rue St. Laurent	\N	MontrÈal	QuÈbec	H1J 1C3	Canada	1286	100.00000000000000000	NA
239	Collectable Mini Designs Co.	Thompson	Valarie	7605558146	361 Furth Circle	\N	San Diego	CA	91217	USA	1166	100.00000000000000000	NA
240	giftsbymail.co.uk	Bennett	Helen	(198) 555-8888	Garden House Crowther Way	\N	Cowes	Isle of Wight	PO31 7PJ	UK	1501	100.00000000000000000	EMEA
242	Alpha Cognac	Roulet	Annette	61.77.6555	1 rue Alsace-Lorraine	\N	Toulouse	\N	31000	France	1370	100.00000000000000000	EMEA
249	Amica Models & Co.	Accorti	Paolo	011-4988555	Via Monte Bianco 34	\N	Torino	\N	10100	Italy	1401	100.00000000000000000	EMEA
250	Lyon Souveniers	Da Cunha	Daniel	+33 1 46 62 7555	27 rue du Colonel Pierre Avia	\N	Paris	\N	75508	France	1337	100.00000000000000000	EMEA
256	Auto AssociÈs & Cie.	Tonini	Daniel	30.59.8555	67, avenue de l'Europe	\N	Versailles	\N	78000	France	1370	100.00000000000000000	EMEA
259	Toms Spezialit‰ten, Ltd	Pfalzheim	Henriette	0221-5554327	Mehrheimerstr. 369	\N	Kˆln	\N	50739	Germany	1504	100.00000000000000000	EMEA
260	Royal Canadian Collectables, Ltd.	Lincoln	Elizabeth	(604) 555-4555	23 Tsawassen Blvd.	\N	Tsawassen	BC	T2F 8M4	Canada	1323	100.00000000000000000	NA
276	Anna's Decorations, Ltd	O'Hara	Anna	02 9936 8555	201 Miller Street	Level 15	North Sydney	NSW	2060	Australia	1611	100.00000000000000000	APAC
278	Rovelli Gifts	Rovelli	Giovanni	035-640555	Via Ludovico il Moro 22	\N	Bergamo	\N	24100	Italy	1401	100.00000000000000000	EMEA
282	Souveniers And Things Co.	Huxley	Adrian	+61 2 9495 8555	Monitor Money Building, 815 Pacific Hwy	Level 6	Chatswood	NSW	2067	Australia	1611	100.00000000000000000	APAC
286	Marta's Replicas Co.	Hernandez	Marta	6175558555	39323 Spinnaker Dr.	\N	Cambridge	MA	51247	USA	1216	100.00000000000000000	NA
298	Vida Sport, Ltd	Holz	Michael	0897-034555	Grenzacherweg 237	\N	GenËve	\N	1203	Switzerland	1702	100.00000000000000000	EMEA
299	Norway Gifts By Mail, Co.	Klaeboe	Jan	+47 2212 1555	Drammensveien 126 A, PB 744 Sentrum	\N	Oslo	\N	N 0106	Norway	1504	100.00000000000000000	EMEA
311	Oulu Toy Supplies, Inc.	Koskitalo	Pirkko	981-443655	Torikatu 38	\N	Oulu	\N	90110	Finland	1501	100.00000000000000000	EMEA
314	Petit Auto	Dewey	Catherine	(02) 5554 67	Rue Joseph-Bens 532	\N	Bruxelles	\N	B-1180	Belgium	1401	100.00000000000000000	EMEA
319	Mini Classics	Frick	Steve	9145554562	3758 North Pendale Street	\N	White Plains	NY	24067	USA	1323	100.00000000000000000	NA
320	Mini Creations Ltd.	Tam	Wing C	5085559555	4575 Hillside Dr.	\N	New Bedford	MA	50553	USA	1188	100.00000000000000000	NA
321	Corporate Gift Ideas Co.	Brown	Julie	6505551386	7734 Strong St.	\N	San Francisco	CA	94217	USA	1165	100.00000000000000000	NA
323	Down Under Souveniers, Inc	Graham	Mike	+64 9 312 5555	162-164 Grafton Road	Level 2	Auckland	\N		New Zealand	1612	100.00000000000000000	APAC
324	Stylish Desk Decors, Co.	Brown	Ann	(171) 555-0297	35 King George	\N	London	\N	WX3 6FW	UK	1501	100.00000000000000000	EMEA
328	Tekni Collectables Inc.	Brown	William	2015559350	7476 Moss Rd.	\N	Newark	NJ	94019	USA	1323	100.00000000000000000	NA
333	Australian Gift Network, Co	Calaghan	Tony	61-7-3844-6555	31 Duncan St. West End	\N	South Brisbane	Queensland	4101	Australia	1611	100.00000000000000000	APAC
334	Suominen Souveniers	Suominen	Kalle	+358 9 8045 555	Software Engineering Center, SEC Oy	\N	Espoo	\N	FIN-02271	Finland	1501	100.00000000000000000	EMEA
339	Classic Gift Ideas, Inc	Cervantes	Francisca	2155554695	782 First Street	\N	Philadelphia	PA	71270	USA	1188	100.00000000000000000	NA
344	CAF Imports	Fernandez	Jesus	+34 913 728 555	Merchants House, 27-30 Merchant's Quay	\N	Madrid	\N	28023	Spain	1702	100.00000000000000000	EMEA
347	Men 'R' US Retailers, Ltd.	Chandler	Michael	2155554369	6047 Douglas Av.	\N	Los Angeles	CA	91003	USA	1166	100.00000000000000000	NA
350	Marseille Mini Autos	Lebihan	Laurence	91.24.4555	12, rue des Bouchers	\N	Marseille	\N	13008	France	1337	100.00000000000000000	EMEA
353	Reims Collectables	Henriot	Paul	26.47.1555	59 rue de l'Abbaye	\N	Reims	\N	51100	France	1337	100.00000000000000000	EMEA
357	GiftsForHim.com	MacKinlay	Wales	64-9-3763555	199 Great North Road	\N	Auckland	\N		New Zealand	1612	100.00000000000000000	APAC
362	Gifts4AllAges.com	Yoshido	Juri	6175559555	8616 Spinnaker Dr.	\N	Boston	MA	51003	USA	1216	100.00000000000000000	NA
363	Online Diecast Creations Co.	Young	Valarie	6035558647	2304 Long Airport Avenue	\N	Nashua	NH	62005	USA	1216	100.00000000000000000	NA
376	Precious Collectables	Wang	Yang	0452-076555	Hauptstr. 29	\N	Bern	\N	3012	Switzerland	1702	0.00000000000000000	EMEA
379	Collectables For Less Inc.	Nelson	Allen	6175558555	7825 Douglas Av.	\N	Brickhaven	MA	58339	USA	1188	100.00000000000000000	NA
381	Royale Belge	Cartrain	Pascale	(071) 23 67 2555	Boulevard Tirou, 255	\N	Charleroi	\N	B-6000	Belgium	1401	100.00000000000000000	EMEA
382	Salzburg Collectables	Pipps	Georg	6562-9555	Geislweg 14	\N	Salzburg	\N	5020	Austria	1401	100.00000000000000000	EMEA
385	Cruz & Sons Co.	Cruz	Arnold	+63 2 555 3587	15 McCallum Street - NatWest Center #13-03	\N	Makati City	\N	1227 MM	Philippines	1621	100.00000000000000000	Japan
386	L'ordine Souveniers	Moroni	Maurizio	0522-556555	Strada Provinciale 124	\N	Reggio Emilia	\N	42100	Italy	1401	100.00000000000000000	EMEA
398	Tokyo Collectables, Ltd	Shimamura	Akiko	+81 3 3584 0555	2-2-8 Roppongi	\N	Minato-ku	Tokyo	106-0032	Japan	1621	100.00000000000000000	Japan
406	Auto Canal+ Petit	Perrier	Dominique	(1) 47.55.6555	25, rue Lauriston	\N	Paris	\N	75016	France	1337	100.00000000000000000	EMEA
412	Extreme Desk Decorations, Ltd	McRoy	Sarah	04 499 9555	101 Lambton Quay	Level 11	Wellington	\N		New Zealand	1612	100.00000000000000000	APAC
415	Bavarian Collectables Imports, Co.	Donnermeyer	Michael	 +49 89 61 08 9555	Hansastr. 15	\N	Munich	\N	80686	Germany	1504	100.00000000000000000	EMEA
424	Classic Legends Inc.	Hernandez	Maria	2125558493	5905 Pompton St.	Suite 750	NYC	NY	10022	USA	1286	100.00000000000000000	NA
447	Gift Ideas Corp.	Lewis	Dan	2035554407	2440 Pompton St.	\N	Glendale	CT	97561	USA	1323	100.00000000000000000	NA
448	Scandinavian Gift Ideas	Larsson	Maria	0695-34 6555	≈kergatan 24	\N	Br‰cke	\N	S-844 67	Sweden	1504	100.00000000000000000	EMEA
450	The Sharp Gifts Warehouse	Frick	Sue	4085553659	3086 Ingle Ln.	\N	San Jose	CA	94217	USA	1165	100.00000000000000000	NA
452	Mini Auto Werke	Mendel	Roland	7675-3555	Kirchgasse 6	\N	Graz	\N	8010	Austria	1401	100.00000000000000000	EMEA
455	Super Scale Inc.	Murphy	Leslie	2035559545	567 North Pendale Street	\N	New Haven	CT	97823	USA	1286	100.00000000000000000	NA
456	Microscale Inc.	Kuo	Kee	2125551957	5290 North Pendale Street	Suite 200	NYC	NY	10022	USA	1286	100.00000000000000000	NA
458	Corrida Auto Replicas, Ltd	Sommer	MartÌn	(91) 555 22 82	C/ Araquil, 67	\N	Madrid	\N	28023	Spain	1702	100.00000000000000000	EMEA
462	FunGiftIdeas.com	Benitez	Violeta	5085552555	1785 First Street	\N	New Bedford	MA	50553	USA	1216	100.00000000000000000	NA
471	Australian Collectables, Ltd	Connery	Sean	61-9-3844-6555	7 Allen Street	\N	Glen Waverly	Victoria	3150	Australia	1611	100.00000000000000000	APAC
473	Frau da Collezione	Ricotti	Franco	+39 022515555	20093 Cologno Monzese, via Alessandro Volta 16	\N	Milan	\N		Italy	1401	100.00000000000000000	EMEA
475	West Coast Collectables Co.	Thompson	Steve	3105553722	3675 Furth Circle	\N	Burbank	CA	94019	USA	1166	100.00000000000000000	NA
484	Iberia Gift Imports, Corp.	Roel	JosÈ Pedro	(95) 555 82 82	C/ Romero, 33	\N	Sevilla	\N	41101	Spain	1702	100.00000000000000000	EMEA
486	Motor Mint Distributors Inc.	Hernandez	Rosa	2155559857	11328 Douglas Av.	\N	Philadelphia	PA	71270	USA	1323	100.00000000000000000	NA
487	Signal Collectibles Ltd.	Taylor	Sue	4155554312	2793 Furth Circle	\N	Brisbane	CA	94217	USA	1165	100.00000000000000000	NA
489	Double Decker Gift Stores, Ltd	Hardy	Thomas	(171) 555-7555	120 Hanover Sq.	\N	London	\N	WA1 1DP	UK	1501	100.00000000000000000	EMEA
495	Diecast Collectables	Franco	Valarie	6175552555	6251 Ingle Ln.	\N	Boston	MA	51003	USA	1188	100.00000000000000000	NA
496	Kelly's Gift Shop	Snowden	Tony	+64 9 5555500	Arenales 1938 3'A'	\N	Auckland	\N		New Zealand	1612	100.00000000000000000	APAC
125	Havel & Zbyszek Co	Piestrzeniewicz	Zbyszek	(26) 642-7555	ul. Filtrowa 68	\N	Warszawa	\N	01-012	Poland	\N	0.00000000000000000	test1
169	Porto Imports Co.	de Castro	Isabel	(1) 356-5555	Estrada da sa˙de n. 58	\N	Lisboa	\N	1756	Portugal	\N	0.00000000000000000	test1
206	Asian Shopping Network, Co	Walker	Brydey	+612 9411 1555	Penthouse Level, Suntec Tower Three, 8 Temasek	\N	Singapore	\N	038988	Singapore	\N	0.00000000000000000	test1
223	Nat¸rlich Autos	Kloss	Horst	0372-555188	Taucherstraﬂe 10	\N	Cunewalde	\N	01307	Germany	\N	0.00000000000000000	test1
237	ANG Resellers	Camino	Alejandra	(91) 745 6555	Gran VÌa, 1	\N	Madrid	\N	28001	Spain	\N	0.00000000000000000	test1
247	Messner Shopping Network	Messner	Renate	069-0555984	Magazinweg 7	\N	Frankfurt	\N	60528	Germany	\N	0.00000000000000000	test1
273	Franken Gifts, Co	Franken	Peter	089-0877555	Berliner Platz 43	\N	M¸nchen	\N	80805	Germany	\N	0.00000000000000000	test1
293	BG&E Collectables	Pon	Ed	+41 26 425 50 01	Rte des Arsenaux 41	\N	Fribourg	\N	1700	Switzerland	\N	0.00000000000000000	test1
303	Schuyler Imports	Schuyler	Bradley	+31 20 491 9555	Kingsfordweg 151	\N	Amsterdam	\N	1043 GR	Netherlands	\N	0.00000000000000000	test1
307	Der Hund Imports	Anders	Maria	030-0074555	Obere Str. 57	\N	Berlin	\N	12209	Germany	\N	0.00000000000000000	test1
335	Cramer Spezialit‰ten, Ltd	Cramer	Philip	0555-09555	Maubelstr. 90	\N	Brandenburg	\N	14776	Germany	\N	0.00000000000000000	test1
348	Asian Treasures, Inc.	McKenna	Patricia	2967 555	8 Johnstown Road	\N	Cork	Co. Cork	\N	Ireland	\N	0.00000000000000000	test1
356	SAR Distributors, Co	Kuger	Armand	+27 21 550 3555	Century City-Montague Gardens PO Box 37177	\N	Chempet	\N	 7442	South Africa	\N	0.00000000000000000	test1
361	Kommission Auto	Josephs	Karin	0251-555259	Luisenstr. 48	\N	M¸nster	\N	44087	Germany	\N	0.00000000000000000	test1
369	Lisboa Souveniers, Inc	Rodriguez	Lino	(1) 354-2555	Jardim das rosas n. 32	\N	Lisboa	\N	1675	Portugal	\N	0.00000000000000000	test1
409	Stuttgart Collectable Exchange	M¸ller	Rita	0711-555361	Adenauerallee 900	\N	Stuttgart	\N	70563	Germany	\N	0.00000000000000000	test1
443	Feuer Online Stores, Inc	Feuer	Alexander	0342-555176	Heerstr. 22	\N	Leipzig	\N	04179	Germany	\N	0.00000000000000000	test1
459	Warburg Exchange	Ottlieb	Sven	0241-039123	Walserweg 21	\N	Aachen	\N	52066	Germany	\N	0.00000000000000000	test1
465	Anton Designs, Ltd.	Anton	Carmen	+34 913 728555	c/ Gobelas, 19-1 Urb. La Florida	\N	Madrid	\N	28023	Spain	\N	0.00000000000000000	test1
477	Mit Vergn¸gen & Co.	Moos	Hanna	0621-08555	Forsterstr. 57	\N	Mannheim	\N	68306	Germany	\N	0.00000000000000000	test1
480	Kremlin Collectables, Co.	Semenov	Alexander	+7 812 293 0521	2 Pobedy Square	\N	Saint Petersburg	\N	196143	Russia	\N	0.00000000000000000	test1
481	Raanan Stores, Inc	Altagar,G M	Raanan	+ 972 9 959 8555	3 Hagalim Blv.,	\N	Herzlia	\N	47625	Israel	\N	0.00000000000000000	test1
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customers (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) FROM stdin;
103	Atelier graphique	Schmitt	Carine	40.32.2555	54, rue Royale	\N	Nantes	\N	44000	France	1370	21000
112	Signal Gift Stores	King	Sue	7025551838	8489 Strong St.	\N	Las Vegas	NV	83030	USA	1166	71800
114	Australian Collectors, Co.	Ferguson	Peter	03 9520 4555	636 St Kilda Road	Level 3	Melbourne	Victoria	3004	Australia	1611	117300
119	La Rochelle Gifts	Labrune	Janine	40.67.8555	67, rue des Cinquante Otages	\N	Nantes	\N	44000	France	1370	118200
121	Baane Mini Imports	Bergulfsen	Jonas	07-98 9555	Erling Skakkes gate 78	\N	Stavern	\N	4110	Norway	1504	81700
124	Mini Gifts Distributors Ltd.	Nelson	Valarie	4155551450	5677 Strong St.	\N	San Rafael	CA	97562	USA	1165	210500
125	Havel & Zbyszek Co	Piestrzeniewicz	Zbyszek	(26) 642-7555	ul. Filtrowa 68	\N	Warszawa	\N	01-012	Poland	\N	0
128	Blauer See Auto, Co.	Keitel	Roland	+49 69 66 90 2555	Lyonerstr. 34	\N	Frankfurt	\N	60528	Germany	1504	59700
129	Mini Wheels Co.	Murphy	Julie	6505555787	5557 North Pendale Street	\N	San Francisco	CA	94217	USA	1165	64600
131	Land of Toys Inc.	Yu	Kwai	2125557818	897 Long Airport Avenue	\N	NYC	NY	10022	USA	1323	114900
141	Euro+ Shopping Channel	Freyre	Diego	(91) 555 94 44	C/ Moralzarzal, 86	\N	Madrid	\N	28034	Spain	1370	227600
144	Volvo Model Replicas, Co	Berglund	Christina	0921-12 3555	Berguvsv‰gen  8	\N	LuleÂ	\N	S-958 22	Sweden	1504	53100
145	Danish Wholesale Imports	Petersen	Jytte	31 12 3555	VinbÊltet 34	\N	Kobenhavn	\N	1734	Denmark	1401	83400
146	Saveley & Henriot, Co.	Saveley	Mary	78.32.5555	2, rue du Commerce	\N	Lyon	\N	69004	France	1337	123900
148	Dragon Souveniers, Ltd.	Natividad	Eric	+65 221 7555	Bronz Sok., Bronz Apt. 3/6 Tesvikiye	\N	Singapore	\N	079903	Singapore	1621	103800
151	Muscle Machine Inc	Young	Jeff	2125557413	4092 Furth Circle	Suite 400	NYC	NY	10022	USA	1286	138500
157	Diecast Classics Inc.	Yu	Kyung	2155551555	7586 Pompton St.	\N	Allentown	PA	70267	USA	1216	100600
161	Technics Stores Inc.	Hirano	Juri	6505556809	9408 Furth Circle	\N	Burlingame	CA	94217	USA	1165	84600
166	Handji Gifts& Co	Victorino	Wendy	+65 224 1555	Village Close - 106 Linden Road Sandown	2nd Floor	Singapore	\N	069045	Singapore	1612	97900
167	Herkku Gifts	Oeztan	Veysel	+47 2267 3215	Drammen 121, PR 744 Sentrum	\N	Bergen	\N	N 5804	Norway	1504	96800
168	American Souvenirs Inc	Franco	Sue	2035557845	149 Spinnaker Dr.	Suite 101	New Haven	CT	97823	USA	1286	0
169	Porto Imports Co.	de Castro	Isabel	(1) 356-5555	Estrada da sa˙de n. 58	\N	Lisboa	\N	1756	Portugal	\N	0
171	Daedalus Designs Imports	RancÈ	Martine	20.16.1555	184, chaussÈe de Tournai	\N	Lille	\N	59000	France	1370	82900
172	La Corne D'abondance, Co.	Bertrand	Marie	(1) 42.34.2555	265, boulevard Charonne	\N	Paris	\N	75012	France	1337	84300
173	Cambridge Collectables Co.	Tseng	Kyung	6175555555	4658 Baden Av.	\N	Cambridge	MA	51247	USA	1188	43400
175	Gift Depot Inc.	King	Julie	2035552570	25593 South Bay Ln.	\N	Bridgewater	CT	97562	USA	1323	84300
177	Osaka Souveniers Co.	Kentary	Mory	+81 06 6342 5555	Dojima Avanza 4F, 1-6-20 Dojima, Kita-ku	\N	Osaka	Osaka	 530-0003	Japan	1621	81200
181	Vitachrome Inc.	Frick	Michael	2125551500	2678 Kingston Rd.	Suite 101	NYC	NY	10022	USA	1286	76400
186	Toys of Finland, Co.	Karttunen	Matti	90-224 8555	Keskuskatu 45	\N	Helsinki	\N	21240	Finland	1501	96500
187	AV Stores, Co.	Ashworth	Victoria	(171) 555-1555	Fauntleroy Circus	\N	Manchester	\N	EC2 5NT	UK	1501	136800
189	Clover Collections, Co.	Cassidy	Dean	+353 1862 1555	25 Maiden Lane	Floor No. 4	Dublin	\N	2	Ireland	1504	69400
198	Auto-Moto Classics Inc.	Taylor	Leslie	6175558428	16780 Pompton St.	\N	Brickhaven	MA	58339	USA	1216	23000
201	UK Collectables, Ltd.	Devon	Elizabeth	(171) 555-2282	Berkeley Gardens 12  Brewery	\N	Liverpool	\N	WX1 6LT	UK	1501	92700
202	Canadian Gift Exchange Network	Tannamuri	Yoshi	(604) 555-3392	1900 Oak St.	\N	Vancouver	BC	V3F 2K1	Canada	1323	90300
204	Online Mini Collectables	Barajas	Miguel	6175557555	7635 Spinnaker Dr.	\N	Brickhaven	MA	58339	USA	1188	68700
205	Toys4GrownUps.com	Young	Julie	6265557265	78934 Hillside Dr.	\N	Pasadena	CA	90003	USA	1166	90700
206	Asian Shopping Network, Co	Walker	Brydey	+612 9411 1555	Penthouse Level, Suntec Tower Three, 8 Temasek	\N	Singapore	\N	038988	Singapore	\N	0
209	Mini Caravy	Citeaux	FrÈdÈrique	88.60.1555	24, place KlÈber	\N	Strasbourg	\N	67000	France	1370	53800
211	King Kong Collectables, Co.	Sunwoo	Michael	+852 2251 1555	Bank of China Tower, 1 Garden Road	Level 25	Central Hong Kong	\N		Hong Kong	1621	58600
216	Enaco Distributors	Saavedra	Eduardo	(93) 203 4555	Rambla de CataluÒa, 23	\N	Barcelona	\N	08022	Spain	1702	60300
219	Boards & Toys Co.	Young	Leslie	3105552373	4097 Douglas Av.	\N	Glendale	CA	92561	USA	1166	11000
223	Nat¸rlich Autos	Kloss	Horst	0372-555188	Taucherstraﬂe 10	\N	Cunewalde	\N	01307	Germany	\N	0
227	Heintze Collectables	Ibsen	Palle	86 21 3555	Smagsloget 45	\N	≈rhus	\N	8200	Denmark	1401	120800
233	QuÈbec Home Shopping Network	FresniËre	Jean	(514) 555-8054	43 rue St. Laurent	\N	MontrÈal	QuÈbec	H1J 1C3	Canada	1286	48700
237	ANG Resellers	Camino	Alejandra	(91) 745 6555	Gran VÌa, 1	\N	Madrid	\N	28001	Spain	\N	0
239	Collectable Mini Designs Co.	Thompson	Valarie	7605558146	361 Furth Circle	\N	San Diego	CA	91217	USA	1166	105000
240	giftsbymail.co.uk	Bennett	Helen	(198) 555-8888	Garden House Crowther Way	\N	Cowes	Isle of Wight	PO31 7PJ	UK	1501	93900
242	Alpha Cognac	Roulet	Annette	61.77.6555	1 rue Alsace-Lorraine	\N	Toulouse	\N	31000	France	1370	61100
247	Messner Shopping Network	Messner	Renate	069-0555984	Magazinweg 7	\N	Frankfurt	\N	60528	Germany	\N	0
249	Amica Models & Co.	Accorti	Paolo	011-4988555	Via Monte Bianco 34	\N	Torino	\N	10100	Italy	1401	113000
250	Lyon Souveniers	Da Cunha	Daniel	+33 1 46 62 7555	27 rue du Colonel Pierre Avia	\N	Paris	\N	75508	France	1337	68100
256	Auto AssociÈs & Cie.	Tonini	Daniel	30.59.8555	67, avenue de l'Europe	\N	Versailles	\N	78000	France	1370	77900
259	Toms Spezialit‰ten, Ltd	Pfalzheim	Henriette	0221-5554327	Mehrheimerstr. 369	\N	Kˆln	\N	50739	Germany	1504	120400
459	Warburg Exchange	Ottlieb	Sven	0241-039123	Walserweg 21	\N	Aachen	\N	52066	Germany	\N	0
260	Royal Canadian Collectables, Ltd.	Lincoln	Elizabeth	(604) 555-4555	23 Tsawassen Blvd.	\N	Tsawassen	BC	T2F 8M4	Canada	1323	89600
273	Franken Gifts, Co	Franken	Peter	089-0877555	Berliner Platz 43	\N	M¸nchen	\N	80805	Germany	\N	0
276	Anna's Decorations, Ltd	O'Hara	Anna	02 9936 8555	201 Miller Street	Level 15	North Sydney	NSW	2060	Australia	1611	107800
278	Rovelli Gifts	Rovelli	Giovanni	035-640555	Via Ludovico il Moro 22	\N	Bergamo	\N	24100	Italy	1401	119600
282	Souveniers And Things Co.	Huxley	Adrian	+61 2 9495 8555	Monitor Money Building, 815 Pacific Hwy	Level 6	Chatswood	NSW	2067	Australia	1611	93300
286	Marta's Replicas Co.	Hernandez	Marta	6175558555	39323 Spinnaker Dr.	\N	Cambridge	MA	51247	USA	1216	123700
293	BG&E Collectables	Pon	Ed	+41 26 425 50 01	Rte des Arsenaux 41	\N	Fribourg	\N	1700	Switzerland	\N	0
298	Vida Sport, Ltd	Holz	Michael	0897-034555	Grenzacherweg 237	\N	GenËve	\N	1203	Switzerland	1702	141300
299	Norway Gifts By Mail, Co.	Klaeboe	Jan	+47 2212 1555	Drammensveien 126 A, PB 744 Sentrum	\N	Oslo	\N	N 0106	Norway	1504	95100
303	Schuyler Imports	Schuyler	Bradley	+31 20 491 9555	Kingsfordweg 151	\N	Amsterdam	\N	1043 GR	Netherlands	\N	0
307	Der Hund Imports	Anders	Maria	030-0074555	Obere Str. 57	\N	Berlin	\N	12209	Germany	\N	0
311	Oulu Toy Supplies, Inc.	Koskitalo	Pirkko	981-443655	Torikatu 38	\N	Oulu	\N	90110	Finland	1501	90500
314	Petit Auto	Dewey	Catherine	(02) 5554 67	Rue Joseph-Bens 532	\N	Bruxelles	\N	B-1180	Belgium	1401	79900
319	Mini Classics	Frick	Steve	9145554562	3758 North Pendale Street	\N	White Plains	NY	24067	USA	1323	102700
320	Mini Creations Ltd.	Tam	Wing C	5085559555	4575 Hillside Dr.	\N	New Bedford	MA	50553	USA	1188	94500
321	Corporate Gift Ideas Co.	Brown	Julie	6505551386	7734 Strong St.	\N	San Francisco	CA	94217	USA	1165	105000
323	Down Under Souveniers, Inc	Graham	Mike	+64 9 312 5555	162-164 Grafton Road	Level 2	Auckland	\N		New Zealand	1612	88000
324	Stylish Desk Decors, Co.	Brown	Ann	(171) 555-0297	35 King George	\N	London	\N	WX3 6FW	UK	1501	77000
328	Tekni Collectables Inc.	Brown	William	2015559350	7476 Moss Rd.	\N	Newark	NJ	94019	USA	1323	44100
333	Australian Gift Network, Co	Calaghan	Tony	61-7-3844-6555	31 Duncan St. West End	\N	South Brisbane	Queensland	4101	Australia	1611	51600
334	Suominen Souveniers	Suominen	Kalle	+358 9 8045 555	Software Engineering Center, SEC Oy	\N	Espoo	\N	FIN-02271	Finland	1501	98800
335	Cramer Spezialit‰ten, Ltd	Cramer	Philip	0555-09555	Maubelstr. 90	\N	Brandenburg	\N	14776	Germany	\N	0
339	Classic Gift Ideas, Inc	Cervantes	Francisca	2155554695	782 First Street	\N	Philadelphia	PA	71270	USA	1188	81100
344	CAF Imports	Fernandez	Jesus	+34 913 728 555	Merchants House, 27-30 Merchant's Quay	\N	Madrid	\N	28023	Spain	1702	59600
347	Men 'R' US Retailers, Ltd.	Chandler	Michael	2155554369	6047 Douglas Av.	\N	Los Angeles	CA	91003	USA	1166	57700
348	Asian Treasures, Inc.	McKenna	Patricia	2967 555	8 Johnstown Road	\N	Cork	Co. Cork	\N	Ireland	\N	0
350	Marseille Mini Autos	Lebihan	Laurence	91.24.4555	12, rue des Bouchers	\N	Marseille	\N	13008	France	1337	65000
353	Reims Collectables	Henriot	Paul	26.47.1555	59 rue de l'Abbaye	\N	Reims	\N	51100	France	1337	81100
356	SAR Distributors, Co	Kuger	Armand	+27 21 550 3555	Century City-Montague Gardens PO Box 37177	\N	Chempet	\N	 7442	South Africa	\N	0
357	GiftsForHim.com	MacKinlay	Wales	64-9-3763555	199 Great North Road	\N	Auckland	\N		New Zealand	1612	77700
361	Kommission Auto	Josephs	Karin	0251-555259	Luisenstr. 48	\N	M¸nster	\N	44087	Germany	\N	0
362	Gifts4AllAges.com	Yoshido	Juri	6175559555	8616 Spinnaker Dr.	\N	Boston	MA	51003	USA	1216	41900
363	Online Diecast Creations Co.	Young	Valarie	6035558647	2304 Long Airport Avenue	\N	Nashua	NH	62005	USA	1216	114200
369	Lisboa Souveniers, Inc	Rodriguez	Lino	(1) 354-2555	Jardim das rosas n. 32	\N	Lisboa	\N	1675	Portugal	\N	0
376	Precious Collectables	Wang	Yang	0452-076555	Hauptstr. 29	\N	Bern	\N	3012	Switzerland	1702	0
379	Collectables For Less Inc.	Nelson	Allen	6175558555	7825 Douglas Av.	\N	Brickhaven	MA	58339	USA	1188	70700
381	Royale Belge	Cartrain	Pascale	(071) 23 67 2555	Boulevard Tirou, 255	\N	Charleroi	\N	B-6000	Belgium	1401	23500
382	Salzburg Collectables	Pipps	Georg	6562-9555	Geislweg 14	\N	Salzburg	\N	5020	Austria	1401	71700
385	Cruz & Sons Co.	Cruz	Arnold	+63 2 555 3587	15 McCallum Street - NatWest Center #13-03	\N	Makati City	\N	1227 MM	Philippines	1621	81500
386	L'ordine Souveniers	Moroni	Maurizio	0522-556555	Strada Provinciale 124	\N	Reggio Emilia	\N	42100	Italy	1401	121400
398	Tokyo Collectables, Ltd	Shimamura	Akiko	+81 3 3584 0555	2-2-8 Roppongi	\N	Minato-ku	Tokyo	106-0032	Japan	1621	94400
406	Auto Canal+ Petit	Perrier	Dominique	(1) 47.55.6555	25, rue Lauriston	\N	Paris	\N	75016	France	1337	95000
409	Stuttgart Collectable Exchange	M¸ller	Rita	0711-555361	Adenauerallee 900	\N	Stuttgart	\N	70563	Germany	\N	0
412	Extreme Desk Decorations, Ltd	McRoy	Sarah	04 499 9555	101 Lambton Quay	Level 11	Wellington	\N		New Zealand	1612	86800
415	Bavarian Collectables Imports, Co.	Donnermeyer	Michael	 +49 89 61 08 9555	Hansastr. 15	\N	Munich	\N	80686	Germany	1504	77000
424	Classic Legends Inc.	Hernandez	Maria	2125558493	5905 Pompton St.	Suite 750	NYC	NY	10022	USA	1286	67500
443	Feuer Online Stores, Inc	Feuer	Alexander	0342-555176	Heerstr. 22	\N	Leipzig	\N	04179	Germany	\N	0
447	Gift Ideas Corp.	Lewis	Dan	2035554407	2440 Pompton St.	\N	Glendale	CT	97561	USA	1323	49700
448	Scandinavian Gift Ideas	Larsson	Maria	0695-34 6555	≈kergatan 24	\N	Br‰cke	\N	S-844 67	Sweden	1504	116400
450	The Sharp Gifts Warehouse	Frick	Sue	4085553659	3086 Ingle Ln.	\N	San Jose	CA	94217	USA	1165	77600
452	Mini Auto Werke	Mendel	Roland	7675-3555	Kirchgasse 6	\N	Graz	\N	8010	Austria	1401	45300
455	Super Scale Inc.	Murphy	Leslie	2035559545	567 North Pendale Street	\N	New Haven	CT	97823	USA	1286	95400
456	Microscale Inc.	Kuo	Kee	2125551957	5290 North Pendale Street	Suite 200	NYC	NY	10022	USA	1286	39800
458	Corrida Auto Replicas, Ltd	Sommer	MartÌn	(91) 555 22 82	C/ Araquil, 67	\N	Madrid	\N	28023	Spain	1702	104600
462	FunGiftIdeas.com	Benitez	Violeta	5085552555	1785 First Street	\N	New Bedford	MA	50553	USA	1216	85800
465	Anton Designs, Ltd.	Anton	Carmen	+34 913 728555	c/ Gobelas, 19-1 Urb. La Florida	\N	Madrid	\N	28023	Spain	\N	0
471	Australian Collectables, Ltd	Connery	Sean	61-9-3844-6555	7 Allen Street	\N	Glen Waverly	Victoria	3150	Australia	1611	60300
473	Frau da Collezione	Ricotti	Franco	+39 022515555	20093 Cologno Monzese, via Alessandro Volta 16	\N	Milan	\N		Italy	1401	34800
475	West Coast Collectables Co.	Thompson	Steve	3105553722	3675 Furth Circle	\N	Burbank	CA	94019	USA	1166	55400
477	Mit Vergn¸gen & Co.	Moos	Hanna	0621-08555	Forsterstr. 57	\N	Mannheim	\N	68306	Germany	\N	0
480	Kremlin Collectables, Co.	Semenov	Alexander	+7 812 293 0521	2 Pobedy Square	\N	Saint Petersburg	\N	196143	Russia	\N	0
481	Raanan Stores, Inc	Altagar,G M	Raanan	+ 972 9 959 8555	3 Hagalim Blv.,	\N	Herzlia	\N	47625	Israel	\N	0
484	Iberia Gift Imports, Corp.	Roel	JosÈ Pedro	(95) 555 82 82	C/ Romero, 33	\N	Sevilla	\N	41101	Spain	1702	65700
486	Motor Mint Distributors Inc.	Hernandez	Rosa	2155559857	11328 Douglas Av.	\N	Philadelphia	PA	71270	USA	1323	72600
487	Signal Collectibles Ltd.	Taylor	Sue	4155554312	2793 Furth Circle	\N	Brisbane	CA	94217	USA	1165	60300
489	Double Decker Gift Stores, Ltd	Hardy	Thomas	(171) 555-7555	120 Hanover Sq.	\N	London	\N	WA1 1DP	UK	1501	43300
495	Diecast Collectables	Franco	Valarie	6175552555	6251 Ingle Ln.	\N	Boston	MA	51003	USA	1188	85100
496	Kelly's Gift Shop	Snowden	Tony	+64 9 5555500	Arenales 1938 3'A'	\N	Auckland	\N		New Zealand	1612	110000
\.


--
-- Data for Name: department_managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY department_managers (region, manager_name, email) FROM stdin;
Central	Joe Pentaho	joe@pentaho.org
Eastern	Suzy Pentaho	suzy@pentaho.org
Western	Pat Pentaho	pat@pentaho.org
Southern	Tiffany Pentaho	tiffany@pentaho.org
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) FROM stdin;
1002	Murphy	Diane	x5800	dmurphy@classicmodelcars.com	1	\N	President
1056	Patterson	Mary	x4611	mpatterso@classicmodelcars.com	1	1002	VP Sales
1076	Firrelli	Jeff	x9273	jfirrelli@classicmodelcars.com	1	1002	VP Marketing
1088	Patterson	William	x4871	wpatterson@classicmodelcars.com	6	1056	Sales Manager (JAPAN, APAC)
1102	Bondur	Gerard	x5408	athompson@classicmodelcars.com	4	1056	Sale Manager (EMEA)
1143	Bow	Anthony	x5428	bhoward@classicmodelcars.com	1	1056	Sales Manager (NA)
1165	Jennings	Leslie	x3291	ljennings@classicmodelcars.com	1	1143	Sales Rep
1166	Thompson	Leslie	x4065	lthompson@classicmodelcars.com	1	1143	Sales Rep
1188	Firrelli	Julie	x2173	jfirrelli@classicmodelcars.com	2	1143	Sales Rep
1216	Patterson	Steve	x4334	spatterso@classicmodelcars.com	2	1143	Sales Rep
1286	Tseng	Foon Yue	x2248	ftseng@classicmodelcars.com	3	1143	Sales Rep
1323	Vanauf	George	x4102	gvanauf@classicmodelcars.com	3	1143	Sales Rep
1337	Bondur	Loui	x6493	lbondur@classicmodelcars.com	4	1102	Sales Rep
1370	Hernandez	Gerard	x2028	ghernande@classicmodelcars.com	4	1102	Sales Rep
1401	Castillo	Pamela	x2759	pcastillo@classicmodelcars.com	4	1102	Sales Rep
1501	Bott	Larry	x2311	lbott@classicmodelcars.com	7	1102	Sales Rep
1504	Jones	Barry	x102	bjones@classicmodelcars.com	7	1102	Sales Rep
1611	Fixter	Andy	x101	afixter@classicmodelcars.com	6	1088	Sales Rep
1612	Marsh	Peter	x102	pmarsh@classicmodelcars.com	6	1088	Sales Rep
1619	King	Tom	x103	tking@classicmodelcars.com	6	1088	Sales Rep
1621	Nishi	Mami	x101	mnishi@classicmodelcars.com	5	1088	Sales Rep
1625	Kato	Yoshimi	x102	ekato@classicmodelcars.com	5	1088	Sales Rep
1702	Gerard	Martin	x2312	gmartin@classicmodelcars.com	4	1102	Sales Rep
\.


--
-- Data for Name: offices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY offices (officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory) FROM stdin;
1	San Francisco	+1 650 219 4782	100 Market Street	Suite 300	CA	USA	94080	NA
2	Boston	+1 215 837 0825	1550 Court Place	Suite 102	MA	USA	02107	NA
3	NYC	+1 212 555 3000	523 East 53rd Street	apt. 5A	NY	USA	10022	NA
4	Paris	+33 14 723 4404	43 Rue Jouffroy D'abbans	\N		France	75017	EMEA
5	Tokyo	+81 33 224 5000	4-1 Kioicho	\N	Chiyoda-Ku	Japan	102-8578	Japan
6	Sydney	+61 2 9264 2451	5-11 Wentworth Avenue	Floor #2	\N	Australia	NSW 2010	APAC
7	London	+44 20 7877 2041	25 Old Broad Street	Level 7	\N	UK	EC2N 1HN	EMEA
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orderdetails (ordernumber, productcode, quantityordered, priceeach, orderlinenumber) FROM stdin;
10100	S18_1749	30	172	3
10100	S18_2248	50	68	2
10100	S18_4409	22	87	4
10100	S24_3969	49	34	1
10101	S18_2325	25	151	4
10101	S18_2795	26	145	1
10101	S24_1937	45	31	3
10101	S24_2022	46	54	2
10102	S18_1342	39	123	2
10102	S18_1367	41	50	1
10103	S10_1949	26	208	11
10103	S10_4962	42	129	4
10103	S12_1666	27	126	8
10103	S18_1097	35	112	10
10103	S18_2432	22	54	2
10103	S18_2949	27	83	12
10103	S18_2957	35	57	14
10103	S18_3136	25	102	13
10103	S18_3320	46	104	16
10103	S18_4600	36	117	5
10103	S18_4668	41	47	9
10103	S24_2300	36	102	1
10103	S24_4258	25	115	15
10103	S32_1268	31	104	3
10103	S32_3522	45	76	7
10103	S700_2824	42	106	6
10104	S12_3148	34	175	1
10104	S12_4473	41	113	9
10104	S18_2238	24	144	8
10104	S18_2319	29	130	12
10104	S18_3232	23	198	13
10104	S18_4027	38	141	3
10104	S24_1444	35	55	6
10104	S24_2840	44	40	10
10104	S24_4048	26	112	5
10104	S32_2509	35	48	11
10104	S32_3207	49	66	4
10104	S50_1392	33	112	7
10104	S50_1514	32	53	2
10105	S10_4757	50	144	2
10105	S12_1108	41	212	15
10105	S12_3891	29	157	14
10105	S18_3140	22	139	11
10105	S18_3259	38	114	13
10105	S18_4522	41	83	10
10105	S24_2011	43	147	9
10105	S24_3151	44	73	4
10105	S24_3816	50	80	1
10105	S700_1138	41	71	5
10105	S700_1938	29	70	12
10105	S700_2610	31	66	3
10105	S700_3505	39	81	6
10105	S700_3962	22	116	7
10105	S72_3212	25	57	8
10106	S18_1662	36	147	12
10106	S18_2581	34	90	2
10106	S18_3029	41	83	18
10106	S18_3856	41	116	17
10106	S24_1785	28	89	4
10106	S24_2841	49	75	13
10106	S24_3420	31	53	14
10106	S24_3949	50	65	11
10106	S24_4278	26	64	3
10106	S32_4289	33	73	5
10106	S50_1341	39	40	6
10106	S700_1691	31	107	7
10106	S700_2047	30	106	16
10106	S700_2466	34	111	9
10106	S700_2834	32	125	1
10106	S700_3167	44	74	8
10106	S700_4002	48	61	10
10106	S72_1253	48	53	15
10107	S10_1678	30	96	2
10107	S10_2016	39	100	5
10107	S10_4698	27	225	4
10107	S12_2823	21	145	1
10107	S18_2625	29	71	6
10107	S24_1578	25	114	3
10107	S24_2000	38	83	7
10107	S32_1374	20	93	8
10108	S12_1099	33	160	6
10108	S12_3380	45	136	4
10108	S12_3990	39	89	7
10108	S12_4675	36	104	3
10108	S18_1889	38	82	2
10108	S18_3278	26	68	9
10108	S18_3482	29	140	8
10108	S18_3782	43	68	12
10108	S18_4721	44	126	11
10108	S24_2360	35	59	15
10108	S24_3371	30	63	5
10108	S24_3856	40	136	1
10108	S24_4620	31	69	10
10108	S32_2206	27	43	13
10108	S32_4485	31	118	16
10108	S50_4713	34	83	14
10109	S18_1129	26	168	4
10109	S18_1984	38	117	3
10109	S18_2870	26	121	1
10109	S18_3232	46	180	5
10109	S18_3685	47	133	2
10109	S24_2972	29	32	6
10110	S18_1589	37	147	16
10110	S18_1749	42	145	7
10110	S18_2248	32	50	6
10110	S18_2325	33	117	4
10110	S18_2795	31	164	1
10110	S18_4409	28	89	8
10110	S18_4933	42	61	9
10110	S24_1046	36	85	13
10110	S24_1628	29	59	15
10110	S24_1937	20	36	3
10110	S24_2022	39	44	2
10110	S24_2766	43	78	11
10110	S24_2887	46	129	10
10110	S24_3191	27	74	12
10110	S24_3432	37	101	14
10110	S24_3969	48	34	5
10111	S18_1342	33	100	6
10111	S18_1367	48	49	5
10111	S18_2957	28	64	2
10111	S18_3136	43	112	1
10111	S18_3320	39	107	4
10111	S24_4258	26	87	3
10112	S10_1949	29	249	1
10112	S18_2949	23	110	2
10113	S12_1666	21	163	2
10113	S18_1097	49	100	4
10113	S18_4668	50	50	3
10113	S32_3522	23	69	1
10114	S10_4962	31	139	8
10114	S18_2319	39	107	3
10114	S18_2432	45	69	6
10114	S18_3232	48	171	4
10114	S18_4600	41	117	9
10114	S24_2300	21	139	5
10114	S24_2840	24	30	1
10114	S32_1268	32	115	7
10114	S32_2509	28	56	2
10114	S700_2824	42	113	10
10115	S12_4473	46	124	5
10115	S18_2238	46	160	4
10115	S24_1444	47	69	2
10115	S24_4048	44	127	1
10115	S50_1392	27	105	3
10116	S32_3207	27	63	1
10117	S12_1108	33	183	9
10117	S12_3148	43	137	10
10117	S12_3891	39	152	8
10117	S18_3140	26	137	5
10117	S18_3259	21	96	7
10117	S18_4027	22	126	12
10117	S18_4522	23	97	4
10117	S24_2011	41	127	3
10117	S50_1514	21	49	11
10117	S700_1938	38	80	6
10117	S700_3962	45	83	1
10117	S72_3212	50	44	2
10118	S700_3505	36	117	1
10119	S10_4757	46	109	11
10119	S18_1662	43	161	3
10119	S18_3029	21	89	9
10119	S18_3856	27	100	8
10119	S24_2841	41	60	4
10119	S24_3151	35	88	13
10119	S24_3420	20	73	5
10119	S24_3816	35	91	10
10119	S24_3949	28	70	2
10119	S700_1138	25	77	14
10119	S700_2047	29	94	7
10119	S700_2610	38	66	12
10119	S700_4002	26	59	1
10119	S72_1253	28	48	6
10120	S10_2016	29	96	3
10120	S10_4698	46	201	2
10120	S18_2581	29	72	8
10120	S18_2625	46	58	4
10120	S24_1578	35	98	1
10120	S24_1785	39	119	10
10120	S24_2000	34	84	5
10120	S24_4278	29	85	9
10120	S32_1374	22	112	6
10120	S32_4289	29	72	11
10120	S50_1341	49	51	12
10120	S700_1691	47	82	13
10120	S700_2466	24	108	15
10120	S700_2834	24	142	7
10120	S700_3167	43	76	14
10121	S10_1678	34	81	5
10121	S12_2823	50	166	4
10121	S24_2360	32	77	2
10121	S32_4485	25	87	3
10121	S50_4713	44	75	1
10122	S12_1099	42	181	10
10122	S12_3380	37	100	8
10122	S12_3990	32	64	11
10122	S12_4675	20	107	7
10122	S18_1129	34	147	2
10122	S18_1889	43	72	6
10122	S18_1984	31	132	1
10122	S18_3232	25	144	3
10122	S18_3278	21	73	13
10122	S18_3482	21	118	12
10122	S18_3782	35	50	16
10122	S18_4721	28	128	15
10122	S24_2972	39	31	4
10122	S24_3371	34	50	9
10122	S24_3856	43	128	5
10122	S24_4620	29	71	14
10122	S32_2206	31	45	17
10123	S18_1589	26	118	2
10123	S18_2870	46	112	3
10123	S18_3685	34	157	4
10123	S24_1628	50	60	1
10124	S18_1749	21	136	6
10124	S18_2248	42	54	5
10124	S18_2325	42	106	3
10124	S18_4409	36	86	7
10124	S18_4933	23	58	8
10124	S24_1046	22	78	12
10124	S24_1937	45	38	2
10124	S24_2022	22	45	1
10124	S24_2766	32	73	10
10124	S24_2887	25	94	9
10124	S24_3191	49	83	11
10124	S24_3432	43	121	13
10124	S24_3969	46	33	4
10125	S18_1342	32	102	1
10125	S18_2795	34	191	2
10126	S10_1949	38	193	11
10126	S10_4962	22	152	4
10126	S12_1666	21	116	8
10126	S18_1097	38	102	10
10126	S18_1367	42	55	17
10126	S18_2432	43	65	2
10126	S18_2949	31	90	12
10126	S18_2957	46	74	14
10126	S18_3136	30	97	13
10126	S18_3320	38	82	16
10126	S18_4600	50	142	5
10126	S18_4668	43	54	9
10126	S24_2300	27	127	1
10126	S24_4258	34	105	15
10126	S32_1268	43	96	3
10126	S32_3522	26	63	7
10126	S700_2824	45	102	6
10127	S12_1108	46	245	2
10127	S12_3148	46	160	3
10127	S12_3891	42	194	1
10127	S12_4473	24	107	11
10127	S18_2238	45	159	10
10127	S18_2319	45	140	14
10127	S18_3232	22	174	15
10127	S18_4027	25	138	5
10127	S24_1444	20	61	8
10127	S24_2840	39	38	12
10127	S24_4048	20	97	7
10127	S32_2509	45	52	13
10127	S32_3207	29	71	6
10127	S50_1392	46	134	9
10127	S50_1514	46	69	4
10128	S18_3140	41	135	2
10128	S18_3259	41	118	4
10128	S18_4522	43	92	1
10128	S700_1938	32	97	3
10129	S10_4757	33	133	2
10129	S24_2011	45	134	9
10129	S24_3151	41	95	4
10129	S24_3816	50	78	1
10129	S700_1138	31	60	5
10129	S700_2610	45	85	3
10129	S700_3505	42	91	6
10129	S700_3962	30	85	7
10129	S72_3212	32	65	8
10130	S18_3029	40	96	2
10130	S18_3856	33	104	1
10131	S18_1662	21	132	4
10131	S24_2841	35	67	5
10131	S24_3420	29	59	6
10131	S24_3949	50	82	3
10131	S700_2047	22	86	8
10131	S700_2466	40	111	1
10131	S700_4002	26	85	2
10131	S72_1253	21	42	7
10132	S700_3167	36	69	1
10133	S18_2581	49	69	3
10133	S24_1785	41	94	5
10133	S24_4278	46	78	4
10133	S32_1374	23	115	1
10133	S32_4289	49	57	6
10133	S50_1341	27	50	7
10133	S700_1691	24	78	8
10133	S700_2834	27	100	2
10134	S10_1678	41	95	2
10134	S10_2016	27	123	5
10134	S10_4698	31	227	4
10134	S12_2823	20	136	1
10134	S18_2625	30	62	6
10134	S24_1578	35	94	3
10134	S24_2000	43	83	7
10135	S12_1099	42	191	7
10135	S12_3380	48	126	5
10135	S12_3990	24	75	8
10135	S12_4675	29	98	4
10135	S18_1889	48	79	3
10135	S18_3278	45	78	10
10135	S18_3482	42	129	9
10135	S18_3782	45	50	13
10135	S18_4721	31	152	12
10135	S24_2360	29	62	16
10135	S24_2972	20	36	1
10135	S24_3371	27	66	6
10135	S24_3856	47	135	2
10135	S24_4620	23	87	11
10135	S32_2206	33	40	14
10135	S32_4485	30	90	17
10135	S50_4713	44	96	15
10136	S18_1129	25	146	2
10136	S18_1984	36	147	1
10136	S18_3232	41	203	3
10137	S18_1589	44	100	2
10137	S18_2870	37	117	3
10137	S18_3685	31	165	4
10137	S24_1628	26	50	1
10138	S18_1749	33	162	6
10138	S18_2248	22	48	5
10138	S18_2325	38	108	3
10138	S18_4409	47	100	7
10138	S18_4933	23	67	8
10138	S24_1046	45	85	12
10138	S24_1937	22	29	2
10138	S24_2022	33	43	1
10138	S24_2766	28	105	10
10138	S24_2887	30	139	9
10138	S24_3191	49	91	11
10138	S24_3432	21	119	13
10138	S24_3969	29	38	4
10139	S18_1342	31	103	7
10139	S18_1367	49	43	6
10139	S18_2795	41	194	8
10139	S18_2949	46	121	1
10139	S18_2957	20	71	3
10139	S18_3136	20	90	2
10139	S18_3320	30	103	5
10139	S24_4258	29	113	4
10140	S10_1949	37	199	11
10140	S10_4962	26	123	4
10140	S12_1666	38	127	8
10140	S18_1097	32	131	10
10140	S18_2432	46	62	2
10140	S18_4600	40	115	5
10140	S18_4668	29	43	9
10140	S24_2300	47	109	1
10140	S32_1268	26	109	3
10140	S32_3522	28	61	7
10140	S700_2824	36	114	6
10141	S12_4473	21	102	5
10141	S18_2238	39	152	4
10141	S18_2319	47	134	8
10141	S18_3232	34	142	9
10141	S24_1444	20	54	2
10141	S24_2840	21	42	6
10141	S24_4048	40	95	1
10141	S32_2509	24	46	7
10141	S50_1392	44	125	3
10142	S12_1108	33	243	12
10142	S12_3148	33	151	13
10142	S12_3891	46	206	11
10142	S18_3140	47	128	8
10142	S18_3259	22	98	10
10142	S18_4027	24	158	15
10142	S18_4522	24	70	7
10142	S24_2011	33	102	6
10142	S24_3151	49	98	1
10142	S32_3207	42	75	16
10142	S50_1514	42	50	14
10142	S700_1138	41	64	2
10142	S700_1938	43	84	9
10142	S700_3505	21	111	3
10142	S700_3962	38	85	4
10142	S72_3212	39	44	5
10143	S10_4757	49	114	15
10143	S18_1662	32	164	7
10143	S18_3029	46	75	13
10143	S18_3856	34	102	12
10143	S24_2841	27	61	8
10143	S24_3420	33	78	9
10143	S24_3816	23	81	14
10143	S24_3949	28	66	6
10143	S50_1341	34	37	1
10143	S700_1691	36	110	2
10143	S700_2047	26	100	11
10143	S700_2466	26	83	4
10143	S700_2610	31	85	16
10143	S700_3167	28	96	3
10143	S700_4002	34	86	5
10143	S72_1253	37	51	10
10144	S32_4289	20	82	1
10145	S10_1678	45	83	6
10145	S10_2016	37	140	9
10145	S10_4698	33	157	8
10145	S12_2823	49	170	5
10145	S18_2581	30	85	14
10145	S18_2625	30	50	10
10145	S24_1578	43	96	7
10145	S24_1785	40	88	16
10145	S24_2000	47	83	11
10145	S24_2360	27	61	3
10145	S24_4278	33	85	15
10145	S32_1374	33	94	12
10145	S32_2206	31	36	1
10145	S32_4485	27	120	4
10145	S50_4713	38	81	2
10145	S700_2834	20	138	13
10146	S18_3782	47	67	2
10146	S18_4721	29	153	1
10147	S12_1099	48	193	7
10147	S12_3380	31	113	5
10147	S12_3990	21	64	8
10147	S12_4675	33	98	4
10147	S18_1889	26	82	3
10147	S18_3278	36	86	10
10147	S18_3482	37	119	9
10147	S24_2972	25	43	1
10147	S24_3371	30	69	6
10147	S24_3856	23	126	2
10147	S24_4620	31	65	11
10148	S18_1129	23	117	13
10148	S18_1589	47	124	9
10148	S18_1984	25	169	12
10148	S18_2870	27	131	10
10148	S18_3232	32	169	14
10148	S18_3685	28	130	11
10148	S18_4409	34	106	1
10148	S18_4933	29	81	2
10148	S24_1046	25	60	6
10148	S24_1628	47	57	8
10148	S24_2766	21	74	4
10148	S24_2887	34	129	3
10148	S24_3191	31	74	5
10148	S24_3432	27	129	7
10149	S18_1342	50	118	4
10149	S18_1367	30	58	3
10149	S18_1749	34	158	11
10149	S18_2248	24	62	10
10149	S18_2325	33	150	8
10149	S18_2795	23	184	5
10149	S18_3320	42	94	2
10149	S24_1937	36	33	7
10149	S24_2022	49	49	6
10149	S24_3969	26	39	9
10149	S24_4258	20	91	1
10150	S10_1949	45	244	8
10150	S10_4962	20	160	1
10150	S12_1666	30	137	5
10150	S18_1097	34	137	7
10150	S18_2949	47	91	9
10150	S18_2957	30	50	11
10150	S18_3136	26	108	10
10150	S18_4600	49	132	2
10150	S18_4668	30	43	6
10150	S32_3522	49	58	4
10150	S700_2824	20	105	3
10151	S12_4473	24	139	3
10151	S18_2238	43	165	2
10151	S18_2319	49	110	6
10151	S18_2432	39	69	9
10151	S18_3232	21	178	7
10151	S24_2300	42	121	8
10151	S24_2840	30	40	4
10151	S32_1268	27	114	10
10151	S32_2509	41	64	5
10151	S50_1392	26	124	1
10152	S18_4027	35	129	1
10152	S24_1444	25	65	4
10152	S24_4048	23	122	3
10152	S32_3207	33	51	2
10153	S12_1108	20	245	11
10153	S12_3148	42	128	12
10153	S12_3891	49	144	10
10153	S18_3140	31	117	7
10153	S18_3259	29	89	9
10153	S18_4522	22	83	6
10153	S24_2011	40	136	5
10153	S50_1514	31	57	13
10153	S700_1138	43	65	1
10153	S700_1938	31	87	8
10153	S700_3505	50	88	2
10153	S700_3962	20	110	3
10153	S72_3212	50	60	4
10154	S24_3151	31	91	2
10154	S700_2610	36	64	1
10155	S10_4757	32	141	13
10155	S18_1662	38	172	5
10155	S18_3029	44	79	11
10155	S18_3856	29	125	10
10155	S24_2841	23	73	6
10155	S24_3420	34	56	7
10155	S24_3816	37	68	12
10155	S24_3949	44	77	4
10155	S700_2047	32	91	9
10155	S700_2466	20	118	2
10155	S700_3167	43	86	1
10155	S700_4002	44	86	3
10155	S72_1253	34	49	8
10156	S50_1341	20	41	1
10156	S700_1691	48	103	2
10157	S18_2581	33	79	3
10157	S24_1785	40	103	5
10157	S24_4278	33	86	4
10157	S32_1374	34	119	1
10157	S32_4289	28	75	6
10157	S700_2834	48	125	2
10158	S24_2000	22	67	1
10159	S10_1678	49	106	14
10159	S10_2016	37	136	17
10159	S10_4698	22	188	16
10159	S12_1099	41	202	2
10159	S12_2823	38	164	13
10159	S12_3990	24	73	3
10159	S18_2625	42	51	18
10159	S18_3278	21	81	5
10159	S18_3482	25	146	4
10159	S18_3782	21	65	8
10159	S18_4721	32	144	7
10159	S24_1578	44	122	15
10159	S24_2360	27	80	11
10159	S24_3371	50	70	1
10159	S24_4620	23	67	6
10159	S32_2206	35	35	9
10159	S32_4485	23	102	12
10159	S50_4713	31	72	10
10160	S12_3380	46	115	6
10160	S12_4675	50	104	5
10160	S18_1889	38	89	4
10160	S18_3232	20	200	1
10160	S24_2972	42	37	2
10160	S24_3856	35	136	3
10161	S18_1129	28	134	12
10161	S18_1589	43	143	8
10161	S18_1984	48	128	11
10161	S18_2870	23	139	9
10161	S18_3685	36	154	10
10161	S18_4933	25	81	1
10161	S24_1046	37	73	5
10161	S24_1628	23	53	7
10161	S24_2766	20	107	3
10161	S24_2887	25	110	2
10161	S24_3191	20	77	4
10161	S24_3432	30	105	6
10162	S18_1342	48	91	2
10162	S18_1367	45	51	1
10162	S18_1749	29	179	9
10162	S18_2248	27	70	8
10162	S18_2325	38	113	6
10162	S18_2795	48	150	3
10162	S18_4409	39	100	10
10162	S24_1937	37	27	5
10162	S24_2022	43	36	4
10162	S24_3969	37	39	7
10163	S10_1949	21	231	1
10163	S18_2949	31	107	2
10163	S18_2957	48	70	4
10163	S18_3136	40	123	3
10163	S18_3320	43	116	6
10163	S24_4258	42	92	5
10164	S10_4962	21	168	2
10164	S12_1666	49	134	6
10164	S18_1097	36	99	8
10164	S18_4600	45	111	3
10164	S18_4668	25	54	7
10164	S32_1268	24	110	1
10164	S32_3522	49	55	5
10164	S700_2824	39	82	4
10165	S12_1108	44	195	3
10165	S12_3148	34	144	4
10165	S12_3891	27	206	2
10165	S12_4473	48	142	12
10165	S18_2238	29	174	11
10165	S18_2319	46	130	15
10165	S18_2432	31	71	18
10165	S18_3232	47	186	16
10165	S18_3259	50	107	1
10165	S18_4027	28	119	6
10165	S24_1444	25	69	9
10165	S24_2300	32	146	17
10165	S24_2840	27	32	13
10165	S24_4048	24	99	8
10165	S32_2509	48	46	14
10165	S32_3207	44	53	7
10165	S50_1392	48	95	10
10165	S50_1514	38	67	5
10166	S18_3140	43	161	2
10166	S18_4522	26	74	1
10166	S700_1938	29	104	3
10167	S10_4757	44	135	9
10167	S18_1662	43	134	1
10167	S18_3029	46	73	7
10167	S18_3856	34	106	6
10167	S24_2011	33	116	16
10167	S24_2841	21	70	2
10167	S24_3151	20	80	11
10167	S24_3420	32	63	3
10167	S24_3816	29	84	8
10167	S700_1138	43	75	12
10167	S700_2047	29	101	5
10167	S700_2610	46	70	10
10167	S700_3505	24	117	13
10167	S700_3962	28	107	14
10167	S72_1253	40	42	4
10167	S72_3212	38	49	15
10168	S10_1678	36	97	1
10168	S10_2016	27	136	4
10168	S10_4698	20	209	3
10168	S18_2581	21	71	9
10168	S18_2625	46	61	5
10168	S24_1578	50	115	2
10168	S24_1785	49	131	11
10168	S24_2000	29	75	6
10168	S24_3949	27	73	18
10168	S24_4278	48	78	10
10168	S32_1374	28	116	7
10168	S32_4289	31	74	12
10168	S50_1341	48	52	13
10168	S700_1691	28	99	14
10168	S700_2466	31	111	16
10168	S700_2834	36	126	8
10168	S700_3167	48	96	15
10168	S700_4002	39	83	17
10169	S12_1099	30	167	2
10169	S12_2823	35	133	13
10169	S12_3990	36	64	3
10169	S18_3278	32	71	5
10169	S18_3482	36	123	4
10169	S18_3782	38	68	8
10169	S18_4721	33	149	7
10169	S24_2360	38	74	11
10169	S24_3371	34	50	1
10169	S24_4620	24	95	6
10169	S32_2206	26	40	9
10169	S32_4485	34	115	12
10169	S50_4713	48	81	10
10170	S12_3380	47	116	4
10170	S12_4675	41	107	3
10170	S18_1889	20	63	2
10170	S24_3856	34	112	1
10171	S18_1129	35	129	2
10171	S18_1984	35	134	1
10171	S18_3232	39	141	3
10171	S24_2972	36	35	4
10172	S18_1589	42	118	6
10172	S18_2870	39	154	7
10172	S18_3685	48	114	8
10172	S24_1046	32	76	3
10172	S24_1628	34	43	5
10172	S24_2766	22	75	1
10172	S24_3191	24	81	2
10172	S24_3432	22	99	4
10173	S18_1342	43	117	6
10173	S18_1367	48	44	5
10173	S18_1749	24	146	13
10173	S18_2248	26	58	12
10173	S18_2325	31	145	10
10173	S18_2795	22	157	7
10173	S18_2957	28	54	2
10173	S18_3136	31	89	1
10173	S18_3320	29	95	4
10173	S18_4409	21	75	14
10173	S18_4933	39	72	15
10173	S24_1937	31	32	9
10173	S24_2022	27	41	8
10173	S24_2887	23	119	16
10173	S24_3969	35	33	11
10173	S24_4258	22	117	3
10174	S10_1949	34	236	4
10174	S12_1666	43	159	1
10174	S18_1097	48	93	3
10174	S18_2949	46	122	5
10174	S18_4668	49	45	2
10175	S10_4962	33	163	9
10175	S12_4473	26	136	1
10175	S18_2319	48	123	4
10175	S18_2432	41	69	7
10175	S18_3232	29	152	5
10175	S18_4600	47	109	10
10175	S24_2300	28	106	6
10175	S24_2840	37	31	2
10175	S32_1268	22	111	8
10175	S32_2509	50	63	3
10175	S32_3522	29	75	12
10175	S700_2824	42	86	11
10176	S12_1108	33	227	2
10176	S12_3148	47	178	3
10176	S12_3891	50	157	1
10176	S18_2238	20	183	10
10176	S18_4027	36	154	5
10176	S24_1444	27	69	8
10176	S24_4048	29	101	7
10176	S32_3207	22	64	6
10176	S50_1392	23	135	9
10176	S50_1514	38	64	4
10177	S18_3140	23	160	9
10177	S18_3259	29	106	11
10177	S18_4522	35	75	8
10177	S24_2011	50	122	7
10177	S24_3151	45	73	2
10177	S700_1138	24	76	3
10177	S700_1938	31	88	10
10177	S700_2610	32	77	1
10177	S700_3505	44	92	4
10177	S700_3962	24	105	5
10177	S72_3212	40	50	6
10178	S10_4757	24	146	12
10178	S18_1662	42	155	4
10178	S18_3029	41	82	10
10178	S18_3856	48	112	9
10178	S24_2841	34	81	5
10178	S24_3420	27	74	6
10178	S24_3816	21	72	11
10178	S24_3949	30	72	3
10178	S700_2047	34	97	8
10178	S700_2466	22	88	1
10178	S700_4002	45	76	2
10178	S72_1253	45	51	7
10179	S18_2581	24	79	3
10179	S24_1785	47	125	5
10179	S24_4278	27	85	4
10179	S32_1374	45	120	1
10179	S32_4289	24	72	6
10179	S50_1341	34	43	7
10179	S700_1691	23	108	8
10179	S700_2834	25	106	2
10179	S700_3167	39	69	9
10180	S10_1678	29	86	9
10180	S10_2016	42	112	12
10180	S10_4698	41	217	11
10180	S12_2823	40	169	8
10180	S18_2625	25	64	13
10180	S18_3782	21	50	3
10180	S18_4721	44	126	2
10180	S24_1578	48	112	10
10180	S24_2000	28	69	14
10180	S24_2360	35	72	6
10180	S24_4620	28	71	1
10180	S32_2206	34	45	4
10180	S32_4485	22	114	7
10180	S50_4713	21	94	5
10181	S12_1099	27	200	14
10181	S12_3380	28	102	12
10181	S12_3990	20	81	15
10181	S12_4675	36	124	11
10181	S18_1129	44	123	6
10181	S18_1589	42	129	2
10181	S18_1889	22	74	10
10181	S18_1984	21	156	5
10181	S18_2870	27	144	3
10181	S18_3232	45	141	7
10181	S18_3278	30	83	17
10181	S18_3482	22	154	16
10181	S18_3685	39	148	4
10181	S24_1628	34	54	1
10181	S24_2972	37	43	8
10181	S24_3371	23	66	13
10181	S24_3856	25	154	9
10182	S18_1342	25	87	3
10182	S18_1367	32	54	2
10182	S18_1749	44	172	10
10182	S18_2248	38	61	9
10182	S18_2325	20	111	7
10182	S18_2795	21	145	4
10182	S18_3320	33	86	1
10182	S18_4409	36	110	11
10182	S18_4933	44	70	12
10182	S24_1046	47	74	16
10182	S24_1937	39	37	6
10182	S24_2022	31	37	5
10182	S24_2766	36	74	14
10182	S24_2887	20	120	13
10182	S24_3191	33	94	15
10182	S24_3432	49	127	17
10182	S24_3969	23	42	8
10183	S10_1949	23	234	8
10183	S10_4962	28	123	1
10183	S12_1666	41	150	5
10183	S18_1097	21	97	7
10183	S18_2949	37	89	9
10183	S18_2957	39	68	11
10183	S18_3136	22	113	10
10183	S18_4600	21	116	2
10183	S18_4668	40	49	6
10183	S24_4258	47	107	12
10183	S32_3522	49	65	4
10183	S700_2824	23	87	3
10184	S12_4473	37	122	6
10184	S18_2238	46	160	5
10184	S18_2319	46	130	9
10184	S18_2432	44	60	12
10184	S18_3232	28	157	10
10184	S24_1444	31	60	3
10184	S24_2300	24	146	11
10184	S24_2840	42	32	7
10184	S24_4048	49	118	2
10184	S32_1268	46	100	13
10184	S32_2509	33	63	8
10184	S32_3207	48	51	1
10184	S50_1392	45	110	4
10185	S12_1108	21	185	13
10185	S12_3148	33	122	14
10185	S12_3891	43	183	12
10185	S18_3140	28	123	9
10185	S18_3259	49	81	11
10185	S18_4027	39	131	16
10185	S18_4522	47	77	8
10185	S24_2011	30	106	7
10185	S24_3151	33	74	2
10185	S50_1514	20	49	15
10185	S700_1138	21	54	3
10185	S700_1938	30	94	10
10185	S700_2610	39	58	1
10185	S700_3505	37	105	4
10185	S700_3962	22	79	5
10185	S72_3212	28	64	6
10186	S10_4757	26	148	9
10186	S18_1662	32	188	1
10186	S18_3029	32	89	7
10186	S18_3856	46	107	6
10186	S24_2841	22	69	2
10186	S24_3420	21	69	3
10186	S24_3816	36	86	8
10186	S700_2047	24	100	5
10186	S72_1253	28	52	4
10187	S18_2581	45	94	1
10187	S24_1785	46	95	3
10187	S24_3949	43	58	10
10187	S24_4278	33	59	2
10187	S32_4289	31	61	4
10187	S50_1341	41	39	5
10187	S700_1691	34	92	6
10187	S700_2466	44	106	8
10187	S700_3167	34	88	7
10187	S700_4002	44	72	9
10188	S10_1678	48	115	1
10188	S10_2016	38	96	4
10188	S10_4698	45	194	3
10188	S18_2625	32	65	5
10188	S24_1578	25	101	2
10188	S24_2000	40	91	6
10188	S32_1374	44	99	7
10188	S700_2834	29	136	8
10189	S12_2823	28	161	1
10190	S24_2360	42	76	3
10190	S32_2206	46	33	1
10190	S32_4485	42	86	4
10190	S50_4713	40	67	2
10191	S12_1099	21	183	3
10191	S12_3380	40	140	1
10191	S12_3990	30	65	4
10191	S18_3278	36	95	6
10191	S18_3482	23	148	5
10191	S18_3782	43	73	9
10191	S18_4721	32	132	8
10191	S24_3371	48	60	2
10191	S24_4620	44	66	7
10192	S12_4675	27	131	16
10192	S18_1129	22	150	11
10192	S18_1589	29	147	7
10192	S18_1889	45	91	15
10192	S18_1984	47	158	10
10192	S18_2870	38	131	8
10192	S18_3232	26	151	12
10192	S18_3685	45	119	9
10192	S24_1046	37	70	4
10192	S24_1628	47	54	6
10192	S24_2766	46	84	2
10192	S24_2887	23	133	1
10192	S24_2972	30	31	13
10192	S24_3191	32	73	3
10192	S24_3432	46	121	5
10192	S24_3856	45	140	14
10193	S18_1342	28	111	7
10193	S18_1367	46	53	6
10193	S18_1749	21	150	14
10193	S18_2248	42	59	13
10193	S18_2325	44	106	11
10193	S18_2795	22	167	8
10193	S18_2949	28	93	1
10193	S18_2957	24	52	3
10193	S18_3136	23	120	2
10193	S18_3320	32	79	5
10193	S18_4409	24	98	15
10193	S18_4933	25	76	16
10193	S24_1937	26	29	10
10193	S24_2022	20	51	9
10193	S24_3969	22	41	12
10193	S24_4258	20	114	4
10194	S10_1949	42	174	11
10194	S10_4962	26	164	4
10194	S12_1666	38	130	8
10194	S18_1097	21	93	10
10194	S18_2432	45	70	2
10194	S18_4600	32	133	5
10194	S18_4668	41	45	9
10194	S24_2300	49	118	1
10194	S32_1268	37	97	3
10194	S32_3522	39	55	7
10194	S700_2824	26	89	6
10195	S12_4473	49	132	6
10195	S18_2238	27	190	5
10195	S18_2319	35	103	9
10195	S18_3232	50	152	10
10195	S24_1444	44	66	3
10195	S24_2840	32	28	7
10195	S24_4048	34	109	2
10195	S32_2509	32	43	8
10195	S32_3207	33	55	1
10195	S50_1392	49	105	4
10196	S12_1108	47	189	5
10196	S12_3148	24	159	6
10196	S12_3891	38	190	4
10196	S18_3140	49	141	1
10196	S18_3259	35	102	3
10196	S18_4027	27	168	8
10196	S50_1514	46	62	7
10196	S700_1938	50	94	2
10197	S10_4757	45	118	6
10197	S18_3029	46	88	4
10197	S18_3856	22	115	3
10197	S18_4522	50	102	14
10197	S24_2011	41	111	13
10197	S24_3151	47	83	8
10197	S24_3816	22	86	5
10197	S700_1138	23	65	9
10197	S700_2047	24	91	2
10197	S700_2610	50	79	7
10197	S700_3505	27	92	10
10197	S700_3962	35	93	11
10197	S72_1253	29	42	1
10197	S72_3212	42	50	12
10198	S18_1662	42	178	4
10198	S24_2841	48	68	5
10198	S24_3420	27	72	6
10198	S24_3949	43	66	3
10198	S700_2466	42	114	1
10198	S700_4002	40	64	2
10199	S50_1341	29	38	1
10199	S700_1691	48	83	2
10199	S700_3167	38	82	3
10200	S18_2581	28	93	3
10200	S24_1785	33	98	5
10200	S24_4278	39	72	4
10200	S32_1374	35	110	1
10200	S32_4289	27	67	6
10200	S700_2834	39	102	2
10201	S10_1678	22	99	2
10201	S10_2016	24	126	5
10201	S10_4698	49	165	4
10201	S12_2823	25	161	1
10201	S18_2625	30	65	6
10201	S24_1578	39	112	3
10201	S24_2000	25	74	7
10202	S18_3782	30	55	3
10202	S18_4721	43	137	2
10202	S24_2360	50	69	6
10202	S24_4620	50	87	1
10202	S32_2206	27	44	4
10202	S32_4485	31	102	7
10202	S50_4713	40	90	5
10203	S12_1099	20	197	8
10203	S12_3380	20	113	6
10203	S12_3990	44	83	9
10203	S12_4675	47	111	5
10203	S18_1889	45	85	4
10203	S18_3232	48	173	1
10203	S18_3278	33	86	11
10203	S18_3482	32	160	10
10203	S24_2972	21	37	2
10203	S24_3371	34	65	7
10203	S24_3856	47	149	3
10204	S18_1129	42	147	17
10204	S18_1589	40	101	13
10204	S18_1749	33	179	4
10204	S18_1984	38	169	16
10204	S18_2248	23	71	3
10204	S18_2325	26	123	1
10204	S18_2870	27	154	14
10204	S18_3685	35	164	15
10204	S18_4409	29	86	5
10204	S18_4933	45	76	6
10204	S24_1046	20	62	10
10204	S24_1628	45	50	12
10204	S24_2766	47	96	8
10204	S24_2887	42	101	7
10204	S24_3191	40	80	9
10204	S24_3432	48	91	11
10204	S24_3969	39	33	2
10205	S18_1342	36	104	2
10205	S18_1367	48	64	1
10205	S18_2795	40	187	3
10205	S24_1937	32	37	5
10205	S24_2022	24	38	4
10206	S10_1949	47	193	6
10206	S12_1666	28	145	3
10206	S18_1097	34	117	5
10206	S18_2949	37	90	7
10206	S18_2957	28	67	9
10206	S18_3136	30	119	8
10206	S18_3320	28	87	11
10206	S18_4668	21	53	4
10206	S24_4258	33	97	10
10206	S32_3522	36	59	2
10206	S700_2824	33	117	1
10207	S10_4962	31	131	15
10207	S12_4473	34	100	7
10207	S18_2238	44	160	6
10207	S18_2319	43	134	10
10207	S18_2432	37	70	13
10207	S18_3232	25	157	11
10207	S18_4027	40	154	1
10207	S18_4600	47	142	16
10207	S24_1444	49	47	4
10207	S24_2300	46	148	12
10207	S24_2840	42	30	8
10207	S24_4048	28	106	3
10207	S32_1268	49	81	14
10207	S32_2509	27	60	9
10207	S32_3207	45	57	2
10207	S50_1392	28	95	5
10208	S12_1108	46	187	13
10208	S12_3148	26	121	14
10208	S12_3891	20	156	12
10208	S18_3140	24	109	9
10208	S18_3259	48	117	11
10208	S18_4522	45	88	8
10208	S24_2011	35	123	7
10208	S24_3151	20	89	2
10208	S50_1514	30	66	15
10208	S700_1138	38	75	3
10208	S700_1938	40	81	10
10208	S700_2610	46	74	1
10208	S700_3505	37	120	4
10208	S700_3962	33	85	5
10208	S72_3212	42	64	6
10209	S10_4757	39	133	8
10209	S18_3029	28	101	6
10209	S18_3856	20	125	5
10209	S24_2841	43	82	1
10209	S24_3420	36	78	2
10209	S24_3816	22	90	7
10209	S700_2047	33	89	4
10209	S72_1253	48	45	3
10210	S10_2016	23	131	2
10210	S10_4698	34	180	1
10210	S18_1662	31	185	17
10210	S18_2581	50	77	7
10210	S18_2625	40	50	3
10210	S24_1785	27	98	9
10210	S24_2000	30	62	4
10210	S24_3949	29	70	16
10210	S24_4278	40	71	8
10210	S32_1374	46	80	5
10210	S32_4289	39	59	10
10210	S50_1341	43	41	11
10210	S700_1691	21	79	12
10210	S700_2466	26	100	14
10210	S700_2834	25	113	6
10210	S700_3167	31	86	13
10210	S700_4002	42	70	15
10211	S10_1678	41	115	14
10211	S12_1099	41	183	2
10211	S12_2823	36	133	13
10211	S12_3990	28	93	3
10211	S18_3278	35	78	5
10211	S18_3482	28	134	4
10211	S18_3782	46	54	8
10211	S18_4721	41	138	7
10211	S24_1578	25	90	15
10211	S24_2360	21	64	11
10211	S24_3371	48	49	1
10211	S24_4620	22	92	6
10211	S32_2206	41	42	9
10211	S32_4485	37	109	12
10211	S50_4713	40	81	10
10212	S12_3380	39	127	16
10212	S12_4675	33	127	15
10212	S18_1129	29	144	10
10212	S18_1589	38	118	6
10212	S18_1889	20	67	14
10212	S18_1984	41	118	9
10212	S18_2870	40	123	7
10212	S18_3232	40	139	11
10212	S18_3685	45	141	8
10212	S24_1046	41	82	3
10212	S24_1628	45	53	5
10212	S24_2766	45	88	1
10212	S24_2972	34	43	12
10212	S24_3191	27	80	2
10212	S24_3432	46	88	4
10212	S24_3856	49	142	13
10213	S18_4409	38	95	1
10213	S18_4933	25	83	2
10213	S24_2887	27	103	3
10214	S18_1749	30	199	7
10214	S18_2248	21	63	6
10214	S18_2325	27	133	4
10214	S18_2795	50	191	1
10214	S24_1937	20	34	3
10214	S24_2022	49	48	2
10214	S24_3969	44	35	5
10215	S10_1949	35	174	3
10215	S18_1097	46	112	2
10215	S18_1342	27	89	10
10215	S18_1367	33	43	9
10215	S18_2949	49	112	4
10215	S18_2957	31	59	6
10215	S18_3136	49	108	5
10215	S18_3320	41	111	8
10215	S18_4668	46	45	1
10215	S24_4258	39	91	7
10216	S12_1666	43	134	1
10217	S10_4962	48	146	4
10217	S18_2432	35	61	2
10217	S18_4600	38	119	5
10217	S24_2300	28	112	1
10217	S32_1268	21	107	3
10217	S32_3522	39	62	7
10217	S700_2824	31	88	6
10218	S18_2319	22	122	1
10218	S18_3232	34	135	2
10219	S12_4473	48	102	2
10219	S18_2238	43	196	1
10219	S24_2840	21	40	3
10219	S32_2509	35	55	4
10220	S12_1108	32	224	2
10220	S12_3148	30	157	3
10220	S12_3891	27	187	1
10220	S18_4027	50	165	5
10220	S24_1444	26	56	8
10220	S24_4048	37	136	7
10220	S32_3207	20	53	6
10220	S50_1392	37	108	9
10220	S50_1514	30	69	4
10221	S18_3140	33	134	3
10221	S18_3259	23	81	5
10221	S18_4522	39	90	2
10221	S24_2011	49	139	1
10221	S700_1938	23	97	4
10222	S10_4757	49	122	12
10222	S18_1662	49	142	4
10222	S18_3029	49	95	10
10222	S18_3856	45	86	9
10222	S24_2841	32	82	5
10222	S24_3151	47	71	14
10222	S24_3420	43	70	6
10222	S24_3816	46	81	11
10222	S24_3949	48	57	3
10222	S700_1138	31	63	15
10222	S700_2047	26	102	8
10222	S700_2466	37	88	1
10222	S700_2610	36	81	13
10222	S700_3505	38	110	16
10222	S700_3962	31	95	17
10222	S700_4002	43	74	2
10222	S72_1253	31	46	7
10222	S72_3212	36	63	18
10223	S10_1678	37	107	1
10223	S10_2016	47	115	4
10223	S10_4698	49	199	3
10223	S18_2581	47	101	9
10223	S18_2625	28	61	5
10223	S24_1578	32	91	2
10223	S24_1785	34	106	11
10223	S24_2000	38	69	6
10223	S24_4278	23	75	10
10223	S32_1374	21	118	7
10223	S32_4289	20	66	12
10223	S50_1341	41	46	13
10223	S700_1691	25	101	14
10223	S700_2834	29	110	8
10223	S700_3167	26	67	15
10224	S12_2823	43	142	6
10224	S18_3782	38	58	1
10224	S24_2360	37	80	4
10224	S32_2206	43	39	2
10224	S32_4485	30	111	5
10224	S50_4713	50	77	3
10225	S12_1099	27	167	9
10225	S12_3380	25	100	7
10225	S12_3990	37	77	10
10225	S12_4675	21	128	6
10225	S18_1129	32	142	1
10225	S18_1889	47	65	5
10225	S18_3232	43	149	2
10225	S18_3278	37	96	12
10225	S18_3482	27	169	11
10225	S18_4721	35	150	14
10225	S24_2972	42	37	3
10225	S24_3371	24	50	8
10225	S24_3856	40	114	4
10225	S24_4620	46	70	13
10226	S18_1589	38	110	4
10226	S18_1984	24	162	7
10226	S18_2870	24	135	5
10226	S18_3685	46	160	6
10226	S24_1046	21	60	1
10226	S24_1628	36	43	3
10226	S24_3432	48	92	2
10227	S18_1342	25	118	3
10227	S18_1367	31	49	2
10227	S18_1749	26	143	10
10227	S18_2248	28	51	9
10227	S18_2325	46	153	7
10227	S18_2795	29	192	4
10227	S18_3320	33	111	1
10227	S18_4409	34	105	11
10227	S18_4933	37	58	12
10227	S24_1937	42	29	6
10227	S24_2022	24	48	5
10227	S24_2766	47	88	14
10227	S24_2887	33	132	13
10227	S24_3191	40	80	15
10227	S24_3969	27	44	8
10228	S10_1949	29	223	2
10228	S18_1097	32	105	1
10228	S18_2949	24	104	3
10228	S18_2957	45	64	5
10228	S18_3136	31	103	4
10228	S24_4258	33	103	6
10229	S10_4962	50	129	9
10229	S12_1666	25	138	13
10229	S12_4473	36	126	1
10229	S18_2319	26	145	4
10229	S18_2432	28	60	7
10229	S18_3232	22	190	5
10229	S18_4600	41	115	10
10229	S18_4668	39	40	14
10229	S24_2300	48	119	6
10229	S24_2840	33	33	2
10229	S32_1268	25	112	8
10229	S32_2509	23	54	3
10229	S32_3522	30	73	12
10229	S700_2824	50	112	11
10230	S12_3148	43	163	1
10230	S18_2238	49	149	8
10230	S18_4027	42	172	3
10230	S24_1444	36	54	6
10230	S24_4048	45	105	5
10230	S32_3207	46	61	4
10230	S50_1392	34	117	7
10230	S50_1514	43	52	2
10231	S12_1108	42	199	2
10231	S12_3891	49	142	1
10232	S18_3140	22	164	6
10232	S18_3259	48	96	8
10232	S18_4522	23	90	5
10232	S24_2011	46	123	4
10232	S700_1938	26	88	7
10232	S700_3505	48	96	1
10232	S700_3962	35	82	2
10232	S72_3212	24	50	3
10233	S24_3151	40	95	2
10233	S700_1138	36	71	3
10233	S700_2610	29	82	1
10234	S10_4757	48	151	9
10234	S18_1662	50	189	1
10234	S18_3029	48	75	7
10234	S18_3856	39	126	6
10234	S24_2841	44	62	2
10234	S24_3420	25	57	3
10234	S24_3816	31	73	8
10234	S700_2047	29	88	5
10234	S72_1253	40	56	4
10235	S18_2581	24	76	3
10235	S24_1785	23	96	5
10235	S24_3949	33	60	12
10235	S24_4278	40	81	4
10235	S32_1374	41	102	1
10235	S32_4289	34	78	6
10235	S50_1341	41	35	7
10235	S700_1691	25	103	8
10235	S700_2466	38	89	10
10235	S700_2834	25	96	2
10235	S700_3167	32	92	9
10235	S700_4002	34	73	11
10236	S10_2016	22	130	1
10236	S18_2625	23	56	2
10236	S24_2000	36	88	3
10237	S10_1678	23	101	7
10237	S10_4698	39	180	9
10237	S12_2823	32	131	6
10237	S18_3782	26	52	1
10237	S24_1578	20	115	8
10237	S24_2360	26	80	4
10237	S32_2206	26	40	2
10237	S32_4485	27	115	5
10237	S50_4713	20	68	3
10238	S12_1099	28	206	3
10238	S12_3380	29	109	1
10238	S12_3990	20	74	4
10238	S18_3278	41	73	6
10238	S18_3482	49	134	5
10238	S18_4721	44	144	8
10238	S24_3371	47	62	2
10238	S24_4620	22	94	7
10239	S12_4675	21	93	5
10239	S18_1889	46	74	4
10239	S18_3232	47	151	1
10239	S24_2972	20	45	2
10239	S24_3856	29	154	3
10240	S18_1129	41	137	3
10240	S18_1984	37	149	2
10240	S18_3685	37	161	1
10241	S18_1589	21	119	11
10241	S18_1749	41	185	2
10241	S18_2248	33	73	1
10241	S18_2870	44	156	12
10241	S18_4409	42	90	3
10241	S18_4933	30	67	4
10241	S24_1046	22	76	8
10241	S24_1628	21	40	10
10241	S24_2766	47	95	6
10241	S24_2887	28	99	5
10241	S24_3191	26	81	7
10241	S24_3432	27	87	9
10242	S24_3969	46	37	1
10243	S18_2325	47	131	2
10243	S24_1937	33	30	1
10244	S18_1342	40	117	7
10244	S18_1367	20	58	6
10244	S18_2795	43	138	8
10244	S18_2949	30	118	1
10244	S18_2957	24	58	3
10244	S18_3136	29	115	2
10244	S18_3320	36	84	5
10244	S24_2022	39	45	9
10244	S24_4258	40	87	4
10245	S10_1949	34	180	9
10245	S10_4962	28	164	2
10245	S12_1666	38	156	6
10245	S18_1097	29	119	8
10245	S18_4600	21	114	3
10245	S18_4668	45	60	7
10245	S32_1268	37	112	1
10245	S32_3522	44	69	5
10245	S700_2824	44	105	4
10246	S12_4473	46	110	5
10246	S18_2238	40	164	4
10246	S18_2319	22	98	8
10246	S18_2432	30	62	11
10246	S18_3232	36	198	9
10246	S24_1444	44	53	2
10246	S24_2300	29	121	10
10246	S24_2840	49	36	6
10246	S24_4048	46	137	1
10246	S32_2509	35	49	7
10246	S50_1392	22	133	3
10247	S12_1108	44	241	2
10247	S12_3148	25	175	3
10247	S12_3891	27	154	1
10247	S18_4027	48	141	5
10247	S32_3207	40	50	6
10247	S50_1514	49	64	4
10248	S10_4757	20	146	3
10248	S18_3029	21	74	1
10248	S18_3140	32	119	12
10248	S18_3259	42	121	14
10248	S18_4522	42	75	11
10248	S24_2011	48	145	10
10248	S24_3151	30	102	5
10248	S24_3816	23	76	2
10248	S700_1138	36	71	6
10248	S700_1938	40	104	13
10248	S700_2610	32	76	4
10248	S700_3505	30	108	7
10248	S700_3962	35	90	8
10248	S72_3212	23	66	9
10249	S18_3856	46	122	5
10249	S24_2841	20	68	1
10249	S24_3420	25	70	2
10249	S700_2047	40	96	4
10249	S72_1253	32	58	3
10250	S18_1662	45	181	14
10250	S18_2581	27	99	4
10250	S24_1785	31	89	6
10250	S24_2000	32	88	1
10250	S24_3949	40	75	13
10250	S24_4278	37	75	5
10250	S32_1374	31	106	2
10250	S32_4289	50	61	7
10250	S50_1341	36	52	8
10250	S700_1691	31	91	9
10250	S700_2466	35	112	11
10250	S700_2834	44	138	3
10250	S700_3167	44	67	10
10250	S700_4002	38	62	12
10251	S10_1678	28	114	2
10251	S10_2016	44	131	5
10251	S10_4698	43	165	4
10251	S12_2823	46	164	1
10251	S18_2625	29	61	6
10251	S24_1578	26	101	3
10252	S18_3278	20	76	2
10252	S18_3482	41	165	1
10252	S18_3782	31	53	5
10252	S18_4721	26	137	4
10252	S24_2360	47	66	8
10252	S24_4620	38	87	3
10252	S32_2206	36	48	6
10252	S32_4485	25	113	9
10252	S50_4713	48	72	7
10253	S12_1099	24	163	13
10253	S12_3380	22	109	11
10253	S12_3990	25	90	14
10253	S12_4675	41	120	10
10253	S18_1129	26	117	5
10253	S18_1589	24	141	1
10253	S18_1889	23	84	9
10253	S18_1984	33	135	4
10253	S18_2870	37	140	2
10253	S18_3232	40	169	6
10253	S18_3685	31	130	3
10253	S24_2972	40	43	7
10253	S24_3371	24	53	12
10253	S24_3856	39	132	8
10254	S18_1749	49	143	5
10254	S18_2248	36	64	4
10254	S18_2325	41	111	2
10254	S18_4409	34	93	6
10254	S18_4933	30	58	7
10254	S24_1046	34	65	11
10254	S24_1628	32	60	13
10254	S24_1937	38	27	1
10254	S24_2766	31	101	9
10254	S24_2887	33	96	8
10254	S24_3191	42	97	10
10254	S24_3432	49	101	12
10254	S24_3969	20	43	3
10255	S18_2795	24	155	1
10255	S24_2022	37	46	2
10256	S18_1342	34	96	2
10256	S18_1367	29	52	1
10257	S18_2949	50	88	1
10257	S18_2957	49	54	3
10257	S18_3136	37	85	2
10257	S18_3320	26	89	5
10257	S24_4258	46	79	4
10258	S10_1949	32	240	6
10258	S12_1666	41	163	3
10258	S18_1097	41	133	5
10258	S18_4668	21	60	4
10258	S32_3522	20	61	2
10258	S700_2824	45	81	1
10259	S10_4962	26	155	12
10259	S12_4473	46	142	4
10259	S18_2238	30	190	3
10259	S18_2319	34	99	7
10259	S18_2432	30	49	10
10259	S18_3232	27	135	8
10259	S18_4600	41	114	13
10259	S24_1444	28	47	1
10259	S24_2300	47	112	9
10259	S24_2840	31	33	5
10259	S32_1268	45	87	11
10259	S32_2509	40	44	6
10259	S50_1392	29	105	2
10260	S12_1108	46	229	5
10260	S12_3148	30	171	6
10260	S12_3891	44	171	4
10260	S18_3140	32	131	1
10260	S18_3259	29	89	3
10260	S18_4027	23	155	8
10260	S24_4048	23	103	10
10260	S32_3207	27	57	9
10260	S50_1514	21	56	7
10260	S700_1938	33	86	2
10261	S10_4757	27	125	1
10261	S18_4522	20	90	9
10261	S24_2011	36	125	8
10261	S24_3151	22	91	3
10261	S700_1138	34	62	4
10261	S700_2610	44	69	2
10261	S700_3505	25	88	5
10261	S700_3962	50	81	6
10261	S72_3212	29	51	7
10262	S18_1662	49	134	9
10262	S18_3029	32	84	15
10262	S18_3856	34	121	14
10262	S24_1785	34	97	1
10262	S24_2841	24	67	10
10262	S24_3420	46	70	11
10262	S24_3816	49	87	16
10262	S24_3949	48	61	8
10262	S32_4289	40	79	2
10262	S50_1341	49	38	3
10262	S700_1691	40	84	4
10262	S700_2047	44	94	13
10262	S700_2466	33	91	6
10262	S700_3167	27	76	5
10262	S700_4002	35	71	7
10262	S72_1253	21	57	12
10263	S10_1678	34	108	2
10263	S10_2016	40	112	5
10263	S10_4698	41	203	4
10263	S12_2823	48	134	1
10263	S18_2581	33	86	10
10263	S18_2625	34	59	6
10263	S24_1578	42	103	3
10263	S24_2000	37	62	7
10263	S24_4278	24	75	11
10263	S32_1374	31	80	8
10263	S700_2834	47	116	9
10264	S18_3782	48	55	3
10264	S18_4721	20	121	2
10264	S24_2360	37	65	6
10264	S24_4620	47	83	1
10264	S32_2206	20	33	4
10264	S32_4485	34	98	7
10264	S50_4713	47	90	5
10265	S18_3278	45	87	2
10265	S18_3482	49	172	1
10266	S12_1099	44	208	14
10266	S12_3380	22	112	12
10266	S12_3990	35	77	15
10266	S12_4675	40	112	11
10266	S18_1129	21	120	6
10266	S18_1589	36	144	2
10266	S18_1889	33	75	10
10266	S18_1984	49	127	5
10266	S18_2870	20	141	3
10266	S18_3232	29	166	7
10266	S18_3685	33	153	4
10266	S24_1628	28	48	1
10266	S24_2972	34	40	8
10266	S24_3371	47	62	13
10266	S24_3856	24	122	9
10267	S18_4933	36	76	1
10267	S24_1046	40	80	5
10267	S24_2766	38	87	3
10267	S24_2887	43	108	2
10267	S24_3191	44	97	4
10267	S24_3432	43	119	6
10268	S18_1342	49	117	3
10268	S18_1367	26	65	2
10268	S18_1749	34	162	10
10268	S18_2248	31	49	9
10268	S18_2325	50	106	7
10268	S18_2795	35	152	4
10268	S18_3320	39	89	1
10268	S18_4409	35	87	11
10268	S24_1937	33	39	6
10268	S24_2022	40	46	5
10268	S24_3969	30	41	8
10269	S18_2957	32	63	1
10269	S24_4258	48	97	2
10270	S10_1949	21	234	9
10270	S10_4962	32	134	2
10270	S12_1666	28	146	6
10270	S18_1097	43	97	8
10270	S18_2949	31	96	10
10270	S18_3136	38	126	11
10270	S18_4600	38	142	3
10270	S18_4668	44	58	7
10270	S32_1268	32	86	1
10270	S32_3522	21	63	5
10270	S700_2824	46	88	4
10271	S12_4473	31	97	5
10271	S18_2238	50	183	4
10271	S18_2319	50	102	8
10271	S18_2432	25	69	11
10271	S18_3232	20	196	9
10271	S24_1444	45	65	2
10271	S24_2300	43	130	10
10271	S24_2840	38	42	6
10271	S24_4048	22	140	1
10271	S32_2509	35	48	7
10271	S50_1392	34	98	3
10272	S12_1108	35	166	2
10272	S12_3148	27	159	3
10272	S12_3891	39	204	1
10272	S18_4027	25	149	5
10272	S32_3207	45	65	6
10272	S50_1514	43	57	4
10273	S10_4757	30	117	4
10273	S18_3029	34	98	2
10273	S18_3140	40	126	13
10273	S18_3259	47	116	15
10273	S18_3856	50	86	1
10273	S18_4522	33	71	12
10273	S24_2011	22	127	11
10273	S24_3151	27	104	6
10273	S24_3816	48	83	3
10273	S700_1138	21	65	7
10273	S700_1938	21	102	14
10273	S700_2610	42	62	5
10273	S700_3505	40	86	8
10273	S700_3962	26	114	9
10273	S72_3212	37	46	10
10274	S18_1662	41	164	1
10274	S24_2841	40	65	2
10274	S24_3420	24	72	3
10274	S700_2047	24	91	5
10274	S72_1253	32	59	4
10275	S10_1678	45	93	1
10275	S10_2016	22	132	4
10275	S10_4698	36	192	3
10275	S18_2581	35	90	9
10275	S18_2625	37	64	5
10275	S24_1578	21	103	2
10275	S24_1785	25	95	11
10275	S24_2000	30	80	6
10275	S24_3949	41	82	18
10275	S24_4278	27	62	10
10275	S32_1374	23	82	7
10275	S32_4289	28	64	12
10275	S50_1341	38	45	13
10275	S700_1691	32	90	14
10275	S700_2466	39	115	16
10275	S700_2834	48	133	8
10275	S700_3167	43	74	15
10275	S700_4002	31	73	17
10276	S12_1099	50	193	3
10276	S12_2823	43	121	14
10276	S12_3380	47	116	1
10276	S12_3990	38	84	4
10276	S18_3278	38	70	6
10276	S18_3482	30	131	5
10276	S18_3782	33	50	9
10276	S18_4721	48	119	8
10276	S24_2360	46	75	12
10276	S24_3371	20	61	2
10276	S24_4620	48	75	7
10276	S32_2206	27	37	10
10276	S32_4485	38	113	13
10276	S50_4713	21	71	11
10277	S12_4675	28	112	1
10278	S18_1129	34	137	6
10278	S18_1589	23	113	2
10278	S18_1889	29	91	10
10278	S18_1984	29	129	5
10278	S18_2870	39	111	3
10278	S18_3232	42	152	7
10278	S18_3685	31	133	4
10278	S24_1628	35	45	1
10278	S24_2972	31	39	8
10278	S24_3856	25	126	9
10279	S18_4933	26	61	1
10279	S24_1046	32	75	5
10279	S24_2766	49	80	3
10279	S24_2887	48	116	2
10279	S24_3191	33	71	4
10279	S24_3432	48	129	6
10280	S10_1949	34	236	2
10280	S18_1097	24	117	1
10280	S18_1342	50	105	9
10280	S18_1367	27	58	8
10280	S18_1749	26	141	16
10280	S18_2248	25	63	15
10280	S18_2325	37	128	13
10280	S18_2795	22	203	10
10280	S18_2949	46	111	3
10280	S18_2957	43	69	5
10280	S18_3136	29	104	4
10280	S18_3320	34	102	7
10280	S18_4409	35	106	17
10280	S24_1937	20	29	12
10280	S24_2022	45	47	11
10280	S24_3969	33	42	14
10280	S24_4258	21	79	6
10281	S10_4962	44	160	9
10281	S12_1666	25	118	13
10281	S12_4473	41	128	1
10281	S18_2319	48	120	4
10281	S18_2432	29	58	7
10281	S18_3232	25	168	5
10281	S18_4600	25	99	10
10281	S18_4668	44	60	14
10281	S24_2300	25	111	6
10281	S24_2840	20	41	2
10281	S32_1268	29	83	8
10281	S32_2509	31	55	3
10281	S32_3522	36	78	12
10281	S700_2824	27	86	11
10282	S12_1108	41	172	5
10282	S12_3148	27	162	6
10282	S12_3891	24	157	4
10282	S18_2238	23	141	13
10282	S18_3140	43	156	1
10282	S18_3259	36	116	3
10282	S18_4027	31	151	8
10282	S24_1444	29	47	11
10282	S24_4048	39	123	10
10282	S32_3207	36	60	9
10282	S50_1392	38	113	12
10282	S50_1514	37	67	7
10282	S700_1938	43	87	2
10283	S10_4757	25	120	6
10283	S18_3029	21	98	4
10283	S18_3856	46	126	3
10283	S18_4522	34	105	14
10283	S24_2011	42	127	13
10283	S24_3151	34	93	8
10283	S24_3816	33	73	5
10283	S700_1138	45	79	9
10283	S700_2047	20	94	2
10283	S700_2610	47	66	7
10283	S700_3505	22	88	10
10283	S700_3962	38	89	11
10283	S72_1253	43	58	1
10283	S72_3212	33	51	12
10284	S18_1662	45	128	11
10284	S18_2581	31	72	1
10284	S24_1785	22	105	3
10284	S24_2841	30	74	12
10284	S24_3420	39	72	13
10284	S24_3949	21	56	10
10284	S24_4278	21	71	2
10284	S32_4289	50	82	4
10284	S50_1341	33	52	5
10284	S700_1691	24	83	6
10284	S700_2466	45	102	8
10284	S700_3167	25	70	7
10284	S700_4002	32	64	9
10285	S10_1678	36	114	6
10285	S10_2016	47	138	9
10285	S10_4698	27	201	8
10285	S12_2823	49	140	5
10285	S18_2625	20	49	10
10285	S24_1578	34	109	7
10285	S24_2000	39	70	11
10285	S24_2360	38	60	3
10285	S32_1374	37	99	12
10285	S32_2206	37	41	1
10285	S32_4485	26	100	4
10285	S50_4713	39	79	2
10285	S700_2834	45	120	13
10286	S18_3782	38	57	1
10287	S12_1099	21	163	12
10287	S12_3380	45	106	10
10287	S12_3990	41	69	13
10287	S12_4675	23	116	9
10287	S18_1129	41	159	4
10287	S18_1889	44	82	8
10287	S18_1984	24	147	3
10287	S18_2870	44	115	1
10287	S18_3232	36	163	5
10287	S18_3278	43	71	15
10287	S18_3482	40	169	14
10287	S18_3685	27	160	2
10287	S18_4721	34	126	17
10287	S24_2972	36	40	6
10287	S24_3371	20	68	11
10287	S24_3856	36	119	7
10287	S24_4620	40	88	16
10288	S18_1589	20	147	14
10288	S18_1749	32	184	5
10288	S18_2248	28	62	4
10288	S18_2325	31	123	2
10288	S18_4409	35	81	6
10288	S18_4933	23	73	7
10288	S24_1046	36	66	11
10288	S24_1628	50	52	13
10288	S24_1937	29	38	1
10288	S24_2766	35	81	9
10288	S24_2887	48	136	8
10288	S24_3191	34	68	10
10288	S24_3432	41	119	12
10288	S24_3969	33	41	3
10289	S18_1342	38	120	2
10289	S18_1367	24	56	1
10289	S18_2795	43	192	3
10289	S24_2022	45	48	4
10290	S18_3320	26	96	2
10290	S24_4258	45	115	1
10291	S10_1949	37	193	11
10291	S10_4962	30	129	4
10291	S12_1666	41	156	8
10291	S18_1097	41	114	10
10291	S18_2432	26	58	2
10291	S18_2949	47	122	12
10291	S18_2957	37	51	14
10291	S18_3136	23	125	13
10291	S18_4600	48	110	5
10291	S18_4668	29	52	9
10291	S24_2300	48	112	1
10291	S32_1268	26	84	3
10291	S32_3522	32	72	7
10291	S700_2824	28	116	6
10292	S12_4473	21	105	8
10292	S18_2238	26	175	7
10292	S18_2319	41	110	11
10292	S18_3232	21	135	12
10292	S18_4027	44	162	2
10292	S24_1444	40	54	5
10292	S24_2840	39	30	9
10292	S24_4048	27	142	4
10292	S32_2509	50	47	10
10292	S32_3207	31	68	3
10292	S50_1392	41	122	6
10292	S50_1514	35	55	1
10293	S12_1108	46	183	8
10293	S12_3148	24	177	9
10293	S12_3891	45	183	7
10293	S18_3140	24	117	4
10293	S18_3259	22	110	6
10293	S18_4522	49	101	3
10293	S24_2011	21	140	2
10293	S700_1938	29	72	5
10293	S72_3212	32	60	1
10294	S700_3962	45	104	1
10295	S10_4757	24	143	1
10295	S24_3151	46	85	3
10295	S700_1138	26	75	4
10295	S700_2610	44	59	2
10295	S700_3505	34	102	5
10296	S18_1662	36	158	7
10296	S18_3029	21	96	13
10296	S18_3856	22	85	12
10296	S24_2841	21	71	8
10296	S24_3420	31	54	9
10296	S24_3816	22	77	14
10296	S24_3949	32	72	6
10296	S50_1341	26	48	1
10296	S700_1691	42	102	2
10296	S700_2047	34	102	11
10296	S700_2466	24	102	4
10296	S700_3167	22	81	3
10296	S700_4002	47	87	5
10296	S72_1253	21	45	10
10297	S18_2581	25	83	4
10297	S24_1785	32	127	6
10297	S24_2000	32	66	1
10297	S24_4278	23	72	5
10297	S32_1374	26	110	2
10297	S32_4289	28	80	7
10297	S700_2834	35	114	3
10298	S10_2016	39	96	1
10298	S18_2625	32	48	2
10299	S10_1678	23	113	9
10299	S10_4698	29	230	11
10299	S12_2823	24	173	8
10299	S18_3782	39	56	3
10299	S18_4721	49	162	2
10299	S24_1578	47	116	10
10299	S24_2360	33	66	6
10299	S24_4620	32	81	1
10299	S32_2206	24	42	4
10299	S32_4485	38	115	7
10299	S50_4713	44	81	5
10300	S12_1099	33	167	5
10300	S12_3380	29	137	3
10300	S12_3990	22	77	6
10300	S12_4675	23	122	2
10300	S18_1889	41	92	1
10300	S18_3278	49	79	8
10300	S18_3482	23	165	7
10300	S24_3371	31	59	4
10301	S18_1129	37	160	8
10301	S18_1589	32	107	4
10301	S18_1984	47	159	7
10301	S18_2870	22	147	5
10301	S18_3232	23	174	9
10301	S18_3685	39	165	6
10301	S24_1046	27	72	1
10301	S24_1628	22	51	3
10301	S24_2972	48	34	10
10301	S24_3432	22	96	2
10301	S24_3856	50	154	11
10302	S18_1749	43	170	1
10302	S18_4409	38	89	2
10302	S18_4933	23	73	3
10302	S24_2766	49	108	5
10302	S24_2887	45	123	4
10302	S24_3191	48	74	6
10303	S18_2248	46	49	2
10303	S24_3969	24	40	1
10304	S10_1949	47	216	6
10304	S12_1666	39	164	3
10304	S18_1097	46	98	5
10304	S18_1342	37	96	13
10304	S18_1367	37	49	12
10304	S18_2325	24	102	17
10304	S18_2795	20	179	14
10304	S18_2949	46	100	7
10304	S18_2957	24	65	9
10304	S18_3136	26	86	8
10304	S18_3320	38	104	11
10304	S18_4668	34	49	4
10304	S24_1937	23	30	16
10304	S24_2022	44	39	15
10304	S24_4258	33	101	10
10304	S32_3522	36	73	2
10304	S700_2824	40	105	1
10305	S10_4962	38	176	13
10305	S12_4473	38	126	5
10305	S18_2238	27	146	4
10305	S18_2319	36	134	8
10305	S18_2432	41	53	11
10305	S18_3232	37	202	9
10305	S18_4600	22	99	14
10305	S24_1444	45	62	2
10305	S24_2300	24	133	10
10305	S24_2840	48	31	6
10305	S24_4048	36	129	1
10305	S32_1268	28	113	12
10305	S32_2509	40	58	7
10305	S50_1392	42	110	3
10306	S12_1108	31	212	13
10306	S12_3148	34	147	14
10306	S12_3891	20	182	12
10306	S18_3140	32	117	9
10306	S18_3259	40	92	11
10306	S18_4027	23	157	16
10306	S18_4522	39	90	8
10306	S24_2011	29	111	7
10306	S24_3151	31	84	2
10306	S32_3207	46	50	17
10306	S50_1514	34	60	15
10306	S700_1138	50	54	3
10306	S700_1938	38	92	10
10306	S700_2610	43	75	1
10306	S700_3505	32	90	4
10306	S700_3962	30	117	5
10306	S72_3212	35	60	6
10307	S10_4757	22	122	9
10307	S18_1662	39	189	1
10307	S18_3029	31	83	7
10307	S18_3856	48	87	6
10307	S24_2841	25	75	2
10307	S24_3420	22	72	3
10307	S24_3816	22	91	8
10307	S700_2047	34	98	5
10307	S72_1253	34	54	4
10308	S10_2016	34	119	2
10308	S10_4698	20	229	1
10308	S18_2581	27	83	7
10308	S18_2625	34	52	3
10308	S24_1785	31	113	9
10308	S24_2000	47	63	4
10308	S24_3949	43	76	16
10308	S24_4278	44	83	8
10308	S32_1374	24	80	5
10308	S32_4289	46	66	10
10308	S50_1341	47	44	11
10308	S700_1691	21	106	12
10308	S700_2466	35	89	14
10308	S700_2834	31	129	6
10308	S700_3167	21	87	13
10308	S700_4002	39	68	15
10309	S10_1678	41	107	5
10309	S12_2823	26	179	4
10309	S24_1578	21	126	6
10309	S24_2360	24	56	2
10309	S32_4485	50	85	3
10309	S50_4713	28	89	1
10310	S12_1099	33	210	10
10310	S12_3380	24	129	8
10310	S12_3990	49	81	11
10310	S12_4675	25	100	7
10310	S18_1129	37	168	2
10310	S18_1889	20	92	6
10310	S18_1984	24	144	1
10310	S18_3232	48	186	3
10310	S18_3278	27	80	13
10310	S18_3482	49	128	12
10310	S18_3782	42	67	16
10310	S18_4721	40	134	15
10310	S24_2972	33	42	4
10310	S24_3371	38	57	9
10310	S24_3856	45	122	5
10310	S24_4620	49	97	14
10310	S32_2206	36	43	17
10311	S18_1589	29	101	9
10311	S18_2870	43	123	10
10311	S18_3685	32	113	11
10311	S18_4409	41	82	1
10311	S18_4933	25	67	2
10311	S24_1046	26	87	6
10311	S24_1628	45	49	8
10311	S24_2766	28	94	4
10311	S24_2887	43	107	3
10311	S24_3191	25	83	5
10311	S24_3432	46	92	7
10312	S10_1949	48	242	3
10312	S18_1097	32	131	2
10312	S18_1342	43	89	10
10312	S18_1367	25	44	9
10312	S18_1749	48	168	17
10312	S18_2248	30	61	16
10312	S18_2325	31	153	14
10312	S18_2795	25	155	11
10312	S18_2949	37	100	4
10312	S18_2957	35	54	6
10312	S18_3136	38	117	5
10312	S18_3320	33	107	8
10312	S18_4668	39	57	1
10312	S24_1937	39	30	13
10312	S24_2022	23	38	12
10312	S24_3969	31	35	15
10312	S24_4258	44	111	7
10313	S10_4962	40	167	7
10313	S12_1666	21	127	11
10313	S18_2319	29	118	2
10313	S18_2432	34	53	5
10313	S18_3232	25	183	3
10313	S18_4600	28	103	8
10313	S24_2300	42	133	4
10313	S32_1268	27	88	6
10313	S32_2509	38	45	1
10313	S32_3522	34	56	10
10313	S700_2824	30	99	9
10314	S12_1108	38	210	5
10314	S12_3148	46	139	6
10314	S12_3891	36	192	4
10314	S12_4473	45	137	14
10314	S18_2238	42	138	13
10314	S18_3140	20	137	1
10314	S18_3259	23	108	3
10314	S18_4027	29	145	8
10314	S24_1444	44	53	11
10314	S24_2840	39	37	15
10314	S24_4048	38	105	10
10314	S32_3207	35	66	9
10314	S50_1392	28	122	12
10314	S50_1514	38	62	7
10314	S700_1938	23	76	2
10315	S18_4522	36	100	7
10315	S24_2011	35	120	6
10315	S24_3151	24	87	1
10315	S700_1138	41	62	2
10315	S700_3505	31	86	3
10315	S700_3962	37	91	4
10315	S72_3212	40	56	5
10316	S10_4757	33	125	17
10316	S18_1662	27	137	9
10316	S18_3029	21	95	15
10316	S18_3856	47	87	14
10316	S24_1785	25	115	1
10316	S24_2841	34	64	10
10316	S24_3420	47	77	11
10316	S24_3816	25	92	16
10316	S24_3949	30	78	8
10316	S32_4289	24	59	2
10316	S50_1341	34	48	3
10316	S700_1691	34	82	4
10316	S700_2047	45	93	13
10316	S700_2466	23	118	6
10316	S700_2610	48	74	18
10316	S700_3167	48	75	5
10316	S700_4002	44	62	7
10316	S72_1253	34	44	12
10317	S24_4278	35	83	1
10318	S10_1678	46	95	1
10318	S10_2016	45	124	4
10318	S10_4698	37	207	3
10318	S18_2581	31	101	9
10318	S18_2625	42	53	5
10318	S24_1578	48	134	2
10318	S24_2000	26	87	6
10318	S32_1374	47	113	7
10318	S700_2834	50	142	8
10319	S12_2823	30	137	9
10319	S18_3278	46	74	1
10319	S18_3782	44	59	4
10319	S18_4721	45	176	3
10319	S24_2360	31	82	7
10319	S24_4620	43	86	2
10319	S32_2206	29	38	5
10319	S32_4485	22	119	8
10319	S50_4713	45	77	6
10320	S12_1099	31	222	3
10320	S12_3380	35	139	1
10320	S12_3990	38	73	4
10320	S18_3482	25	140	5
10320	S24_3371	26	61	2
10321	S12_4675	24	124	15
10321	S18_1129	41	142	10
10321	S18_1589	44	102	6
10321	S18_1889	37	79	14
10321	S18_1984	25	149	9
10321	S18_2870	27	106	7
10321	S18_3232	33	173	11
10321	S18_3685	28	151	8
10321	S24_1046	30	71	3
10321	S24_1628	48	42	5
10321	S24_2766	30	73	1
10321	S24_2972	37	33	12
10321	S24_3191	39	85	2
10321	S24_3432	21	90	4
10321	S24_3856	26	156	13
10322	S10_1949	40	150	1
10322	S10_4962	46	62	8
10322	S12_1666	27	177	9
10322	S18_1097	22	102	10
10322	S18_1342	43	86	14
10322	S18_1367	41	58	5
10322	S18_2325	50	251	6
10322	S18_2432	35	61	11
10322	S18_2795	36	161	2
10322	S18_2949	33	107	12
10322	S18_2957	41	30	13
10322	S18_3136	48	47	7
10322	S24_1937	20	131	3
10322	S24_2022	30	117	4
10323	S18_3320	33	91	2
10323	S18_4600	47	132	1
10324	S12_3148	27	54	1
10324	S12_4473	26	58	7
10324	S18_2238	47	153	8
10324	S18_2319	33	37	10
10324	S18_3232	27	117	12
10324	S18_4027	49	110	13
10324	S18_4668	38	180	6
10324	S24_1444	25	69	14
10324	S24_2300	31	123	2
10324	S24_2840	30	111	9
10324	S24_4258	33	190	3
10324	S32_1268	20	98	11
10324	S32_3522	48	171	4
10324	S700_2824	34	125	5
10325	S10_4757	47	65	6
10325	S12_1108	42	64	8
10325	S12_3891	24	108	1
10325	S18_3140	24	69	9
10325	S24_4048	44	121	5
10325	S32_2509	38	233	3
10325	S32_3207	28	192	2
10325	S50_1392	38	137	4
10325	S50_1514	44	135	7
10326	S18_3259	32	119	6
10326	S18_4522	50	86	5
10326	S24_2011	41	106	4
10326	S24_3151	41	86	3
10326	S24_3816	20	92	2
10326	S700_1138	39	60	1
10327	S18_1662	25	112	6
10327	S18_2581	45	106	8
10327	S18_3029	25	46	5
10327	S700_1938	20	173	7
10327	S700_2610	21	96	1
10327	S700_3505	43	80	2
10327	S700_3962	37	87	3
10327	S72_3212	37	87	4
10328	S18_3856	34	112	6
10328	S24_1785	47	88	14
10328	S24_2841	48	59	1
10328	S24_3420	20	73	2
10328	S24_3949	35	76	3
10328	S24_4278	43	61	4
10328	S32_4289	24	81	5
10328	S50_1341	34	52	7
10328	S700_1691	27	102	8
10328	S700_2047	41	101	9
10328	S700_2466	37	109	10
10328	S700_2834	33	123	11
10328	S700_3167	33	64	13
10328	S700_4002	39	86	12
10329	S10_1678	42	105	1
10329	S10_2016	20	159	2
10329	S10_4698	26	226	3
10329	S12_1099	41	71	5
10329	S12_2823	24	148	6
10329	S12_3380	46	84	13
10329	S12_3990	33	109	14
10329	S12_4675	39	65	15
10329	S18_1889	29	102	9
10329	S18_2625	38	139	12
10329	S18_3278	38	59	10
10329	S24_1578	30	88	7
10329	S24_2000	37	94	4
10329	S32_1374	45	64	11
10329	S72_1253	44	86	8
10330	S18_3482	37	119	3
10330	S18_3782	29	70	2
10330	S18_4721	50	122	4
10330	S24_2360	42	81	1
10331	S18_1129	46	140	6
10331	S18_1589	44	110	14
10331	S18_1749	44	74	7
10331	S18_1984	30	32	8
10331	S18_2870	26	65	10
10331	S18_3232	27	154	11
10331	S18_3685	26	68	12
10331	S24_2972	27	42	13
10331	S24_3371	25	123	9
10331	S24_3856	21	149	1
10331	S24_4620	41	139	2
10331	S32_2206	28	147	3
10331	S32_4485	32	157	4
10331	S50_4713	20	183	5
10332	S18_1342	46	95	15
10332	S18_1367	27	90	16
10332	S18_2248	38	84	9
10332	S18_2325	35	65	8
10332	S18_2795	24	53	1
10332	S18_2957	26	115	17
10332	S18_3136	40	40	18
10332	S18_4409	50	146	2
10332	S18_4933	21	165	3
10332	S24_1046	23	57	4
10332	S24_1628	20	88	5
10332	S24_1937	45	82	6
10332	S24_2022	26	86	10
10332	S24_2766	39	87	7
10332	S24_2887	44	42	11
10332	S24_3191	45	34	12
10332	S24_3432	31	37	13
10332	S24_3969	41	77	14
10333	S10_1949	26	116	3
10333	S12_1666	33	99	6
10333	S18_1097	29	40	7
10333	S18_2949	31	90	5
10333	S18_3320	46	246	2
10333	S18_4668	24	80	8
10333	S24_4258	39	113	1
10333	S32_3522	33	74	4
10334	S10_4962	26	123	2
10334	S18_2319	46	126	6
10334	S18_2432	34	61	1
10334	S18_3232	20	144	3
10334	S18_4600	49	138	4
10334	S24_2300	42	132	5
10335	S24_2840	33	37	2
10335	S32_1268	44	108	1
10335	S32_2509	40	61	3
10336	S12_1108	33	57	10
10336	S12_3148	33	123	11
10336	S12_3891	49	63	1
10336	S12_4473	38	168	3
10336	S18_2238	49	152	6
10336	S18_3140	48	120	12
10336	S18_3259	21	106	7
10336	S24_1444	45	133	4
10336	S24_4048	31	149	5
10336	S32_3207	31	85	9
10336	S50_1392	23	137	8
10336	S700_2824	46	208	2
10337	S10_4757	25	48	8
10337	S18_4027	36	158	3
10337	S18_4522	29	155	2
10337	S24_2011	29	72	4
10337	S50_1514	21	109	6
10337	S700_1938	36	70	9
10337	S700_3505	31	89	1
10337	S700_3962	36	72	7
10337	S72_3212	42	97	5
10338	S18_1662	41	137	1
10338	S18_3029	28	83	3
10338	S18_3856	45	123	2
10339	S10_2016	40	69	4
10339	S10_4698	39	77	3
10339	S18_2581	27	104	2
10339	S18_2625	30	62	1
10339	S24_1578	27	84	10
10339	S24_1785	21	51	7
10339	S24_2841	55	113	12
10339	S24_3151	55	196	13
10339	S24_3420	29	100	14
10339	S24_3816	42	59	16
10339	S24_3949	45	97	11
10339	S700_1138	22	128	5
10339	S700_2047	55	71	15
10339	S700_2610	50	74	9
10339	S700_4002	50	58	8
10339	S72_1253	27	76	6
10340	S24_2000	55	80	8
10340	S24_4278	40	85	1
10340	S32_1374	55	118	2
10340	S32_4289	39	59	3
10340	S50_1341	40	51	4
10340	S700_1691	30	89	5
10340	S700_2466	55	88	7
10340	S700_2834	29	141	6
10341	S10_1678	41	189	9
10341	S12_1099	45	80	2
10341	S12_2823	55	148	8
10341	S12_3380	44	96	1
10341	S12_3990	36	94	10
10341	S12_4675	55	75	7
10341	S24_2360	32	103	6
10341	S32_4485	31	71	4
10341	S50_4713	38	123	3
10341	S700_3167	34	107	5
10342	S18_1129	40	161	2
10342	S18_1889	55	65	1
10342	S18_1984	22	144	3
10342	S18_3232	30	168	4
10342	S18_3278	25	67	5
10342	S18_3482	55	119	7
10342	S18_3782	26	56	8
10342	S18_4721	38	165	11
10342	S24_2972	39	40	9
10342	S24_3371	48	62	10
10342	S24_3856	42	119	6
10343	S18_1589	36	162	4
10343	S18_2870	25	52	3
10343	S18_3685	44	85	2
10343	S24_1628	27	36	6
10343	S24_4620	30	103	1
10343	S32_2206	29	128	5
10344	S18_1749	45	170	1
10344	S18_2248	40	57	2
10344	S18_2325	30	131	3
10344	S18_4409	21	105	4
10344	S18_4933	26	63	5
10344	S24_1046	29	60	7
10344	S24_1937	20	35	6
10345	S24_2022	43	54	1
10346	S18_1342	42	36	3
10346	S24_2766	25	115	1
10346	S24_2887	24	87	5
10346	S24_3191	24	139	2
10346	S24_3432	26	96	6
10346	S24_3969	22	97	4
10347	S10_1949	30	131	1
10347	S10_4962	27	164	2
10347	S12_1666	29	124	3
10347	S18_1097	42	50	5
10347	S18_1367	21	59	7
10347	S18_2432	50	137	8
10347	S18_2795	21	229	6
10347	S18_2949	48	100	9
10347	S18_2957	34	65	10
10347	S18_3136	45	110	11
10347	S18_3320	26	102	12
10347	S18_4600	45	131	4
10348	S12_1108	48	52	8
10348	S12_3148	47	102	4
10348	S18_4668	29	245	6
10348	S24_2300	37	162	1
10348	S24_4258	39	50	2
10348	S32_1268	42	152	3
10348	S32_3522	31	101	5
10348	S700_2824	32	83	7
10349	S12_3891	26	170	10
10349	S12_4473	48	109	9
10349	S18_2238	38	177	8
10349	S18_2319	38	137	7
10349	S18_3232	48	154	6
10349	S18_4027	34	129	5
10349	S24_1444	48	47	4
10349	S24_2840	36	37	3
10349	S24_4048	23	138	2
10349	S32_2509	33	47	1
10350	S10_4757	26	75	5
10350	S18_3029	43	65	6
10350	S18_3140	44	118	1
10350	S18_3259	41	93	2
10350	S18_4522	30	101	3
10350	S24_2011	34	50	7
10350	S24_3151	30	101	9
10350	S24_3816	25	60	10
10350	S32_3207	27	163	14
10350	S50_1392	31	71	8
10350	S50_1514	44	148	17
10350	S700_1138	46	77	11
10350	S700_1938	28	104	4
10350	S700_2610	29	75	12
10350	S700_3505	31	77	13
10350	S700_3962	25	114	16
10350	S72_3212	20	112	15
10351	S18_1662	39	100	1
10351	S18_3856	20	169	2
10351	S24_2841	25	75	5
10351	S24_3420	38	68	4
10351	S24_3949	34	59	3
10352	S700_2047	23	102	3
10352	S700_2466	49	101	2
10352	S700_4002	22	76	1
10352	S72_1253	49	53	4
10353	S18_2581	27	130	1
10353	S24_1785	28	72	2
10353	S24_4278	35	90	3
10353	S32_1374	46	81	5
10353	S32_4289	40	45	7
10353	S50_1341	40	82	8
10353	S700_1691	39	129	9
10353	S700_2834	48	69	4
10353	S700_3167	43	82	6
10354	S10_1678	42	86	6
10354	S10_2016	20	105	2
10354	S10_4698	42	213	3
10354	S12_1099	31	93	9
10354	S12_2823	35	183	4
10354	S12_3380	29	73	11
10354	S12_3990	23	51	12
10354	S12_4675	28	87	13
10354	S18_1889	21	110	8
10354	S18_2625	28	166	10
10354	S18_3278	36	82	7
10354	S24_1578	21	114	5
10354	S24_2000	28	69	1
10355	S18_3482	23	138	7
10355	S18_3782	31	53	1
10355	S18_4721	25	168	2
10355	S24_2360	41	71	3
10355	S24_2972	36	39	4
10355	S24_3371	44	62	6
10355	S24_3856	32	166	8
10355	S24_4620	28	95	9
10355	S32_2206	38	40	10
10355	S32_4485	40	108	5
10356	S18_1129	43	98	8
10356	S18_1342	50	50	9
10356	S18_1367	22	72	6
10356	S18_1984	27	65	2
10356	S18_2325	29	125	3
10356	S18_2795	30	149	1
10356	S24_1937	48	203	5
10356	S24_2022	26	32	7
10356	S50_4713	26	151	4
10357	S10_1949	32	178	10
10357	S10_4962	43	134	9
10357	S12_1666	49	122	8
10357	S18_1097	39	98	1
10357	S18_2432	41	62	7
10357	S18_2949	41	87	6
10357	S18_2957	49	71	5
10357	S18_3136	44	117	4
10357	S18_3320	25	104	3
10357	S18_4600	28	127	2
10358	S12_3148	49	55	5
10358	S12_4473	42	64	9
10358	S18_2238	20	121	10
10358	S18_2319	20	36	11
10358	S18_3232	32	93	12
10358	S18_4027	25	101	13
10358	S18_4668	30	177	8
10358	S24_1444	44	61	14
10358	S24_2300	41	139	7
10358	S24_2840	36	83	4
10358	S24_4258	41	167	6
10358	S32_1268	41	108	1
10358	S32_3522	36	157	2
10358	S700_2824	27	139	3
10359	S10_4757	48	55	6
10359	S12_1108	42	113	8
10359	S12_3891	49	62	5
10359	S24_4048	22	118	7
10359	S32_2509	36	177	3
10359	S32_3207	22	196	1
10359	S50_1392	46	106	2
10359	S50_1514	25	65	4
10360	S18_1662	50	59	12
10360	S18_2581	41	87	13
10360	S18_3029	46	77	14
10360	S18_3140	29	175	8
10360	S18_3259	29	101	18
10360	S18_3856	40	87	15
10360	S18_4522	40	86	1
10360	S24_1785	22	115	17
10360	S24_2011	31	119	2
10360	S24_2841	49	57	16
10360	S24_3151	36	114	3
10360	S24_3816	22	111	4
10360	S700_1138	32	101	5
10360	S700_1938	26	97	6
10360	S700_2610	30	125	7
10360	S700_3505	35	66	9
10360	S700_3962	31	104	10
10360	S72_3212	31	96	11
10361	S10_1678	20	73	13
10361	S10_2016	26	51	8
10361	S24_3420	34	114	6
10361	S24_3949	26	143	7
10361	S24_4278	25	62	1
10361	S32_4289	49	72	2
10361	S50_1341	33	83	3
10361	S700_1691	20	61	4
10361	S700_2047	24	45	14
10361	S700_2466	26	106	9
10361	S700_2834	44	72	5
10361	S700_3167	44	114	10
10361	S700_4002	35	122	11
10361	S72_1253	23	95	12
10362	S10_4698	22	167	4
10362	S12_2823	22	176	1
10362	S18_2625	23	50	3
10362	S24_1578	50	97	2
10363	S12_1099	33	85	3
10363	S12_3380	34	97	4
10363	S12_3990	34	82	5
10363	S12_4675	46	88	6
10363	S18_1889	22	168	7
10363	S18_3278	46	60	10
10363	S18_3482	24	173	11
10363	S18_3782	32	89	12
10363	S18_4721	28	58	13
10363	S24_2000	21	171	8
10363	S24_2360	43	61	14
10363	S24_3371	21	117	15
10363	S24_3856	31	95	1
10363	S24_4620	43	120	9
10363	S32_1374	50	132	2
10364	S32_2206	48	48	1
10365	S18_1129	30	87	1
10365	S32_4485	22	156	3
10365	S50_4713	44	113	2
10366	S18_1984	34	124	3
10366	S18_2870	49	125	2
10366	S18_3232	34	185	1
10367	S18_1589	49	56	1
10367	S18_1749	37	127	3
10367	S18_2248	45	197	4
10367	S18_2325	27	155	5
10367	S18_2795	32	95	7
10367	S18_3685	46	105	6
10367	S18_4409	43	63	8
10367	S18_4933	44	85	9
10367	S24_1046	21	60	10
10367	S24_1628	38	39	11
10367	S24_1937	23	36	13
10367	S24_2022	28	31	12
10367	S24_2972	36	139	2
10368	S24_2766	40	103	2
10368	S24_2887	31	136	5
10368	S24_3191	46	80	1
10368	S24_3432	20	100	4
10368	S24_3969	46	37	3
10369	S10_1949	41	110	2
10369	S18_1342	44	210	8
10369	S18_1367	32	99	7
10369	S18_2949	42	109	1
10369	S18_2957	28	44	6
10369	S18_3136	21	94	5
10369	S18_3320	45	73	4
10369	S24_4258	40	87	3
10370	S10_4962	35	66	4
10370	S12_1666	49	173	8
10370	S18_1097	27	145	1
10370	S18_2319	22	180	5
10370	S18_2432	22	97	7
10370	S18_3232	27	57	9
10370	S18_4600	29	58	6
10370	S18_4668	20	137	2
10370	S32_3522	25	126	3
10371	S12_1108	32	111	6
10371	S12_4473	49	36	4
10371	S18_2238	25	104	7
10371	S24_1444	25	97	12
10371	S24_2300	20	172	5
10371	S24_2840	45	123	8
10371	S24_4048	28	50	9
10371	S32_1268	26	156	1
10371	S32_2509	20	66	2
10371	S32_3207	30	100	11
10371	S50_1392	48	57	10
10371	S700_2824	34	127	3
10372	S12_3148	40	147	4
10372	S12_3891	34	175	1
10372	S18_3140	28	138	3
10372	S18_3259	25	85	5
10372	S18_4027	48	146	6
10372	S18_4522	41	87	7
10372	S24_2011	37	106	8
10372	S50_1514	24	59	9
10372	S700_1938	44	102	2
10373	S10_4757	39	104	3
10373	S18_1662	28	58	4
10373	S18_3029	22	87	5
10373	S18_3856	50	60	6
10373	S24_2841	38	70	7
10373	S24_3151	33	57	12
10373	S24_3420	46	66	11
10373	S24_3816	23	104	10
10373	S24_3949	39	73	13
10373	S700_1138	44	105	14
10373	S700_2047	32	84	15
10373	S700_2610	41	70	16
10373	S700_3505	34	96	2
10373	S700_3962	37	109	8
10373	S700_4002	45	56	17
10373	S72_1253	25	65	9
10373	S72_3212	29	137	1
10374	S10_2016	39	136	5
10374	S10_4698	22	174	1
10374	S18_2581	42	69	2
10374	S18_2625	22	53	4
10374	S24_1578	38	110	6
10374	S24_1785	46	94	3
10375	S10_1678	21	35	12
10375	S12_1099	45	76	7
10375	S12_2823	49	79	13
10375	S24_2000	23	106	9
10375	S24_2360	20	102	14
10375	S24_4278	43	233	2
10375	S32_1374	37	172	3
10375	S32_4289	44	82	4
10375	S32_4485	41	115	15
10375	S50_1341	49	66	5
10375	S50_4713	49	110	8
10375	S700_1691	37	82	6
10375	S700_2466	33	117	1
10375	S700_2834	25	67	10
10375	S700_3167	44	118	11
10376	S12_3380	35	114	1
10377	S12_3990	24	68	5
10377	S12_4675	50	104	1
10377	S18_1129	35	168	2
10377	S18_1889	31	68	4
10377	S18_1984	36	121	6
10377	S18_3232	39	186	3
10378	S18_1589	34	43	5
10378	S18_3278	22	112	4
10378	S18_3482	43	96	10
10378	S18_3782	28	165	9
10378	S18_4721	49	67	8
10378	S24_2972	41	143	7
10378	S24_3371	46	42	6
10378	S24_3856	33	53	3
10378	S24_4620	41	119	2
10378	S32_2206	40	82	1
10379	S18_1749	39	138	2
10379	S18_2248	27	49	1
10379	S18_2870	29	177	5
10379	S18_3685	32	71	4
10379	S24_1628	32	124	3
10380	S18_1342	27	93	13
10380	S18_2325	40	123	10
10380	S18_2795	21	47	8
10380	S18_4409	32	106	1
10380	S18_4933	24	189	2
10380	S24_1046	34	101	3
10380	S24_1937	32	71	4
10380	S24_2022	27	68	5
10380	S24_2766	36	38	6
10380	S24_2887	44	36	7
10380	S24_3191	44	79	9
10380	S24_3432	34	116	11
10380	S24_3969	43	95	12
10381	S10_1949	36	229	3
10381	S10_4962	37	168	6
10381	S12_1666	20	148	1
10381	S18_1097	48	98	2
10381	S18_1367	25	53	9
10381	S18_2432	35	49	7
10381	S18_2949	41	105	8
10381	S18_2957	40	68	4
10381	S18_3136	35	123	5
10382	S12_1108	34	112	10
10382	S12_3148	37	110	11
10382	S12_3891	34	95	12
10382	S12_4473	32	67	13
10382	S18_2238	25	88	5
10382	S18_3320	50	179	7
10382	S18_4600	39	125	1
10382	S18_4668	39	201	2
10382	S24_2300	20	133	3
10382	S24_4258	33	139	4
10382	S32_1268	26	104	6
10382	S32_3522	48	142	8
10382	S700_2824	34	55	9
10383	S18_2319	27	142	11
10383	S18_3140	24	62	9
10383	S18_3232	47	146	6
10383	S18_3259	26	128	12
10383	S18_4027	38	141	1
10383	S18_4522	28	59	7
10383	S24_1444	22	92	2
10383	S24_2840	40	152	3
10383	S24_4048	21	94	4
10383	S32_2509	32	53	5
10383	S32_3207	44	36	8
10383	S50_1392	29	106	13
10383	S50_1514	38	60	10
10384	S10_4757	34	143	4
10384	S24_2011	28	81	3
10384	S24_3151	43	98	2
10384	S700_1938	49	131	1
10385	S24_3816	37	86	2
10385	S700_1138	25	77	1
10386	S18_1662	25	55	7
10386	S18_2581	21	75	18
10386	S18_3029	37	93	5
10386	S18_3856	22	58	6
10386	S24_1785	33	42	11
10386	S24_2841	39	56	1
10386	S24_3420	35	64	9
10386	S24_3949	41	73	12
10386	S24_4278	50	63	8
10386	S700_2047	29	86	13
10386	S700_2466	37	84	14
10386	S700_2610	37	136	10
10386	S700_3167	32	94	17
10386	S700_3505	45	92	2
10386	S700_3962	30	95	3
10386	S700_4002	44	86	15
10386	S72_1253	50	87	16
10386	S72_3212	43	126	4
10387	S32_1374	44	95	1
10388	S10_1678	42	76	4
10388	S10_2016	50	45	5
10388	S10_4698	21	87	7
10388	S12_2823	44	135	6
10388	S32_4289	35	112	8
10388	S50_1341	27	119	1
10388	S700_1691	46	219	2
10388	S700_2834	50	143	3
10389	S12_1099	26	99	4
10389	S12_3380	25	72	6
10389	S12_3990	36	70	7
10389	S12_4675	47	112	8
10389	S18_1889	49	79	3
10389	S18_2625	39	179	5
10389	S24_1578	45	102	1
10389	S24_2000	49	81	2
10390	S18_1129	36	94	14
10390	S18_1984	34	43	15
10390	S18_2325	31	99	16
10390	S18_2795	26	78	7
10390	S18_3278	40	137	9
10390	S18_3482	50	148	1
10390	S18_3782	36	141	2
10390	S18_4721	49	140	3
10390	S24_2360	35	65	4
10390	S24_2972	37	132	5
10390	S24_3371	46	53	6
10390	S24_3856	45	150	8
10390	S24_4620	30	82	10
10390	S32_2206	41	45	11
10390	S32_4485	45	49	12
10390	S50_4713	22	159	13
10391	S10_1949	24	101	4
10391	S10_4962	37	47	7
10391	S12_1666	39	63	9
10391	S18_1097	29	85	10
10391	S18_1342	35	159	2
10391	S18_1367	42	119	3
10391	S18_2432	44	39	5
10391	S18_2949	32	45	6
10391	S24_1937	33	253	8
10391	S24_2022	24	168	1
10392	S18_2957	37	60	3
10392	S18_3136	29	87	2
10392	S18_3320	36	112	1
10393	S12_3148	35	109	8
10393	S12_4473	32	101	10
10393	S18_2238	20	70	11
10393	S18_2319	38	100	7
10393	S18_4600	30	121	9
10393	S18_4668	44	110	1
10393	S24_2300	33	177	2
10393	S24_4258	33	98	3
10393	S32_1268	38	145	4
10393	S32_3522	31	58	5
10393	S700_2824	21	102	6
10394	S18_3232	22	152	5
10394	S18_4027	37	172	1
10394	S24_1444	31	50	2
10394	S24_2840	46	39	6
10394	S24_4048	37	141	7
10394	S32_2509	36	63	3
10394	S32_3207	30	60	4
10395	S10_4757	32	105	2
10395	S12_1108	33	69	1
10395	S50_1392	46	124	4
10395	S50_1514	45	199	3
10396	S12_3891	33	185	3
10396	S18_3140	33	160	2
10396	S18_3259	24	90	4
10396	S18_4522	45	105	5
10396	S24_2011	49	117	6
10396	S24_3151	27	83	7
10396	S24_3816	37	91	8
10396	S700_1138	39	67	1
10397	S700_1938	32	81	5
10397	S700_2610	22	67	4
10397	S700_3505	48	108	3
10397	S700_3962	36	105	2
10397	S72_3212	34	62	1
10398	S18_1662	33	128	11
10398	S18_2581	34	77	15
10398	S18_3029	28	72	18
10398	S18_3856	45	107	17
10398	S24_1785	43	129	16
10398	S24_2841	28	58	3
10398	S24_3420	34	72	13
10398	S24_3949	41	68	2
10398	S24_4278	45	78	14
10398	S32_4289	22	67	4
10398	S50_1341	49	37	5
10398	S700_1691	47	88	6
10398	S700_2047	36	109	7
10398	S700_2466	22	87	8
10398	S700_2834	23	122	9
10398	S700_3167	29	66	10
10398	S700_4002	36	87	12
10398	S72_1253	34	40	1
10399	S10_1678	40	114	8
10399	S10_2016	51	124	7
10399	S10_4698	22	159	6
10399	S12_2823	29	164	5
10399	S18_2625	30	68	4
10399	S24_1578	57	106	3
10399	S24_2000	58	89	2
10399	S32_1374	32	100	1
10400	S10_4757	64	151	9
10400	S18_1662	34	189	1
10400	S18_3029	30	75	7
10400	S18_3856	58	126	6
10400	S24_2841	24	62	2
10400	S24_3420	38	57	3
10400	S24_3816	42	73	8
10400	S700_2047	46	88	5
10400	S72_1253	20	56	4
10401	S18_2581	42	76	3
10401	S24_1785	38	96	5
10401	S24_3949	64	60	12
10401	S24_4278	52	81	4
10401	S32_1374	49	102	1
10401	S32_4289	62	78	6
10401	S50_1341	56	35	7
10401	S700_1691	11	103	8
10401	S700_2466	85	89	10
10401	S700_2834	21	96	2
10401	S700_3167	77	92	9
10401	S700_4002	28	73	11
10402	S10_2016	45	130	1
10402	S18_2625	55	56	2
10402	S24_2000	59	88	3
10403	S10_1678	24	101	7
10403	S10_4698	66	180	9
10403	S12_2823	66	131	6
10403	S18_3782	36	52	1
10403	S24_1578	46	115	8
10403	S24_2360	27	80	4
10403	S32_2206	30	40	2
10403	S32_4485	45	115	5
10403	S50_4713	31	68	3
10404	S12_1099	64	206	3
10404	S12_3380	43	109	1
10404	S12_3990	77	74	4
10404	S18_3278	90	73	6
10404	S18_3482	28	134	5
10404	S18_4721	48	144	8
10404	S24_3371	49	62	2
10404	S24_4620	48	94	7
10405	S12_4675	97	93	5
10405	S18_1889	61	74	4
10405	S18_3232	55	151	1
10405	S24_2972	47	45	2
10405	S24_3856	76	154	3
10406	S18_1129	61	137	3
10406	S18_1984	48	149	2
10406	S18_3685	65	161	1
10407	S18_1589	59	119	11
10407	S18_1749	76	185	2
10407	S18_2248	42	73	1
10407	S18_2870	41	156	12
10407	S18_4409	6	90	3
10407	S18_4933	66	67	4
10407	S24_1046	26	76	8
10407	S24_1628	64	40	10
10407	S24_2766	76	95	6
10407	S24_2887	59	99	5
10407	S24_3191	13	81	7
10407	S24_3432	43	87	9
10408	S24_3969	15	37	1
10409	S18_2325	6	131	2
10409	S24_1937	61	30	1
10410	S18_1342	65	117	7
10410	S18_1367	44	58	6
10410	S18_2795	56	138	8
10410	S18_2949	47	118	1
10410	S18_2957	53	58	3
10410	S18_3136	34	115	2
10410	S18_3320	44	84	5
10410	S24_2022	31	45	9
10410	S24_4258	50	87	4
10411	S10_1949	23	180	9
10411	S10_4962	27	164	2
10411	S12_1666	40	156	6
10411	S18_1097	27	119	8
10411	S18_4600	46	114	3
10411	S18_4668	35	60	7
10411	S32_1268	26	112	1
10411	S32_3522	27	69	5
10411	S700_2824	34	105	4
10412	S12_4473	54	110	5
10412	S18_2238	41	164	4
10412	S18_2319	56	98	8
10412	S18_2432	47	62	11
10412	S18_3232	60	198	9
10412	S24_1444	21	53	2
10412	S24_2300	70	121	10
10412	S24_2840	30	36	6
10412	S24_4048	31	137	1
10412	S32_2509	19	49	7
10412	S50_1392	26	133	3
10413	S12_1108	36	241	2
10413	S12_3148	47	175	3
10413	S12_3891	22	154	1
10413	S18_4027	49	141	5
10413	S32_3207	24	50	6
10413	S50_1514	51	64	4
10414	S10_4757	19	146	3
10414	S18_3029	44	74	1
10414	S18_3140	41	119	12
10414	S18_3259	48	121	14
10414	S18_4522	16	75	11
10414	S24_2011	23	145	10
10414	S24_3151	60	102	5
10414	S24_3816	51	76	2
10414	S700_1138	37	71	6
10414	S700_1938	34	104	13
10414	S700_2610	31	76	4
10414	S700_3505	28	108	7
10414	S700_3962	27	90	8
10414	S72_3212	47	66	9
10415	S18_3856	51	122	5
10415	S24_2841	21	68	1
10415	S24_3420	18	70	2
10415	S700_2047	32	96	4
10415	S72_1253	42	58	3
10416	S18_1662	24	181	14
10416	S18_2581	15	99	4
10416	S24_1785	47	89	6
10416	S24_2000	32	88	1
10416	S24_3949	18	75	13
10416	S24_4278	48	75	5
10416	S32_1374	45	106	2
10416	S32_4289	26	61	7
10416	S50_1341	37	52	8
10416	S700_1691	23	91	9
10416	S700_2466	22	112	11
10416	S700_2834	41	138	3
10416	S700_3167	39	67	10
10416	S700_4002	43	62	12
10417	S10_1678	66	114	2
10417	S10_2016	45	131	5
10417	S10_4698	56	165	4
10417	S12_2823	21	164	1
10417	S18_2625	36	61	6
10417	S24_1578	35	101	3
10418	S18_3278	16	76	2
10418	S18_3482	27	165	1
10418	S18_3782	33	53	5
10418	S18_4721	28	137	4
10418	S24_2360	52	66	8
10418	S24_4620	10	87	3
10418	S32_2206	43	48	6
10418	S32_4485	50	113	9
10418	S50_4713	40	72	7
10419	S12_1099	12	163	13
10419	S12_3380	10	109	11
10419	S12_3990	34	90	14
10419	S12_4675	32	120	10
10419	S18_1129	38	117	5
10419	S18_1589	37	141	1
10419	S18_1889	39	84	9
10419	S18_1984	34	135	4
10419	S18_2870	55	140	2
10419	S18_3232	35	169	6
10419	S18_3685	43	130	3
10419	S24_2972	15	43	7
10419	S24_3371	55	53	12
10419	S24_3856	70	132	8
10420	S18_1749	37	143	5
10420	S18_2248	36	64	4
10420	S18_2325	45	111	2
10420	S18_4409	66	93	6
10420	S18_4933	36	58	7
10420	S24_1046	60	65	11
10420	S24_1628	37	60	13
10420	S24_1937	45	27	1
10420	S24_2766	39	101	9
10420	S24_2887	55	96	8
10420	S24_3191	35	97	10
10420	S24_3432	26	101	12
10420	S24_3969	15	43	3
10421	S18_2795	35	155	1
10421	S24_2022	40	46	2
10422	S18_1342	51	96	2
10422	S18_1367	25	52	1
10423	S18_2949	10	88	1
10423	S18_2957	31	54	3
10423	S18_3136	21	85	2
10423	S18_3320	21	89	5
10423	S24_4258	28	79	4
10424	S10_1949	50	240	6
10424	S12_1666	49	163	3
10424	S18_1097	54	133	5
10424	S18_4668	26	60	4
10424	S32_3522	44	61	2
10424	S700_2824	46	81	1
10425	S10_4962	38	155	12
10425	S12_4473	33	142	4
10425	S18_2238	28	190	3
10425	S18_2319	38	99	7
10425	S18_2432	19	49	10
10425	S18_3232	28	135	8
10425	S18_4600	38	114	13
10425	S24_1444	55	47	1
10425	S24_2300	49	112	9
10425	S24_2840	31	33	5
10425	S32_1268	41	87	11
10425	S32_2509	11	44	6
10425	S50_1392	18	105	2
\.


--
-- Data for Name: orderfact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orderfact (ordernumber, productcode, quantityordered, priceeach, orderlinenumber, totalprice, orderdate, requireddate, shippeddate, status, comments, customernumber, time_id, qtr_id, month_id, year_id) FROM stdin;
10100	S18_1749	30	100.00000000000000000	3	5151	2003-01-06 00:00:00	2003-01-13 00:00:00	2003-01-10 00:00:00	Shipped	\N	363	2003-01-06	1	1	2003
10100	S18_2248	50	67.80000000000000000	2	3390	2003-01-06 00:00:00	2003-01-13 00:00:00	2003-01-10 00:00:00	Shipped	\N	363	2003-01-06	1	1	2003
10100	S18_4409	22	86.51000000000000000	4	1903.22	2003-01-06 00:00:00	2003-01-13 00:00:00	2003-01-10 00:00:00	Shipped	\N	363	2003-01-06	1	1	2003
10100	S24_3969	49	34.47000000000000000	1	1689.03	2003-01-06 00:00:00	2003-01-13 00:00:00	2003-01-10 00:00:00	Shipped	\N	363	2003-01-06	1	1	2003
10101	S18_2325	25	100.00000000000000000	4	3782	2003-01-09 00:00:00	2003-01-18 00:00:00	2003-01-11 00:00:00	Shipped	Check on availability.	128	2003-01-09	1	1	2003
10101	S18_2795	26	100.00000000000000000	1	3773.3799	2003-01-09 00:00:00	2003-01-18 00:00:00	2003-01-11 00:00:00	Shipped	Check on availability.	128	2003-01-09	1	1	2003
10101	S24_1937	45	31.20000000000000000	3	1404	2003-01-09 00:00:00	2003-01-18 00:00:00	2003-01-11 00:00:00	Shipped	Check on availability.	128	2003-01-09	1	1	2003
10101	S24_2022	46	53.76000000000000000	2	2472.96	2003-01-09 00:00:00	2003-01-18 00:00:00	2003-01-11 00:00:00	Shipped	Check on availability.	128	2003-01-09	1	1	2003
10102	S18_1342	39	100.00000000000000000	2	4808.3101	2003-01-10 00:00:00	2003-01-18 00:00:00	2003-01-14 00:00:00	Shipped	\N	181	2003-01-10	1	1	2003
10102	S18_1367	41	50.14000000000000000	1	2055.74	2003-01-10 00:00:00	2003-01-18 00:00:00	2003-01-14 00:00:00	Shipped	\N	181	2003-01-10	1	1	2003
10103	S10_1949	26	100.00000000000000000	11	5404.6201	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S10_4962	42	100.00000000000000000	4	5398.2598	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S12_1666	27	100.00000000000000000	8	3394.98	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_1097	35	100.00000000000000000	10	3920	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_2432	22	54.09000000000000000	2	1189.98	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_2949	27	83.07000000000000000	12	2242.8899	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_2957	35	57.46000000000000000	14	2011.1	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_3136	25	100.00000000000000000	13	2539.5	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_3320	46	100.00000000000000000	16	4791.8198	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_4600	36	100.00000000000000000	5	4228.2002	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S18_4668	41	47.29000000000000000	9	1938.89	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S24_2300	36	100.00000000000000000	1	3680.28	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S24_4258	25	100.00000000000000000	15	2873	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S32_1268	31	100.00000000000000000	3	3224.3101	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S32_3522	45	75.63000000000000000	7	3403.3501	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10103	S700_2824	42	100.00000000000000000	6	4460.8198	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121	2003-01-29	1	1	2003
10104	S12_3148	34	100.00000000000000000	1	5958.5	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S12_4473	41	100.00000000000000000	9	4615.7798	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S18_2238	24	100.00000000000000000	8	3457.9199	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S18_2319	29	100.00000000000000000	12	3772.6101	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S18_3232	23	100.00000000000000000	13	4556.9902	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S18_4027	38	100.00000000000000000	3	5348.5	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S24_1444	35	55.49000000000000000	6	1942.15	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S24_2840	44	39.60000000000000000	10	1742.4	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S24_4048	26	100.00000000000000000	5	2921.6201	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S32_2509	35	47.62000000000000000	11	1666.7	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S32_3207	49	65.87000000000000000	4	3227.6299	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S50_1392	33	100.00000000000000000	7	3705.24	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10104	S50_1514	32	53.31000000000000000	2	1705.92	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141	2003-01-31	1	1	2003
10105	S10_4757	50	100.00000000000000000	2	7208	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S12_1108	41	100.00000000000000000	15	8690.3604	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S12_3891	29	100.00000000000000000	14	4566.0498	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S18_3140	22	100.00000000000000000	11	3065.04	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S18_3259	38	100.00000000000000000	13	4330.1001	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S18_4522	41	82.50000000000000000	10	3382.5	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S24_2011	43	100.00000000000000000	9	6341.21	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S24_3151	44	72.58000000000000000	4	3193.52	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S24_3816	50	79.67000000000000000	1	3983.5	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S700_1138	41	70.67000000000000000	5	2897.47	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S700_1938	29	70.15000000000000000	12	2034.35	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S700_2610	31	65.77000000000000000	3	2038.87	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S700_3505	39	81.14000000000000000	6	3164.46	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S700_3962	22	100.00000000000000000	7	2556.1799	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10105	S72_3212	25	56.78000000000000000	8	1419.5	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145	2003-02-11	1	2	2003
10106	S18_1662	36	100.00000000000000000	12	5279.3999	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S18_2581	34	90.39000000000000000	2	3073.26	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S18_3029	41	83.44000000000000000	18	3421.04	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S18_3856	41	100.00000000000000000	17	4774.8599	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S24_1785	28	88.63000000000000000	4	2481.6399	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S24_2841	49	74.68000000000000000	13	3659.3201	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S24_3420	31	52.60000000000000000	14	1630.6	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S24_3949	50	64.83000000000000000	11	3241.5	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S24_4278	26	63.76000000000000000	3	1657.76	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S32_4289	33	72.92000000000000000	5	2406.3601	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S50_1341	39	40.15000000000000000	6	1565.85	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_1691	31	100.00000000000000000	7	3312.97	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_2047	30	100.00000000000000000	16	3177.3	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_2466	34	100.00000000000000000	9	3763.46	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_2834	32	100.00000000000000000	1	3986.5601	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_3167	44	74.40000000000000000	8	3273.6001	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S700_4002	48	61.44000000000000000	10	2949.1201	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10106	S72_1253	48	52.64000000000000000	15	2526.72	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278	2003-02-17	1	2	2003
10107	S10_1678	30	95.70000000000000000	2	2871	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S10_2016	39	99.91000000000000000	5	3896.49	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S10_4698	27	100.00000000000000000	4	6065.5498	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S12_2823	21	100.00000000000000000	1	3036.6001	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S18_2625	29	70.87000000000000000	6	2055.23	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S24_1578	25	100.00000000000000000	3	2845.75	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S24_2000	38	83.03000000000000000	7	3155.1399	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10107	S32_1374	20	92.90000000000000000	8	1858	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131	2003-02-24	1	2	2003
10108	S12_1099	33	100.00000000000000000	6	5265.1499	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S12_3380	45	100.00000000000000000	4	6130.3501	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S12_3990	39	89.38000000000000000	7	3485.8201	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S12_4675	36	100.00000000000000000	3	3731.04	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S18_1889	38	82.39000000000000000	2	3130.8201	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S18_3278	26	68.35000000000000000	9	1777.1	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S18_3482	29	100.00000000000000000	8	4049.5601	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S18_3782	43	67.77000000000000000	12	2914.1101	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S18_4721	44	100.00000000000000000	11	5565.1201	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S24_2360	35	58.87000000000000000	15	2060.45	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S24_3371	30	63.07000000000000000	5	1892.1	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S24_3856	40	100.00000000000000000	1	5448.7998	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S24_4620	31	68.71000000000000000	10	2130.01	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S32_2206	27	43.45000000000000000	13	1173.15	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S32_4485	31	100.00000000000000000	16	3669.78	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10108	S50_4713	34	82.99000000000000000	14	2821.6599	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385	2003-03-03	1	3	2003
10109	S18_1129	26	100.00000000000000000	4	4379.1802	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10109	S18_1984	38	100.00000000000000000	3	4432.7002	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10109	S18_2870	26	100.00000000000000000	1	3157.4399	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10109	S18_3232	46	100.00000000000000000	5	8257	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10109	S18_3685	47	100.00000000000000000	2	6241.6001	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10109	S24_2972	29	32.10000000000000000	6	930.90002	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486	2003-03-10	1	3	2003
10110	S18_1589	37	100.00000000000000000	16	5433.0801	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_1749	42	100.00000000000000000	7	6069	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_2248	32	50.25000000000000000	6	1608	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_2325	33	100.00000000000000000	4	3859.6799	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_2795	31	100.00000000000000000	1	5074.3901	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_4409	28	89.27000000000000000	8	2499.5601	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S18_4933	42	61.29000000000000000	9	2574.1799	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_1046	36	85.25000000000000000	13	3069	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_1628	29	59.37000000000000000	15	1721.73	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_1937	20	35.51000000000000000	3	710.20001	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_2022	39	44.35000000000000000	2	1729.65	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_2766	43	78.15000000000000000	11	3360.45	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_2887	46	100.00000000000000000	10	5942.2798	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_3191	27	73.62000000000000000	12	1987.74	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_3432	37	100.00000000000000000	14	3724.4199	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10110	S24_3969	48	34.47000000000000000	5	1654.5601	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187	2003-03-18	1	3	2003
10111	S18_1342	33	99.66000000000000000	6	3288.78	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10111	S18_1367	48	49.06000000000000000	5	2354.8799	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10111	S18_2957	28	64.33000000000000000	2	1801.24	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10111	S18_3136	43	100.00000000000000000	1	4818.1499	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10111	S18_3320	39	100.00000000000000000	4	4178.8501	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10111	S24_4258	26	86.68000000000000000	3	2253.6799	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129	2003-03-25	1	3	2003
10112	S10_1949	29	100.00000000000000000	1	7209.1099	2003-03-24 00:00:00	2003-04-03 00:00:00	2003-03-29 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	144	2003-03-24	1	3	2003
10112	S18_2949	23	100.00000000000000000	2	2539.8899	2003-03-24 00:00:00	2003-04-03 00:00:00	2003-03-29 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	144	2003-03-24	1	3	2003
10113	S12_1666	21	100.00000000000000000	2	3415.4399	2003-03-26 00:00:00	2003-04-02 00:00:00	2003-03-27 00:00:00	Shipped	\N	124	2003-03-26	1	3	2003
10113	S18_1097	49	100.00000000000000000	4	4916.6602	2003-03-26 00:00:00	2003-04-02 00:00:00	2003-03-27 00:00:00	Shipped	\N	124	2003-03-26	1	3	2003
10113	S18_4668	50	49.81000000000000000	3	2490.5	2003-03-26 00:00:00	2003-04-02 00:00:00	2003-03-27 00:00:00	Shipped	\N	124	2003-03-26	1	3	2003
10113	S32_3522	23	68.52000000000000000	1	1575.96	2003-03-26 00:00:00	2003-04-02 00:00:00	2003-03-27 00:00:00	Shipped	\N	124	2003-03-26	1	3	2003
10114	S10_4962	31	100.00000000000000000	8	4305.2798	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S18_2319	39	100.00000000000000000	3	4164.4199	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S18_2432	45	68.67000000000000000	6	3090.1499	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S18_3232	48	100.00000000000000000	4	8209.4404	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S18_4600	41	100.00000000000000000	9	4815.4502	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S24_2300	21	100.00000000000000000	5	2925.0901	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S24_2840	24	30.06000000000000000	1	721.44	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S32_1268	32	100.00000000000000000	7	3667.52	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S32_2509	28	55.73000000000000000	2	1560.4399	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10114	S700_2824	42	100.00000000000000000	10	4758.1802	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172	2003-04-01	2	4	2003
10115	S12_4473	46	100.00000000000000000	5	5723.7798	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424	2003-04-04	2	4	2003
10115	S18_2238	46	100.00000000000000000	4	7381.1602	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424	2003-04-04	2	4	2003
10115	S24_1444	47	69.36000000000000000	2	3259.9199	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424	2003-04-04	2	4	2003
10115	S24_4048	44	100.00000000000000000	1	5568.6401	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424	2003-04-04	2	4	2003
10115	S50_1392	27	100.00000000000000000	3	2843.9099	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424	2003-04-04	2	4	2003
10116	S32_3207	27	63.38000000000000000	1	1711.26	2003-04-11 00:00:00	2003-04-19 00:00:00	2003-04-13 00:00:00	Shipped	\N	381	2003-04-11	2	4	2003
10117	S12_1108	33	100.00000000000000000	9	6034.3799	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S12_3148	43	100.00000000000000000	10	5911.6401	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S12_3891	39	100.00000000000000000	8	5938.1401	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S18_3140	26	100.00000000000000000	5	3551.3401	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S18_3259	21	95.80000000000000000	7	2011.8	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S18_4027	22	100.00000000000000000	12	2780.5801	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S18_4522	23	97.42000000000000000	4	2240.6599	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S24_2011	41	100.00000000000000000	3	5189.7798	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S50_1514	21	49.21000000000000000	11	1033.41	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S700_1938	38	79.68000000000000000	6	3027.8401	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S700_3962	45	83.42000000000000000	1	3753.8999	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10117	S72_3212	50	43.68000000000000000	2	2184	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148	2003-04-16	2	4	2003
10118	S700_3505	36	100.00000000000000000	1	4219.2002	2003-04-21 00:00:00	2003-04-29 00:00:00	2003-04-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	216	2003-04-21	2	4	2003
10119	S10_4757	46	100.00000000000000000	11	5004.7998	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S18_1662	43	100.00000000000000000	3	6916.1201	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S18_3029	21	89.46000000000000000	9	1878.66	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S18_3856	27	99.52000000000000000	8	2687.04	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S24_2841	41	59.60000000000000000	4	2443.6001	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S24_3151	35	87.62000000000000000	13	3066.7	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S24_3420	20	72.98000000000000000	5	1459.6	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S24_3816	35	90.57000000000000000	10	3169.95	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S24_3949	28	70.29000000000000000	2	1968.12	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S700_1138	25	76.67000000000000000	14	1916.75	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S700_2047	29	94.14000000000000000	7	2730.0601	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S700_2610	38	65.77000000000000000	12	2499.26	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S700_4002	26	59.22000000000000000	1	1539.72	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10119	S72_1253	28	48.17000000000000000	6	1348.76	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382	2003-04-28	2	4	2003
10120	S10_2016	29	96.34000000000000000	3	2793.8601	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S10_4698	46	100.00000000000000000	2	9264.8604	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S18_2581	29	71.81000000000000000	8	2082.49	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S18_2625	46	58.15000000000000000	4	2674.8999	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S24_1578	35	98.05000000000000000	1	3431.75	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S24_1785	39	100.00000000000000000	10	4651.5298	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S24_2000	34	83.79000000000000000	5	2848.8601	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S24_4278	29	85.49000000000000000	9	2479.21	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S32_1374	22	100.00000000000000000	6	2461.3601	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S32_4289	29	72.23000000000000000	11	2094.6699	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S50_1341	49	50.62000000000000000	12	2480.3799	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S700_1691	47	82.21000000000000000	13	3863.8701	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S700_2466	24	100.00000000000000000	15	2584.8	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S700_2834	24	100.00000000000000000	7	3417.1201	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10120	S700_3167	43	76.00000000000000000	14	3268	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114	2003-04-29	2	4	2003
10121	S10_1678	34	81.35000000000000000	5	2765.8999	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353	2003-05-07	2	5	2003
10121	S12_2823	50	100.00000000000000000	4	8284	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353	2003-05-07	2	5	2003
10121	S24_2360	32	76.88000000000000000	2	2460.1599	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353	2003-05-07	2	5	2003
10121	S32_4485	25	86.74000000000000000	3	2168.5	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353	2003-05-07	2	5	2003
10121	S50_4713	44	74.85000000000000000	1	3293.3999	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353	2003-05-07	2	5	2003
10122	S12_1099	42	100.00000000000000000	10	7599.8999	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S12_3380	37	99.82000000000000000	8	3693.3401	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S12_3990	32	63.84000000000000000	11	2042.88	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S12_4675	20	100.00000000000000000	7	2142	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_1129	34	100.00000000000000000	2	5004.7998	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_1889	43	72.38000000000000000	6	3112.3401	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_1984	31	100.00000000000000000	1	4100.9902	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_3232	25	100.00000000000000000	3	3598.5	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_3278	21	73.17000000000000000	13	1536.5699	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_3482	21	100.00000000000000000	12	2469.3899	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_3782	35	49.74000000000000000	16	1740.9	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S18_4721	28	100.00000000000000000	15	3583.1599	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S24_2972	39	30.96000000000000000	4	1207.4399	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S24_3371	34	50.21000000000000000	9	1707.14	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S24_3856	43	100.00000000000000000	5	5494.9702	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S24_4620	29	71.14000000000000000	14	2063.0601	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10122	S32_2206	31	44.66000000000000000	17	1384.46	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350	2003-05-08	2	5	2003
10123	S18_1589	26	100.00000000000000000	2	3073.72	2003-05-20 00:00:00	2003-05-29 00:00:00	2003-05-22 00:00:00	Shipped	\N	103	2003-05-20	2	5	2003
10123	S18_2870	46	100.00000000000000000	3	5161.2002	2003-05-20 00:00:00	2003-05-29 00:00:00	2003-05-22 00:00:00	Shipped	\N	103	2003-05-20	2	5	2003
10123	S18_3685	34	100.00000000000000000	4	5331.8799	2003-05-20 00:00:00	2003-05-29 00:00:00	2003-05-22 00:00:00	Shipped	\N	103	2003-05-20	2	5	2003
10123	S24_1628	50	59.87000000000000000	1	2993.5	2003-05-20 00:00:00	2003-05-29 00:00:00	2003-05-22 00:00:00	Shipped	\N	103	2003-05-20	2	5	2003
10124	S18_1749	21	100.00000000000000000	6	2856	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S18_2248	42	53.88000000000000000	5	2262.96	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S18_2325	42	100.00000000000000000	3	4431.8398	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S18_4409	36	85.59000000000000000	7	3081.24	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S18_4933	23	57.73000000000000000	8	1327.79	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_1046	22	77.90000000000000000	12	1713.8	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_1937	45	37.84000000000000000	2	1702.8	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_2022	22	45.25000000000000000	1	995.5	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_2766	32	72.70000000000000000	10	2326.3999	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_2887	25	93.95000000000000000	9	2348.75	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_3191	49	83.04000000000000000	11	4068.96	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_3432	43	100.00000000000000000	13	5203	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10124	S24_3969	46	33.23000000000000000	4	1528.58	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112	2003-05-21	2	5	2003
10125	S18_1342	32	100.00000000000000000	1	3254.72	2003-05-21 00:00:00	2003-05-27 00:00:00	2003-05-24 00:00:00	Shipped	\N	114	2003-05-21	2	5	2003
10125	S18_2795	34	100.00000000000000000	2	6483.46	2003-05-21 00:00:00	2003-05-27 00:00:00	2003-05-24 00:00:00	Shipped	\N	114	2003-05-21	2	5	2003
10126	S10_1949	38	100.00000000000000000	11	7329.0601	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S10_4962	22	100.00000000000000000	4	3347.74	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S12_1666	21	100.00000000000000000	8	2439.5701	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_1097	38	100.00000000000000000	10	3857	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_1367	42	54.99000000000000000	17	2309.5801	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_2432	43	65.02000000000000000	2	2795.8601	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_2949	31	90.17000000000000000	12	2795.27	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_2957	46	73.70000000000000000	14	3390.2	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_3136	30	97.39000000000000000	13	2921.7	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_3320	38	82.34000000000000000	16	3128.9199	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_4600	50	100.00000000000000000	5	7083	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S18_4668	43	53.83000000000000000	9	2314.6899	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S24_2300	27	100.00000000000000000	1	3415.77	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S24_4258	34	100.00000000000000000	15	3576.1201	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S32_1268	43	96.31000000000000000	3	4141.3301	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S32_3522	26	62.70000000000000000	7	1630.2	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10126	S700_2824	45	100.00000000000000000	6	4597.2002	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458	2003-05-28	2	5	2003
10127	S12_1108	46	100.00000000000000000	2	11279.2	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S12_3148	46	100.00000000000000000	3	7366.4399	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S12_3891	42	100.00000000000000000	1	8138.7598	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S12_4473	24	100.00000000000000000	11	2559.6001	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S18_2238	45	100.00000000000000000	10	7146.8999	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S18_2319	45	100.00000000000000000	14	6295.9502	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S18_3232	22	100.00000000000000000	15	3837.24	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S18_4027	25	100.00000000000000000	5	3447	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S24_1444	20	60.69000000000000000	8	1213.8	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S24_2840	39	38.19000000000000000	12	1489.41	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10423	S18_3320	21	89.29000000000000000	5	1875.09	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314	2005-05-30	2	5	2005
10127	S24_4048	20	96.99000000000000000	7	1939.8	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S32_2509	45	51.95000000000000000	13	2337.75	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S32_3207	29	70.84000000000000000	6	2054.3601	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S50_1392	46	100.00000000000000000	9	6176.4199	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10127	S50_1514	46	69.12000000000000000	4	3179.52	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151	2003-06-03	2	6	2003
10128	S18_3140	41	100.00000000000000000	2	5544.02	2003-06-06 00:00:00	2003-06-12 00:00:00	2003-06-11 00:00:00	Shipped	\N	141	2003-06-06	2	6	2003
10128	S18_3259	41	100.00000000000000000	4	4837.1802	2003-06-06 00:00:00	2003-06-12 00:00:00	2003-06-11 00:00:00	Shipped	\N	141	2003-06-06	2	6	2003
10128	S18_4522	43	92.16000000000000000	1	3962.8799	2003-06-06 00:00:00	2003-06-12 00:00:00	2003-06-11 00:00:00	Shipped	\N	141	2003-06-06	2	6	2003
10128	S700_1938	32	97.00000000000000000	3	3104	2003-06-06 00:00:00	2003-06-12 00:00:00	2003-06-11 00:00:00	Shipped	\N	141	2003-06-06	2	6	2003
10129	S10_4757	33	100.00000000000000000	2	4398.2402	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S24_2011	45	100.00000000000000000	9	6027.75	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S24_3151	41	94.71000000000000000	4	3883.1101	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S24_3816	50	77.99000000000000000	1	3899.5	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S700_1138	31	60.00000000000000000	5	1860	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S700_2610	45	85.29000000000000000	3	3838.05	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S700_3505	42	91.15000000000000000	6	3828.3	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S700_3962	30	85.41000000000000000	7	2562.3	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10129	S72_3212	32	64.97000000000000000	8	2079.04	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324	2003-06-12	2	6	2003
10130	S18_3029	40	96.34000000000000000	2	3853.6001	2003-06-16 00:00:00	2003-06-24 00:00:00	2003-06-21 00:00:00	Shipped	\N	198	2003-06-16	2	6	2003
10130	S18_3856	33	100.00000000000000000	1	3423.75	2003-06-16 00:00:00	2003-06-24 00:00:00	2003-06-21 00:00:00	Shipped	\N	198	2003-06-16	2	6	2003
10131	S18_1662	21	100.00000000000000000	4	2781.6599	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S24_2841	35	67.14000000000000000	5	2349.8999	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S24_3420	29	59.18000000000000000	6	1716.22	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S24_3949	50	81.89000000000000000	3	4094.5	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S700_2047	22	85.99000000000000000	8	1891.78	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S700_2466	40	100.00000000000000000	1	4427.6001	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S700_4002	26	85.13000000000000000	2	2213.3799	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10131	S72_1253	21	41.71000000000000000	7	875.90997	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447	2003-06-16	2	6	2003
10132	S700_3167	36	68.80000000000000000	1	2476.8	2003-06-25 00:00:00	2003-07-01 00:00:00	2003-06-28 00:00:00	Shipped	\N	323	2003-06-25	2	6	2003
10133	S18_2581	49	69.27000000000000000	3	3394.23	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S24_1785	41	94.10000000000000000	5	3858.1001	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S24_4278	46	77.52000000000000000	4	3565.9199	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S32_1374	23	100.00000000000000000	1	2642.01	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S32_4289	49	57.10000000000000000	6	2797.8999	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S50_1341	27	50.19000000000000000	7	1355.13	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S700_1691	24	77.64000000000000000	8	1863.36	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10133	S700_2834	27	99.67000000000000000	2	2691.0901	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141	2003-06-27	2	6	2003
10134	S10_1678	41	94.74000000000000000	2	3884.3401	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S10_2016	27	100.00000000000000000	5	3307.77	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S10_4698	31	100.00000000000000000	4	7023.98	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S12_2823	20	100.00000000000000000	1	2711.2	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S18_2625	30	61.78000000000000000	6	1853.4	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S24_1578	35	93.54000000000000000	3	3273.8999	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10134	S24_2000	43	83.03000000000000000	7	3570.29	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250	2003-07-01	3	7	2003
10135	S12_1099	42	100.00000000000000000	7	8008.5601	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S12_3380	48	100.00000000000000000	5	6031.6802	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S12_3990	24	75.01000000000000000	8	1800.24	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S12_4675	29	97.89000000000000000	4	2838.8101	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S18_1889	48	79.31000000000000000	3	3806.8799	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S18_3278	45	78.00000000000000000	10	3510	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S18_3482	42	100.00000000000000000	9	5432.7002	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S18_3782	45	50.36000000000000000	13	2266.2	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S18_4721	31	100.00000000000000000	12	4705.1802	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S24_2360	29	61.64000000000000000	16	1787.5601	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S24_2972	20	35.87000000000000000	1	717.40002	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S24_3371	27	66.13000000000000000	6	1785.51	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S24_3856	47	100.00000000000000000	2	6336.0698	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S24_4620	23	87.31000000000000000	11	2008.13	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S32_2206	33	40.23000000000000000	14	1327.59	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S32_4485	30	89.80000000000000000	17	2694	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10135	S50_4713	44	96.00000000000000000	15	4224	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124	2003-07-02	3	7	2003
10136	S18_1129	25	100.00000000000000000	2	3644.75	2003-07-04 00:00:00	2003-07-14 00:00:00	2003-07-06 00:00:00	Shipped	Customer is interested in buying more Ferrari models	242	2003-07-04	3	7	2003
10136	S18_1984	36	100.00000000000000000	1	5274.7202	2003-07-04 00:00:00	2003-07-14 00:00:00	2003-07-06 00:00:00	Shipped	Customer is interested in buying more Ferrari models	242	2003-07-04	3	7	2003
10136	S18_3232	41	100.00000000000000000	3	8331.6104	2003-07-04 00:00:00	2003-07-14 00:00:00	2003-07-06 00:00:00	Shipped	Customer is interested in buying more Ferrari models	242	2003-07-04	3	7	2003
10137	S18_1589	44	99.55000000000000000	2	4380.2002	2003-07-10 00:00:00	2003-07-20 00:00:00	2003-07-14 00:00:00	Shipped	\N	353	2003-07-10	3	7	2003
10137	S18_2870	37	100.00000000000000000	3	4346.7598	2003-07-10 00:00:00	2003-07-20 00:00:00	2003-07-14 00:00:00	Shipped	\N	353	2003-07-10	3	7	2003
10137	S18_3685	31	100.00000000000000000	4	5124.2998	2003-07-10 00:00:00	2003-07-20 00:00:00	2003-07-14 00:00:00	Shipped	\N	353	2003-07-10	3	7	2003
10137	S24_1628	26	49.81000000000000000	1	1295.0601	2003-07-10 00:00:00	2003-07-20 00:00:00	2003-07-14 00:00:00	Shipped	\N	353	2003-07-10	3	7	2003
10138	S18_1749	33	100.00000000000000000	6	5329.5	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S18_2248	22	48.43000000000000000	5	1065.46	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S18_2325	38	100.00000000000000000	3	4106.2798	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S18_4409	47	100.00000000000000000	7	4714.5698	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S18_4933	23	66.99000000000000000	8	1540.77	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_1046	45	84.51000000000000000	12	3802.95	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_1937	22	29.21000000000000000	2	642.62	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_2022	33	43.01000000000000000	1	1419.33	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_2766	28	100.00000000000000000	10	2926	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_2887	30	100.00000000000000000	9	4157.3999	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_3191	49	90.75000000000000000	11	4446.75	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_3432	21	100.00000000000000000	13	2496.0601	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10138	S24_3969	29	38.16000000000000000	4	1106.64	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496	2003-07-07	3	7	2003
10139	S18_1342	31	100.00000000000000000	7	3184.9399	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_1367	49	43.13000000000000000	6	2113.3701	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_2795	41	100.00000000000000000	8	7956.46	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_2949	46	100.00000000000000000	1	5545.7598	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_2957	20	71.20000000000000000	3	1424	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_3136	20	90.06000000000000000	2	1801.2	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S18_3320	30	100.00000000000000000	5	3095.3999	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10139	S24_4258	29	100.00000000000000000	4	3276.1299	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282	2003-07-16	3	7	2003
10140	S10_1949	37	100.00000000000000000	11	7374.1001	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S10_4962	26	100.00000000000000000	4	3188.1201	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S12_1666	38	100.00000000000000000	8	4829.7998	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S18_1097	32	100.00000000000000000	10	4181.4399	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S18_2432	46	61.99000000000000000	2	2851.54	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S18_4600	40	100.00000000000000000	5	4601.2002	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S18_4668	29	43.27000000000000000	9	1254.83	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S24_2300	47	100.00000000000000000	1	5105.1401	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S32_1268	26	100.00000000000000000	3	2829.5801	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S32_3522	28	60.76000000000000000	7	1701.28	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10140	S700_2824	36	100.00000000000000000	6	4114.7998	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161	2003-07-24	3	7	2003
10141	S12_4473	21	100.00000000000000000	5	2140.1101	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S18_2238	39	100.00000000000000000	4	5938.5298	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S18_2319	47	100.00000000000000000	8	6287.6602	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S18_3232	34	100.00000000000000000	9	4836.5	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S24_1444	20	54.33000000000000000	2	1086.6	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S24_2840	21	42.43000000000000000	6	891.03003	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S24_4048	40	94.62000000000000000	1	3784.8	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S32_2509	24	45.99000000000000000	7	1103.76	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10141	S50_1392	44	100.00000000000000000	3	5500.4399	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334	2003-08-01	3	8	2003
10142	S12_1108	33	100.00000000000000000	12	8023.29	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S12_3148	33	100.00000000000000000	13	4985.6401	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S12_3891	46	100.00000000000000000	11	9470.9404	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S18_3140	47	100.00000000000000000	8	6034.3301	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S18_3259	22	97.81000000000000000	10	2151.8201	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S18_4027	24	100.00000000000000000	15	3791.52	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S18_4522	24	70.22000000000000000	7	1685.28	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S24_2011	33	100.00000000000000000	6	3366	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S24_3151	49	98.25000000000000000	1	4814.25	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S32_3207	42	74.57000000000000000	16	3131.9399	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S50_1514	42	49.79000000000000000	14	2091.1799	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S700_1138	41	64.00000000000000000	2	2624	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S700_1938	43	84.01000000000000000	9	3612.4299	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S700_3505	21	100.00000000000000000	3	2334.99	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S700_3962	38	85.41000000000000000	4	3245.5801	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10142	S72_3212	39	44.23000000000000000	5	1724.97	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124	2003-08-08	3	8	2003
10143	S10_4757	49	100.00000000000000000	15	5597.7598	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S18_1662	32	100.00000000000000000	7	5248	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S18_3029	46	74.84000000000000000	13	3442.6399	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S18_3856	34	100.00000000000000000	12	3455.76	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S24_2841	27	60.97000000000000000	8	1646.1899	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S24_3420	33	77.59000000000000000	9	2560.47	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S24_3816	23	80.51000000000000000	14	1851.73	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S24_3949	28	66.19000000000000000	6	1853.3199	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S50_1341	34	36.66000000000000000	1	1246.4399	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_1691	36	100.00000000000000000	2	3945.96	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_2047	26	100.00000000000000000	11	2612.48	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_2466	26	82.77000000000000000	4	2152.02	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_2610	31	85.29000000000000000	16	2643.99	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_3167	28	96.00000000000000000	3	2688	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S700_4002	34	85.87000000000000000	5	2919.5801	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10143	S72_1253	37	50.65000000000000000	10	1874.05	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320	2003-08-10	3	8	2003
10144	S32_4289	20	81.86000000000000000	1	1637.2	2003-08-13 00:00:00	2003-08-21 00:00:00	2003-08-14 00:00:00	Shipped	\N	381	2003-08-13	3	8	2003
10145	S10_1678	45	83.26000000000000000	6	3746.7	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S10_2016	37	100.00000000000000000	9	5192.9502	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S10_4698	33	100.00000000000000000	8	5176.3799	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S12_2823	49	100.00000000000000000	5	8339.7998	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S18_2581	30	85.32000000000000000	14	2559.6001	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S18_2625	30	49.67000000000000000	10	1490.1	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S24_1578	43	95.80000000000000000	7	4119.3999	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S24_1785	40	87.54000000000000000	16	3501.6001	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S24_2000	47	83.03000000000000000	11	3902.4099	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S24_2360	27	60.95000000000000000	3	1645.65	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S24_4278	33	84.77000000000000000	15	2797.4099	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S32_1374	33	93.90000000000000000	12	3098.7	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S32_2206	31	35.80000000000000000	1	1109.8	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S32_4485	27	100.00000000000000000	4	3251.3401	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S50_4713	38	81.36000000000000000	2	3091.6799	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10145	S700_2834	20	100.00000000000000000	13	2752.6001	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205	2003-08-25	3	8	2003
10146	S18_3782	47	67.14000000000000000	2	3155.5801	2003-09-03 00:00:00	2003-09-13 00:00:00	2003-09-06 00:00:00	Shipped	\N	447	2003-09-03	3	9	2003
10146	S18_4721	29	100.00000000000000000	1	4444.54	2003-09-03 00:00:00	2003-09-13 00:00:00	2003-09-06 00:00:00	Shipped	\N	447	2003-09-03	3	9	2003
10147	S12_1099	48	100.00000000000000000	7	9245.7598	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S12_3380	31	100.00000000000000000	5	3494.9399	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S12_3990	21	63.84000000000000000	8	1340.64	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S12_4675	33	97.89000000000000000	4	3230.3701	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S18_1889	26	82.39000000000000000	3	2142.1399	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S18_3278	36	86.04000000000000000	10	3097.4399	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S18_3482	37	100.00000000000000000	9	4405.2202	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S24_2972	25	42.67000000000000000	1	1066.75	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S24_3371	30	68.58000000000000000	6	2057.3999	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S24_3856	23	100.00000000000000000	2	2906.97	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10147	S24_4620	31	64.67000000000000000	11	2004.77	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379	2003-09-05	3	9	2003
10148	S18_1129	23	100.00000000000000000	13	2702.04	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_1589	47	100.00000000000000000	9	5848.6802	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_1984	25	100.00000000000000000	12	4232	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_2870	27	100.00000000000000000	10	3528.3601	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_3232	32	100.00000000000000000	14	5418.8799	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_3685	28	100.00000000000000000	11	3639.4399	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_4409	34	100.00000000000000000	1	3598.22	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S18_4933	29	81.25000000000000000	2	2356.25	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_1046	25	60.26000000000000000	6	1506.5	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_1628	47	56.85000000000000000	8	2671.95	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_2766	21	73.60000000000000000	4	1545.6	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_2887	34	100.00000000000000000	3	4392.1201	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_3191	31	73.62000000000000000	5	2282.22	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10148	S24_3432	27	100.00000000000000000	7	3469.5	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276	2003-09-11	3	9	2003
10149	S18_1342	50	100.00000000000000000	4	5907.5	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_1367	30	58.22000000000000000	3	1746.6	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_1749	34	100.00000000000000000	11	5375.3999	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_2248	24	62.36000000000000000	10	1496.64	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_2325	33	100.00000000000000000	8	4950.3301	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_2795	23	100.00000000000000000	5	4230.6201	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S18_3320	42	94.25000000000000000	2	3958.5	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S24_1937	36	33.19000000000000000	7	1194.84	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S24_2022	49	49.28000000000000000	6	2414.72	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S24_3969	26	38.98000000000000000	9	1013.48	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10149	S24_4258	20	90.57000000000000000	1	1811.4	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487	2003-09-12	3	9	2003
10150	S10_1949	45	100.00000000000000000	8	10993.5	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S10_4962	20	100.00000000000000000	1	3191.2	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S12_1666	30	100.00000000000000000	5	4100.1001	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_1097	34	100.00000000000000000	7	4641	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_2949	47	91.18000000000000000	9	4285.46	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_2957	30	49.97000000000000000	11	1499.1	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_3136	26	100.00000000000000000	10	2804.3601	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_4600	49	100.00000000000000000	2	6467.02	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S18_4668	30	42.76000000000000000	6	1282.8	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S32_3522	49	58.18000000000000000	4	2850.8201	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10150	S700_2824	20	100.00000000000000000	3	2104	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148	2003-09-19	3	9	2003
10151	S12_4473	24	100.00000000000000000	3	3327.6001	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S18_2238	43	100.00000000000000000	2	7110.9102	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S18_2319	49	100.00000000000000000	6	5412.54	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S18_2432	39	69.28000000000000000	9	2701.9199	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S18_3232	21	100.00000000000000000	7	3734.01	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S24_2300	42	100.00000000000000000	8	5098.7998	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S24_2840	30	40.31000000000000000	4	1209.3	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S32_1268	27	100.00000000000000000	10	3068.55	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S32_2509	41	63.85000000000000000	5	2617.8501	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10151	S50_1392	26	100.00000000000000000	1	3220.1001	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311	2003-09-21	3	9	2003
10152	S18_4027	35	100.00000000000000000	1	4524.1001	2003-09-25 00:00:00	2003-10-03 00:00:00	2003-10-01 00:00:00	Shipped	\N	333	2003-09-25	3	9	2003
10152	S24_1444	25	65.31000000000000000	4	1632.75	2003-09-25 00:00:00	2003-10-03 00:00:00	2003-10-01 00:00:00	Shipped	\N	333	2003-09-25	3	9	2003
10152	S24_4048	23	100.00000000000000000	3	2802.0901	2003-09-25 00:00:00	2003-10-03 00:00:00	2003-10-01 00:00:00	Shipped	\N	333	2003-09-25	3	9	2003
10152	S32_3207	33	50.95000000000000000	2	1681.35	2003-09-25 00:00:00	2003-10-03 00:00:00	2003-10-01 00:00:00	Shipped	\N	333	2003-09-25	3	9	2003
10153	S12_1108	20	100.00000000000000000	11	4904	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S12_3148	42	100.00000000000000000	12	5393.6401	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S12_3891	49	100.00000000000000000	10	7036.8901	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S18_3140	31	100.00000000000000000	7	3641.5701	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S18_3259	29	88.74000000000000000	9	2573.46	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S18_4522	22	83.38000000000000000	6	1834.36	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S24_2011	40	100.00000000000000000	5	5456.3999	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S50_1514	31	57.41000000000000000	13	1779.71	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S700_1138	43	64.67000000000000000	1	2780.8101	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S700_1938	31	87.48000000000000000	8	2711.8799	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S700_3505	50	88.15000000000000000	2	4407.5	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S700_3962	20	100.00000000000000000	3	2204.6001	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10153	S72_3212	50	60.06000000000000000	4	3003	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141	2003-09-28	3	9	2003
10154	S24_3151	31	91.17000000000000000	2	2826.27	2003-10-02 00:00:00	2003-10-12 00:00:00	2003-10-08 00:00:00	Shipped	\N	219	2003-10-02	4	10	2003
10154	S700_2610	36	64.33000000000000000	1	2315.8799	2003-10-02 00:00:00	2003-10-12 00:00:00	2003-10-08 00:00:00	Shipped	\N	219	2003-10-02	4	10	2003
10155	S10_4757	32	100.00000000000000000	13	4526.0801	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S18_1662	38	100.00000000000000000	5	6531.4399	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S18_3029	44	79.14000000000000000	11	3482.1599	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S18_3856	29	100.00000000000000000	10	3622.97	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S24_2841	23	72.62000000000000000	6	1670.26	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S24_3420	34	55.89000000000000000	7	1900.26	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S24_3816	37	67.93000000000000000	12	2513.4099	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S24_3949	44	77.11000000000000000	4	3392.8401	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S700_2047	32	91.43000000000000000	9	2925.76	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S700_2466	20	100.00000000000000000	2	2353.3999	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S700_3167	43	86.40000000000000000	1	3715.2	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S700_4002	44	85.87000000000000000	3	3778.28	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10155	S72_1253	34	49.16000000000000000	8	1671.4399	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186	2003-10-06	4	10	2003
10156	S50_1341	20	41.02000000000000000	1	820.40002	2003-10-08 00:00:00	2003-10-17 00:00:00	2003-10-11 00:00:00	Shipped	\N	141	2003-10-08	4	10	2003
10156	S700_1691	48	100.00000000000000000	2	4954.0801	2003-10-08 00:00:00	2003-10-17 00:00:00	2003-10-11 00:00:00	Shipped	\N	141	2003-10-08	4	10	2003
10157	S18_2581	33	78.57000000000000000	3	2592.8101	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10157	S24_1785	40	100.00000000000000000	5	4114	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10157	S24_4278	33	86.22000000000000000	4	2845.26	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10157	S32_1374	34	100.00000000000000000	1	4041.5801	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10157	S32_4289	28	74.98000000000000000	6	2099.4399	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10157	S700_2834	48	100.00000000000000000	2	5979.8398	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473	2003-10-09	4	10	2003
10158	S24_2000	22	67.03000000000000000	1	1474.66	2003-10-10 00:00:00	2003-10-18 00:00:00	2003-10-15 00:00:00	Shipped	\N	121	2003-10-10	4	10	2003
10159	S10_1678	49	100.00000000000000000	14	5205.27	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S10_2016	37	100.00000000000000000	17	5016.8301	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S10_4698	22	100.00000000000000000	16	4132.7002	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S12_1099	41	100.00000000000000000	2	8296.3496	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S12_2823	38	100.00000000000000000	13	6238.8398	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S12_3990	24	73.42000000000000000	3	1762.08	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S18_2625	42	51.48000000000000000	18	2162.1599	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S18_3278	21	81.21000000000000000	5	1705.41	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S18_3482	25	100.00000000000000000	4	3638	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S18_3782	21	64.66000000000000000	8	1357.86	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S18_4721	32	100.00000000000000000	7	4618.8799	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S24_1578	44	100.00000000000000000	15	5355.6802	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S24_2360	27	80.34000000000000000	11	2169.1799	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S24_3371	50	69.80000000000000000	1	3490	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S24_4620	23	67.10000000000000000	6	1543.3	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S32_2206	35	35.40000000000000000	9	1239	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S32_4485	23	100.00000000000000000	12	2347.1499	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10159	S50_4713	31	71.60000000000000000	10	2219.6001	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321	2003-10-10	4	10	2003
10160	S12_3380	46	100.00000000000000000	6	5294.1401	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10160	S12_4675	50	100.00000000000000000	5	5182	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10160	S18_1889	38	88.55000000000000000	4	3364.8999	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10160	S18_3232	20	100.00000000000000000	1	3996.3999	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10160	S24_2972	42	37.00000000000000000	2	1554	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10160	S24_3856	35	100.00000000000000000	3	4767.7002	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347	2003-10-11	4	10	2003
10161	S18_1129	28	100.00000000000000000	12	3764.8799	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S18_1589	43	100.00000000000000000	8	6153.73	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S18_1984	48	100.00000000000000000	11	6145.4399	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S18_2870	23	100.00000000000000000	9	3187.8	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S18_3685	36	100.00000000000000000	10	5544	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S18_4933	25	80.54000000000000000	1	2013.5	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_1046	37	72.76000000000000000	5	2692.1201	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_1628	23	53.33000000000000000	7	1226.59	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_2766	20	100.00000000000000000	3	2144.6001	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_2887	25	100.00000000000000000	2	2759.75	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_3191	20	77.05000000000000000	4	1541	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10161	S24_3432	30	100.00000000000000000	6	3148.2	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227	2003-10-17	4	10	2003
10162	S18_1342	48	91.44000000000000000	2	4389.1201	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_1367	45	51.21000000000000000	1	2304.45	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_1749	29	100.00000000000000000	9	5176.5	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_2248	27	69.62000000000000000	8	1879.74	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_2325	38	100.00000000000000000	6	4299.7002	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_2795	48	100.00000000000000000	3	7209.1201	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S18_4409	39	100.00000000000000000	10	3912.0901	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S24_1937	37	27.22000000000000000	5	1007.14	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S24_2022	43	36.29000000000000000	4	1560.47	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10162	S24_3969	37	38.98000000000000000	7	1442.26	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321	2003-10-18	4	10	2003
10163	S10_1949	21	100.00000000000000000	1	4860.2402	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10163	S18_2949	31	100.00000000000000000	2	3329.0901	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10163	S18_2957	48	69.96000000000000000	4	3358.0801	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10163	S18_3136	40	100.00000000000000000	3	4900.7998	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10163	S18_3320	43	100.00000000000000000	6	4991.4399	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10163	S24_4258	42	91.55000000000000000	5	3845.1001	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424	2003-10-20	4	10	2003
10164	S10_4962	21	100.00000000000000000	2	3536.8201	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S12_1666	49	100.00000000000000000	6	6563.0601	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S18_1097	36	99.17000000000000000	8	3570.1201	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S18_4600	45	100.00000000000000000	3	5012.5498	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S18_4668	25	53.83000000000000000	7	1345.75	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S32_1268	24	100.00000000000000000	1	2634.96	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S32_3522	49	54.94000000000000000	5	2692.0601	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10164	S700_2824	39	81.93000000000000000	4	3195.27	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452	2003-10-21	4	10	2003
10165	S12_1108	44	100.00000000000000000	3	8594.5195	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S12_3148	34	100.00000000000000000	4	4880.02	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S12_3891	27	100.00000000000000000	2	5559.0298	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S12_4473	48	100.00000000000000000	12	6825.6001	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_2238	29	100.00000000000000000	11	5032.9502	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_2319	46	100.00000000000000000	15	5984.1401	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_2432	31	71.10000000000000000	18	2204.1001	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_3232	47	100.00000000000000000	16	8754.6904	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_3259	50	100.00000000000000000	1	5344.5	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S18_4027	28	100.00000000000000000	6	3337.6001	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S24_1444	25	69.36000000000000000	9	1734	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S24_2300	32	100.00000000000000000	17	4661.7598	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S24_2840	27	31.82000000000000000	13	859.14001	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S24_4048	24	99.36000000000000000	8	2384.6399	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S32_2509	48	45.99000000000000000	14	2207.52	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S32_3207	44	53.44000000000000000	7	2351.3601	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S50_1392	48	94.92000000000000000	10	4556.1602	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10165	S50_1514	38	66.78000000000000000	5	2537.6399	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148	2003-10-22	4	10	2003
10166	S18_3140	43	100.00000000000000000	2	6930.7402	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-27 00:00:00	Shipped	\N	462	2003-10-21	4	10	2003
10166	S18_4522	26	73.73000000000000000	1	1916.98	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-27 00:00:00	Shipped	\N	462	2003-10-21	4	10	2003
10166	S700_1938	29	100.00000000000000000	3	3013.97	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-27 00:00:00	Shipped	\N	462	2003-10-21	4	10	2003
10167	S10_4757	44	100.00000000000000000	9	5924.1602	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S18_1662	43	100.00000000000000000	1	5763.7202	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S18_3029	46	73.12000000000000000	7	3363.52	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S18_3856	34	100.00000000000000000	6	3599.5801	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S24_2011	33	100.00000000000000000	16	3812.1599	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S24_2841	21	69.88000000000000000	2	1467.48	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S24_3151	20	79.66000000000000000	11	1593.2	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10423	S24_4258	28	78.89000000000000000	4	2208.9199	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314	2005-05-30	2	5	2005
10424	S10_1949	50	100.00000000000000000	6	12001	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10167	S24_3420	32	63.12000000000000000	3	2019.84	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S24_3816	29	83.86000000000000000	8	2431.9399	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S700_1138	43	75.34000000000000000	12	3239.6201	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S700_2047	29	100.00000000000000000	5	2940.02	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S700_2610	46	70.11000000000000000	10	3225.0601	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S700_3505	24	100.00000000000000000	13	2812.8	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S700_3962	28	100.00000000000000000	14	3003	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S72_1253	40	41.71000000000000000	4	1668.4	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10167	S72_3212	38	48.59000000000000000	15	1846.42	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448	2003-10-23	4	10	2003
10168	S10_1678	36	96.66000000000000000	1	3479.76	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S10_2016	27	100.00000000000000000	4	3660.9299	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S10_4698	20	100.00000000000000000	3	4183	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S18_2581	21	70.96000000000000000	9	1490.16	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S18_2625	46	61.18000000000000000	5	2814.28	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S24_1578	50	100.00000000000000000	2	5747.5	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S24_1785	49	100.00000000000000000	11	6433.7002	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S24_2000	29	75.41000000000000000	6	2186.8899	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S24_3949	27	73.02000000000000000	18	1971.54	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S24_4278	48	78.25000000000000000	10	3756	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S32_1374	28	100.00000000000000000	7	3244.3601	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S32_4289	31	73.61000000000000000	12	2281.9099	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S50_1341	48	51.93000000000000000	13	2492.6399	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S700_1691	28	98.65000000000000000	14	2762.2	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S700_2466	31	100.00000000000000000	16	3431.3899	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S700_2834	36	100.00000000000000000	8	4527.7202	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S700_3167	48	96.00000000000000000	15	4608	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10168	S700_4002	39	82.91000000000000000	17	3233.49	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161	2003-10-28	4	10	2003
10169	S12_1099	30	100.00000000000000000	2	5019.8999	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S12_2823	35	100.00000000000000000	13	4639.25	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S12_3990	36	63.84000000000000000	3	2298.24	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S18_3278	32	70.76000000000000000	5	2264.3201	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S18_3482	36	100.00000000000000000	4	4444.9199	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S18_3782	38	68.39000000000000000	8	2598.8201	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S18_4721	33	100.00000000000000000	7	4910.3999	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S24_2360	38	74.11000000000000000	11	2816.1799	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S24_3371	34	50.21000000000000000	1	1707.14	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S24_4620	24	94.58000000000000000	6	2269.9199	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S32_2206	26	39.83000000000000000	9	1035.58	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S32_4485	34	100.00000000000000000	12	3920.8799	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10169	S50_4713	48	80.55000000000000000	10	3866.3999	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276	2003-11-04	4	11	2003
10170	S12_3380	47	100.00000000000000000	4	5464.6899	2003-11-04 00:00:00	2003-11-12 00:00:00	2003-11-07 00:00:00	Shipped	\N	452	2003-11-04	4	11	2003
10170	S12_4675	41	100.00000000000000000	3	4391.1001	2003-11-04 00:00:00	2003-11-12 00:00:00	2003-11-07 00:00:00	Shipped	\N	452	2003-11-04	4	11	2003
10170	S18_1889	20	63.14000000000000000	2	1262.8	2003-11-04 00:00:00	2003-11-12 00:00:00	2003-11-07 00:00:00	Shipped	\N	452	2003-11-04	4	11	2003
10170	S24_3856	34	100.00000000000000000	1	3819.5601	2003-11-04 00:00:00	2003-11-12 00:00:00	2003-11-07 00:00:00	Shipped	\N	452	2003-11-04	4	11	2003
10171	S18_1129	35	100.00000000000000000	2	4508	2003-11-05 00:00:00	2003-11-13 00:00:00	2003-11-07 00:00:00	Shipped	\N	233	2003-11-05	4	11	2003
10171	S18_1984	35	100.00000000000000000	1	4680.2002	2003-11-05 00:00:00	2003-11-13 00:00:00	2003-11-07 00:00:00	Shipped	\N	233	2003-11-05	4	11	2003
10171	S18_3232	39	100.00000000000000000	3	5481.4502	2003-11-05 00:00:00	2003-11-13 00:00:00	2003-11-07 00:00:00	Shipped	\N	233	2003-11-05	4	11	2003
10171	S24_2972	36	35.49000000000000000	4	1277.64	2003-11-05 00:00:00	2003-11-13 00:00:00	2003-11-07 00:00:00	Shipped	\N	233	2003-11-05	4	11	2003
10172	S18_1589	42	100.00000000000000000	6	4965.2402	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S18_2870	39	100.00000000000000000	7	6023.1602	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S18_3685	48	100.00000000000000000	8	5493.1201	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S24_1046	32	75.69000000000000000	3	2422.0801	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S24_1628	34	42.76000000000000000	5	1453.84	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S24_2766	22	74.51000000000000000	1	1639.22	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S24_3191	24	81.33000000000000000	2	1951.92	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10172	S24_3432	22	98.51000000000000000	4	2167.22	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175	2003-11-05	4	11	2003
10173	S18_1342	43	100.00000000000000000	6	5036.1602	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_1367	48	44.21000000000000000	5	2122.0801	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_1749	24	100.00000000000000000	13	3508.8	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_2248	26	57.51000000000000000	12	1495.26	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_2325	31	100.00000000000000000	10	4492.8301	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_2795	22	100.00000000000000000	7	3452.6799	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_2957	28	53.72000000000000000	2	1504.16	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_3136	31	89.01000000000000000	1	2759.3101	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_3320	29	95.24000000000000000	4	2761.96	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_4409	21	75.46000000000000000	14	1584.66	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S18_4933	39	71.98000000000000000	15	2807.22	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S24_1937	31	31.53000000000000000	9	977.42999	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S24_2022	27	41.22000000000000000	8	1112.9399	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S24_2887	23	100.00000000000000000	16	2728.03	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S24_3969	35	33.23000000000000000	11	1163.05	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10173	S24_4258	22	100.00000000000000000	3	2571.1399	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278	2003-11-05	4	11	2003
10174	S10_1949	34	100.00000000000000000	4	8014.8198	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333	2003-11-06	4	11	2003
10174	S12_1666	43	100.00000000000000000	1	6817.2202	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333	2003-11-06	4	11	2003
10174	S18_1097	48	93.34000000000000000	3	4480.3198	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333	2003-11-06	4	11	2003
10174	S18_2949	46	100.00000000000000000	5	5592.2202	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333	2003-11-06	4	11	2003
10174	S18_4668	49	44.78000000000000000	2	2194.22	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333	2003-11-06	4	11	2003
10175	S10_4962	33	100.00000000000000000	9	5362.8301	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S12_4473	26	100.00000000000000000	1	3543.28	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S18_2319	48	100.00000000000000000	4	5891.04	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S18_2432	41	69.28000000000000000	7	2840.48	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S18_3232	29	100.00000000000000000	5	4419.8901	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S18_4600	47	100.00000000000000000	10	5121.5898	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S24_2300	28	100.00000000000000000	6	2969.96	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S24_2840	37	31.12000000000000000	2	1151.4399	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S32_1268	22	100.00000000000000000	8	2436.72	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S32_2509	50	63.31000000000000000	3	3165.5	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S32_3522	29	74.98000000000000000	12	2174.4199	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10175	S700_2824	42	85.98000000000000000	11	3611.1599	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324	2003-11-06	4	11	2003
10176	S12_1108	33	100.00000000000000000	2	7474.5	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S12_3148	47	100.00000000000000000	3	8378.6904	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S12_3891	50	100.00000000000000000	1	7872.5	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S18_2238	20	100.00000000000000000	10	3667.6001	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S18_4027	36	100.00000000000000000	5	5532.1201	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S24_1444	27	68.78000000000000000	8	1857.0601	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S24_4048	29	100.00000000000000000	7	2915.6599	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S32_3207	22	64.00000000000000000	6	1408	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S50_1392	23	100.00000000000000000	9	3114.8899	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10176	S50_1514	38	64.44000000000000000	4	2448.72	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386	2003-11-06	4	11	2003
10177	S18_3140	23	100.00000000000000000	9	3675.6299	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S18_3259	29	100.00000000000000000	11	3070.52	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S18_4522	35	74.60000000000000000	8	2611	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S24_2011	50	100.00000000000000000	7	6083	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S24_3151	45	72.58000000000000000	2	3266.1001	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S700_1138	24	76.00000000000000000	3	1824	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S700_1938	31	88.34000000000000000	10	2738.54	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S700_2610	32	76.62000000000000000	1	2451.8401	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S700_3505	44	92.16000000000000000	4	4055.04	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S700_3962	24	100.00000000000000000	5	2526.48	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10177	S72_3212	40	50.23000000000000000	6	2009.2	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344	2003-11-07	4	11	2003
10178	S10_4757	24	100.00000000000000000	12	3492.48	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S18_1662	42	100.00000000000000000	4	6490.6802	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S18_3029	41	81.72000000000000000	10	3350.52	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S18_3856	48	100.00000000000000000	9	5386.5601	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S24_2841	34	80.84000000000000000	5	2748.5601	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S24_3420	27	73.64000000000000000	6	1988.28	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S24_3816	21	72.12000000000000000	11	1514.52	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S24_3949	30	72.33000000000000000	3	2169.8999	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S700_2047	34	96.86000000000000000	8	3293.24	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S700_2466	22	87.75000000000000000	1	1930.5	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S700_4002	45	76.25000000000000000	2	3431.25	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10178	S72_1253	45	51.15000000000000000	7	2301.75	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242	2003-11-08	4	11	2003
10179	S18_2581	24	78.57000000000000000	3	1885.6801	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S24_1785	47	100.00000000000000000	5	5862.7798	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S24_4278	27	84.77000000000000000	4	2288.79	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S32_1374	45	100.00000000000000000	1	5394.1499	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S32_4289	24	72.23000000000000000	6	1733.52	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S50_1341	34	42.77000000000000000	7	1454.1801	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10424	S12_1666	49	100.00000000000000000	3	7969.3599	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10179	S700_1691	23	100.00000000000000000	8	2478.9399	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S700_2834	25	100.00000000000000000	2	2640	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10179	S700_3167	39	68.80000000000000000	9	2683.2	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496	2003-11-11	4	11	2003
10180	S10_1678	29	86.13000000000000000	9	2497.77	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S10_2016	42	100.00000000000000000	12	4695.6001	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S10_4698	41	100.00000000000000000	11	8892.9004	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S12_2823	40	100.00000000000000000	8	6747.6001	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S18_2625	25	64.20000000000000000	13	1605	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S18_3782	21	50.36000000000000000	3	1057.5601	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S18_4721	44	100.00000000000000000	2	5565.1201	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S24_1578	48	100.00000000000000000	10	5355.3599	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S24_2000	28	68.55000000000000000	14	1919.4	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S24_2360	35	72.03000000000000000	6	2521.05	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S24_4620	28	71.14000000000000000	1	1991.92	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S32_2206	34	45.46000000000000000	4	1545.64	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S32_4485	22	100.00000000000000000	7	2514.6001	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10180	S50_4713	21	93.56000000000000000	5	1964.76	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171	2003-11-11	4	11	2003
10181	S12_1099	27	100.00000000000000000	14	5411.0698	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S12_3380	28	100.00000000000000000	12	2860.76	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S12_3990	20	81.40000000000000000	15	1628	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S12_4675	36	100.00000000000000000	11	4477.3198	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_1129	44	100.00000000000000000	6	5418.1602	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_1589	42	100.00000000000000000	2	5435.6401	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_1889	22	73.92000000000000000	10	1626.24	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_1984	21	100.00000000000000000	5	3286.0801	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_2870	27	100.00000000000000000	3	3884.76	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_3232	45	100.00000000000000000	7	6324.75	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_3278	30	82.82000000000000000	17	2484.6001	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_3482	22	100.00000000000000000	16	3395.48	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S18_3685	39	100.00000000000000000	4	5785.2598	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S24_1628	34	53.83000000000000000	1	1830.22	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S24_2972	37	42.67000000000000000	8	1578.79	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S24_3371	23	65.52000000000000000	13	1506.96	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10181	S24_3856	25	100.00000000000000000	9	3861.75	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167	2003-11-12	4	11	2003
10182	S18_1342	25	87.33000000000000000	3	2183.25	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_1367	32	54.45000000000000000	2	1742.4	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_1749	44	100.00000000000000000	10	7554.7998	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_2248	38	61.15000000000000000	9	2323.7	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_2325	20	100.00000000000000000	7	2212	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_2795	21	100.00000000000000000	4	3047.73	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_3320	33	86.31000000000000000	1	2848.23	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_4409	36	100.00000000000000000	11	3942.72	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S18_4933	44	69.84000000000000000	12	3072.96	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_1046	47	74.22000000000000000	16	3488.3401	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_1937	39	36.84000000000000000	6	1436.76	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_2022	31	36.74000000000000000	5	1138.9399	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_2766	36	73.60000000000000000	14	2649.6001	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_2887	20	100.00000000000000000	13	2395.8	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_3191	33	94.17000000000000000	15	3107.6101	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_3432	49	100.00000000000000000	17	6244.0698	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10182	S24_3969	23	42.26000000000000000	8	971.97998	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124	2003-11-12	4	11	2003
10183	S10_1949	23	100.00000000000000000	8	5372.5698	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S10_4962	28	100.00000000000000000	1	3433.3601	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S12_1666	41	100.00000000000000000	5	6163.9399	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_1097	21	96.84000000000000000	7	2033.64	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_2949	37	89.15000000000000000	9	3298.55	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_2957	39	68.08000000000000000	11	2655.1201	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_3136	22	100.00000000000000000	10	2488.2	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_4600	21	100.00000000000000000	2	2441.04	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S18_4668	40	49.30000000000000000	6	1972	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S24_4258	47	100.00000000000000000	12	5035.1099	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S32_3522	49	64.64000000000000000	4	3167.3601	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10183	S700_2824	23	86.99000000000000000	3	2000.77	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339	2003-11-13	4	11	2003
10184	S12_4473	37	100.00000000000000000	6	4516.2202	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S18_2238	46	100.00000000000000000	5	7381.1602	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S18_2319	46	100.00000000000000000	9	5984.1401	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S18_2432	44	60.16000000000000000	12	2647.04	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S18_3232	28	100.00000000000000000	10	4409.7202	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S24_1444	31	60.11000000000000000	3	1863.41	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S24_2300	24	100.00000000000000000	11	3496.3201	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S24_2840	42	31.82000000000000000	7	1336.4399	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S24_4048	49	100.00000000000000000	2	5795.7202	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S32_1268	46	100.00000000000000000	13	4607.3599	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S32_2509	33	62.77000000000000000	8	2071.4099	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S32_3207	48	50.95000000000000000	1	2445.6001	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10184	S50_1392	45	100.00000000000000000	4	4948.2002	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484	2003-11-14	4	11	2003
10185	S12_1108	21	100.00000000000000000	13	3883.74	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S12_3148	33	100.00000000000000000	14	4038.21	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S12_3891	43	100.00000000000000000	12	7886.2002	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S18_3140	28	100.00000000000000000	9	3442.04	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S18_3259	49	80.67000000000000000	11	3952.8301	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S18_4027	39	100.00000000000000000	16	5096.9102	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S18_4522	47	77.24000000000000000	8	3630.28	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S24_2011	30	100.00000000000000000	7	3170.7	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S24_3151	33	74.35000000000000000	2	2453.55	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S50_1514	20	48.62000000000000000	15	972.40002	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S700_1138	21	54.00000000000000000	3	1134	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S700_1938	30	94.40000000000000000	10	2832	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S700_2610	39	57.82000000000000000	1	2254.98	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S700_3505	37	100.00000000000000000	4	3891.6599	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S700_3962	22	79.45000000000000000	5	1747.9	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10185	S72_3212	28	64.43000000000000000	6	1804.04	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320	2003-11-14	4	11	2003
10186	S10_4757	26	100.00000000000000000	9	3854.24	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S18_1662	32	100.00000000000000000	1	6004.7998	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S18_3029	32	89.46000000000000000	7	2862.72	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S18_3856	46	100.00000000000000000	6	4918.7798	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S24_2841	22	69.20000000000000000	2	1522.4	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S24_3420	21	69.04000000000000000	3	1449.84	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S24_3816	36	85.54000000000000000	8	3079.4399	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S700_2047	24	99.57000000000000000	5	2389.6799	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10186	S72_1253	28	52.14000000000000000	4	1459.92	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489	2003-11-14	4	11	2003
10187	S18_2581	45	93.77000000000000000	1	4219.6499	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S24_1785	46	95.20000000000000000	3	4379.2002	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S24_3949	43	58.00000000000000000	10	2494	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S24_4278	33	59.41000000000000000	2	1960.53	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S32_4289	31	60.54000000000000000	4	1876.74	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S50_1341	41	38.84000000000000000	5	1592.4399	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S700_1691	34	92.25000000000000000	6	3136.5	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S700_2466	44	100.00000000000000000	8	4650.7998	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S700_3167	34	88.00000000000000000	7	2992	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10187	S700_4002	44	71.81000000000000000	9	3159.6399	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211	2003-11-15	4	11	2003
10188	S10_1678	48	100.00000000000000000	1	5512.3198	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S10_2016	38	96.34000000000000000	4	3660.9199	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S10_4698	45	100.00000000000000000	3	8714.7002	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S18_2625	32	65.42000000000000000	5	2093.4399	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S24_1578	25	100.00000000000000000	2	2535.75	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S24_2000	40	91.40000000000000000	6	3656	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S32_1374	44	98.89000000000000000	7	4351.1602	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10188	S700_2834	29	100.00000000000000000	8	3957.05	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167	2003-11-18	4	11	2003
10194	S12_1666	38	100.00000000000000000	8	4933.9199	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10189	S12_2823	28	100.00000000000000000	1	4512.48	2003-11-18 00:00:00	2003-11-25 00:00:00	2003-11-24 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	205	2003-11-18	4	11	2003
10190	S24_2360	42	76.19000000000000000	3	3199.98	2003-11-19 00:00:00	2003-11-29 00:00:00	2003-11-20 00:00:00	Shipped	\N	141	2003-11-19	4	11	2003
10190	S32_2206	46	32.99000000000000000	1	1517.54	2003-11-19 00:00:00	2003-11-29 00:00:00	2003-11-20 00:00:00	Shipped	\N	141	2003-11-19	4	11	2003
10190	S32_4485	42	85.72000000000000000	4	3600.24	2003-11-19 00:00:00	2003-11-29 00:00:00	2003-11-20 00:00:00	Shipped	\N	141	2003-11-19	4	11	2003
10190	S50_4713	40	66.72000000000000000	2	2668.8	2003-11-19 00:00:00	2003-11-29 00:00:00	2003-11-20 00:00:00	Shipped	\N	141	2003-11-19	4	11	2003
10191	S12_1099	21	100.00000000000000000	3	3840.8999	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S12_3380	40	100.00000000000000000	1	5590	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S12_3990	30	64.64000000000000000	4	1939.2	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S18_3278	36	94.88000000000000000	6	3415.6799	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S18_3482	23	100.00000000000000000	5	3414.5801	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S18_3782	43	72.74000000000000000	9	3127.8201	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S18_4721	32	100.00000000000000000	8	4237.7598	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S24_3371	48	60.01000000000000000	2	2880.48	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10191	S24_4620	44	66.29000000000000000	7	2916.76	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259	2003-11-20	4	11	2003
10192	S12_4675	27	100.00000000000000000	16	3544.5601	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_1129	22	100.00000000000000000	11	3300.6599	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_1589	29	100.00000000000000000	7	4258.3599	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_1889	45	90.86000000000000000	15	4088.7	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_1984	47	100.00000000000000000	10	7421.2998	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_2870	38	100.00000000000000000	8	4965.8398	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_3232	26	100.00000000000000000	12	3918.46	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S18_3685	45	100.00000000000000000	9	5340.6001	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_1046	37	69.82000000000000000	4	2583.3401	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_1628	47	53.83000000000000000	6	2530.01	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_2766	46	83.60000000000000000	2	3845.6001	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_2887	23	100.00000000000000000	1	3052.3301	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_2972	30	30.59000000000000000	13	917.70001	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_3191	32	72.77000000000000000	3	2328.6399	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_3432	46	100.00000000000000000	5	5566	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10192	S24_3856	45	100.00000000000000000	14	6319.3501	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363	2003-11-20	4	11	2003
10193	S18_1342	28	100.00000000000000000	7	3106.8799	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_1367	46	53.37000000000000000	6	2455.02	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_1749	21	100.00000000000000000	14	3141.6001	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_2248	42	59.33000000000000000	13	2491.8601	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_2325	44	100.00000000000000000	11	4642.8799	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_2795	22	100.00000000000000000	8	3675.3201	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_2949	28	93.21000000000000000	1	2609.8799	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_2957	24	51.84000000000000000	3	1244.16	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_3136	23	100.00000000000000000	2	2769.8899	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_3320	32	79.37000000000000000	5	2539.8401	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_4409	24	97.55000000000000000	15	2341.2	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S18_4933	25	76.26000000000000000	16	1906.5	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S24_1937	26	29.21000000000000000	10	759.46002	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S24_2022	20	50.62000000000000000	9	1012.4	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S24_3969	22	41.03000000000000000	12	902.65997	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10193	S24_4258	20	100.00000000000000000	4	2279	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471	2003-11-21	4	11	2003
10194	S10_1949	42	100.00000000000000000	11	7290.3599	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S10_4962	26	100.00000000000000000	4	4263.7402	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S18_1097	21	93.34000000000000000	10	1960.14	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S18_2432	45	70.49000000000000000	2	3172.05	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S18_4600	32	100.00000000000000000	5	4262.0801	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S18_4668	41	44.78000000000000000	9	1835.98	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S24_2300	49	100.00000000000000000	1	5760.9302	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S32_1268	37	97.27000000000000000	3	3598.99	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S32_3522	39	54.94000000000000000	7	2142.6599	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10194	S700_2824	26	89.01000000000000000	6	2314.26	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146	2003-11-25	4	11	2003
10195	S12_4473	49	100.00000000000000000	6	6445.46	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S18_2238	27	100.00000000000000000	5	5128.1099	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S18_2319	35	100.00000000000000000	9	3608.1499	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S18_3232	50	100.00000000000000000	10	7620.5	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S24_1444	44	66.47000000000000000	3	2924.6799	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S24_2840	32	28.29000000000000000	7	905.28003	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S24_4048	34	100.00000000000000000	2	3699.8799	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S32_2509	32	43.29000000000000000	8	1385.28	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S32_3207	33	54.68000000000000000	1	1804.4399	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10195	S50_1392	49	100.00000000000000000	4	5161.1699	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319	2003-11-25	4	11	2003
10196	S12_1108	47	100.00000000000000000	5	8887.7002	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S12_3148	24	100.00000000000000000	6	3807.1201	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S12_3891	38	100.00000000000000000	4	7232.1602	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S18_3140	49	100.00000000000000000	1	6893.8101	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S18_3259	35	100.00000000000000000	3	3564.75	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S18_4027	27	100.00000000000000000	8	4537.0801	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S50_1514	46	62.09000000000000000	7	2856.1399	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10196	S700_1938	50	94.40000000000000000	2	4720	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455	2003-11-26	4	11	2003
10197	S10_4757	45	100.00000000000000000	6	5324.3999	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S18_3029	46	87.74000000000000000	4	4036.04	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S18_3856	22	100.00000000000000000	3	2538.8	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S18_4522	50	100.00000000000000000	14	5090.5	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S24_2011	41	100.00000000000000000	13	4534.6001	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S24_3151	47	83.20000000000000000	8	3910.3999	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S24_3816	22	86.38000000000000000	5	1900.36	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S700_1138	23	64.67000000000000000	9	1487.41	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S700_2047	24	90.52000000000000000	2	2172.48	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S700_2610	50	78.79000000000000000	7	3939.5	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S700_3505	27	92.16000000000000000	10	2488.3201	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S700_3962	35	93.35000000000000000	11	3267.25	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S72_1253	29	41.71000000000000000	1	1209.59	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10197	S72_3212	42	50.23000000000000000	12	2109.6599	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216	2003-11-26	4	11	2003
10198	S18_1662	42	100.00000000000000000	4	7483.98	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10198	S24_2841	48	67.82000000000000000	5	3255.3601	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10198	S24_3420	27	71.67000000000000000	6	1935.09	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10198	S24_3949	43	66.19000000000000000	3	2846.1699	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10198	S700_2466	42	100.00000000000000000	1	4774.5601	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10198	S700_4002	40	63.67000000000000000	2	2546.8	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385	2003-11-27	4	11	2003
10199	S50_1341	29	38.40000000000000000	1	1113.6	2003-12-01 00:00:00	2003-12-10 00:00:00	2003-12-06 00:00:00	Shipped	\N	475	2003-12-01	4	12	2003
10199	S700_1691	48	83.12000000000000000	2	3989.76	2003-12-01 00:00:00	2003-12-10 00:00:00	2003-12-06 00:00:00	Shipped	\N	475	2003-12-01	4	12	2003
10199	S700_3167	38	82.40000000000000000	3	3131.2	2003-12-01 00:00:00	2003-12-10 00:00:00	2003-12-06 00:00:00	Shipped	\N	475	2003-12-01	4	12	2003
10200	S18_2581	28	92.93000000000000000	3	2602.04	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10200	S24_1785	33	98.48000000000000000	5	3249.8401	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10200	S24_4278	39	72.45000000000000000	4	2825.55	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10200	S32_1374	35	100.00000000000000000	1	3845.8	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10200	S32_4289	27	67.41000000000000000	6	1820.0699	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10200	S700_2834	39	100.00000000000000000	2	3979.5601	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211	2003-12-01	4	12	2003
10201	S10_1678	22	98.57000000000000000	2	2168.54	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S10_2016	24	100.00000000000000000	5	3025.9199	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S10_4698	49	100.00000000000000000	4	8065.8901	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S12_2823	25	100.00000000000000000	1	4029	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S18_2625	30	64.81000000000000000	6	1944.3	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S24_1578	39	100.00000000000000000	3	4351.23	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10201	S24_2000	25	73.88000000000000000	7	1847	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129	2003-12-01	4	12	2003
10202	S18_3782	30	54.71000000000000000	3	1641.3	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S18_4721	43	100.00000000000000000	2	5886.7002	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S24_2360	50	69.26000000000000000	6	3463	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S24_4620	50	87.31000000000000000	1	4365.5	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S32_2206	27	44.25000000000000000	4	1194.75	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S32_4485	31	100.00000000000000000	7	3163.55	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10202	S50_4713	40	89.50000000000000000	5	3580	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357	2003-12-02	4	12	2003
10203	S12_1099	20	100.00000000000000000	8	3930.3999	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S12_3380	20	100.00000000000000000	6	2254.8	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S12_3990	44	82.99000000000000000	9	3651.5601	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S12_4675	47	100.00000000000000000	5	5195.8501	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S18_1889	45	85.47000000000000000	4	3846.1499	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S18_3232	48	100.00000000000000000	1	8291.04	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S18_3278	33	86.04000000000000000	11	2839.3201	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S18_3482	32	100.00000000000000000	10	5127.04	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S24_2972	21	37.00000000000000000	2	777	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S24_3371	34	64.90000000000000000	7	2206.6001	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10203	S24_3856	47	100.00000000000000000	3	6996.4199	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141	2003-12-02	4	12	2003
10204	S18_1129	42	100.00000000000000000	17	6182.3999	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_1589	40	100.00000000000000000	13	4032	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_1749	33	100.00000000000000000	4	5890.5	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_1984	38	100.00000000000000000	16	6432.6401	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_2248	23	71.44000000000000000	3	1643.12	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_2325	26	100.00000000000000000	1	3206.3201	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_2870	27	100.00000000000000000	14	4169.8799	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_3685	35	100.00000000000000000	15	5735.7998	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_4409	29	85.59000000000000000	5	2482.1101	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S18_4933	45	76.26000000000000000	6	3431.7	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_1046	20	62.47000000000000000	10	1249.4	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_1628	45	49.81000000000000000	12	2241.45	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_2766	47	96.32000000000000000	8	4527.04	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_2887	42	100.00000000000000000	7	4242	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_3191	40	79.62000000000000000	9	3184.8	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_3432	48	91.02000000000000000	11	4368.96	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10204	S24_3969	39	33.23000000000000000	2	1295.97	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151	2003-12-02	4	12	2003
10205	S18_1342	36	100.00000000000000000	2	3735.72	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141	2003-12-03	4	12	2003
10205	S18_1367	48	63.61000000000000000	1	3053.28	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141	2003-12-03	4	12	2003
10205	S18_2795	40	100.00000000000000000	3	7492.3999	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141	2003-12-03	4	12	2003
10205	S24_1937	32	37.17000000000000000	5	1189.4399	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141	2003-12-03	4	12	2003
10205	S24_2022	24	38.08000000000000000	4	913.91998	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141	2003-12-03	4	12	2003
10206	S10_1949	47	100.00000000000000000	6	9064.8896	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S12_1666	28	100.00000000000000000	3	4056.3601	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_1097	34	100.00000000000000000	5	3966.78	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_2949	37	90.17000000000000000	7	3336.29	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_2957	28	67.46000000000000000	9	1888.88	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_3136	30	100.00000000000000000	8	3581.3999	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_3320	28	87.30000000000000000	11	2444.3999	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S18_4668	21	53.33000000000000000	4	1119.9301	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S24_4258	33	97.39000000000000000	10	3213.8701	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S32_3522	36	58.82000000000000000	2	2117.52	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10206	S700_2824	33	100.00000000000000000	1	3871.8899	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202	2003-12-05	4	12	2003
10207	S10_4962	31	100.00000000000000000	15	4076.1899	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S12_4473	34	99.54000000000000000	7	3384.3601	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_2238	44	100.00000000000000000	6	7060.2402	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_2319	43	100.00000000000000000	10	5752.54	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_2432	37	69.89000000000000000	13	2585.9299	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_3232	25	100.00000000000000000	11	3937.25	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_4027	40	100.00000000000000000	1	6146.7998	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S18_4600	47	100.00000000000000000	16	6658.02	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S24_1444	49	46.82000000000000000	4	2294.1799	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S24_2300	46	100.00000000000000000	12	6819.04	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S24_2840	42	29.70000000000000000	8	1247.4	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S24_4048	28	100.00000000000000000	3	2980.6001	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S32_1268	49	80.90000000000000000	14	3964.1001	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S32_2509	27	60.06000000000000000	9	1621.62	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S32_3207	45	56.55000000000000000	2	2544.75	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10207	S50_1392	28	94.92000000000000000	5	2657.76	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495	2003-12-09	4	12	2003
10208	S12_1108	46	100.00000000000000000	13	8602.9199	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S12_3148	26	100.00000000000000000	14	3142.3601	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S12_3891	20	100.00000000000000000	12	3114.3999	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S18_3140	24	100.00000000000000000	9	2622.48	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S18_3259	48	100.00000000000000000	11	5614.5601	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S18_4522	45	87.77000000000000000	8	3949.6499	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S24_2011	35	100.00000000000000000	7	4301.1499	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S24_3151	20	89.40000000000000000	2	1788	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S50_1514	30	65.61000000000000000	15	1968.3	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S700_1138	38	74.67000000000000000	3	2837.46	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S700_1938	40	80.55000000000000000	10	3222	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S700_2610	46	74.45000000000000000	1	3424.7	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S700_3505	37	100.00000000000000000	4	4447.3999	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S700_3962	33	85.41000000000000000	5	2818.53	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10208	S72_3212	42	63.88000000000000000	6	2682.96	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146	2004-01-02	1	1	2004
10209	S10_4757	39	100.00000000000000000	8	5197.9199	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S18_3029	28	100.00000000000000000	6	2817.9199	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S18_3856	20	100.00000000000000000	5	2498.6001	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S24_2841	43	82.21000000000000000	1	3535.03	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S24_3420	36	77.59000000000000000	2	2793.24	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S24_3816	22	89.73000000000000000	7	1974.0601	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S700_2047	33	88.71000000000000000	4	2927.4299	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10209	S72_1253	48	44.69000000000000000	3	2145.1201	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347	2004-01-09	1	1	2004
10210	S10_2016	23	100.00000000000000000	2	3009.0901	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S10_4698	34	100.00000000000000000	1	6123.3999	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S18_1662	31	100.00000000000000000	17	5719.5	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S18_2581	50	76.88000000000000000	7	3844	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S18_2625	40	49.67000000000000000	3	1986.8	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S24_1785	27	98.48000000000000000	9	2658.96	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S24_2000	30	61.70000000000000000	4	1851	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S24_3949	29	69.60000000000000000	16	2018.4	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S24_4278	40	71.00000000000000000	8	2840	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S32_1374	46	79.91000000000000000	5	3675.8601	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S32_4289	39	59.16000000000000000	10	2307.24	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S50_1341	43	41.02000000000000000	11	1763.86	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S700_1691	21	78.55000000000000000	12	1649.55	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S700_2466	26	99.72000000000000000	14	2592.72	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S700_2834	25	100.00000000000000000	6	2818	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S700_3167	31	86.40000000000000000	13	2678.3999	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10210	S700_4002	42	70.33000000000000000	15	2953.8601	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177	2004-01-12	1	1	2004
10211	S10_1678	41	100.00000000000000000	14	4708.4399	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S12_1099	41	100.00000000000000000	2	7498.8999	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S12_2823	36	100.00000000000000000	13	4771.7998	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S12_3990	28	92.57000000000000000	3	2591.96	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S18_3278	35	78.00000000000000000	5	2730	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S18_3482	28	100.00000000000000000	4	3745.28	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S18_3782	46	54.09000000000000000	8	2488.1399	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S18_4721	41	100.00000000000000000	7	5673.5801	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S24_1578	25	90.16000000000000000	15	2254	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S24_2360	21	63.72000000000000000	11	1338.12	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S24_3371	48	48.98000000000000000	1	2351.04	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S24_4620	22	92.16000000000000000	6	2027.52	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S32_2206	41	42.24000000000000000	9	1731.84	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S32_4485	37	100.00000000000000000	12	4040.03	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10211	S50_4713	40	80.55000000000000000	10	3222	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406	2004-01-15	1	1	2004
10212	S12_3380	39	100.00000000000000000	16	4946.7598	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S12_4675	33	100.00000000000000000	15	4180.4399	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_1129	29	100.00000000000000000	10	4186.73	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_1589	38	100.00000000000000000	6	4492.3599	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_1889	20	66.99000000000000000	14	1339.8	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_1984	41	100.00000000000000000	9	4840.8701	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_2870	40	100.00000000000000000	7	4910.3999	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_3232	40	100.00000000000000000	11	5554.3999	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S18_3685	45	100.00000000000000000	8	6357.6001	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_1046	41	82.31000000000000000	3	3374.71	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_1628	45	53.33000000000000000	5	2399.8501	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_2766	45	88.14000000000000000	1	3966.3	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_2972	34	43.42000000000000000	12	1476.28	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_3191	27	79.62000000000000000	2	2149.74	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_3432	46	87.81000000000000000	4	4039.26	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10212	S24_3856	49	100.00000000000000000	13	6949.6699	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141	2004-01-16	1	1	2004
10213	S18_4409	38	94.79000000000000000	1	3602.02	2004-01-22 00:00:00	2004-01-28 00:00:00	2004-01-27 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	489	2004-01-22	1	1	2004
10213	S18_4933	25	83.39000000000000000	2	2084.75	2004-01-22 00:00:00	2004-01-28 00:00:00	2004-01-27 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	489	2004-01-22	1	1	2004
10213	S24_2887	27	100.00000000000000000	3	2790.45	2004-01-22 00:00:00	2004-01-28 00:00:00	2004-01-27 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	489	2004-01-22	1	1	2004
10214	S18_1749	30	100.00000000000000000	7	5967	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S18_2248	21	62.96000000000000000	6	1322.16	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S18_2325	27	100.00000000000000000	4	3604.23	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S18_2795	50	100.00000000000000000	1	9534.5	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S24_1937	20	34.19000000000000000	3	683.79999	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S24_2022	49	47.94000000000000000	2	2349.0601	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10214	S24_3969	44	34.88000000000000000	5	1534.72	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458	2004-01-26	1	1	2004
10215	S10_1949	35	100.00000000000000000	3	6075.2998	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_1097	46	100.00000000000000000	2	5152	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_1342	27	89.38000000000000000	10	2413.26	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_1367	33	43.13000000000000000	9	1423.29	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_2949	49	100.00000000000000000	4	5510.0498	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_2957	31	58.71000000000000000	6	1820.01	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_3136	49	100.00000000000000000	5	5285.1401	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_3320	41	100.00000000000000000	8	4555.9199	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S18_4668	46	45.28000000000000000	1	2082.8799	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10215	S24_4258	39	90.57000000000000000	7	3532.23	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475	2004-01-29	1	1	2004
10216	S12_1666	43	100.00000000000000000	1	5759.4199	2004-02-02 00:00:00	2004-02-10 00:00:00	2004-02-04 00:00:00	Shipped	\N	256	2004-02-02	1	2	2004
10217	S10_4962	48	100.00000000000000000	4	7020.48	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S18_2432	35	61.38000000000000000	2	2148.3	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S18_4600	38	100.00000000000000000	5	4509.0801	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S24_2300	28	100.00000000000000000	1	3148.8799	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S32_1268	21	100.00000000000000000	3	2244.8999	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S32_3522	39	62.05000000000000000	7	2419.95	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10217	S700_2824	31	88.00000000000000000	6	2728	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166	2004-02-04	1	2	2004
10218	S18_2319	22	100.00000000000000000	1	2673	2004-02-09 00:00:00	2004-02-16 00:00:00	2004-02-11 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	473	2004-02-09	1	2	2004
10218	S18_3232	34	100.00000000000000000	2	4605.98	2004-02-09 00:00:00	2004-02-16 00:00:00	2004-02-11 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	473	2004-02-09	1	2	2004
10219	S12_4473	48	100.00000000000000000	2	4891.6802	2004-02-10 00:00:00	2004-02-17 00:00:00	2004-02-12 00:00:00	Shipped	\N	487	2004-02-10	1	2	2004
10219	S18_2238	43	100.00000000000000000	1	8448.6396	2004-02-10 00:00:00	2004-02-17 00:00:00	2004-02-12 00:00:00	Shipped	\N	487	2004-02-10	1	2	2004
10219	S24_2840	21	40.31000000000000000	3	846.51001	2004-02-10 00:00:00	2004-02-17 00:00:00	2004-02-12 00:00:00	Shipped	\N	487	2004-02-10	1	2	2004
10219	S32_2509	35	55.19000000000000000	4	1931.65	2004-02-10 00:00:00	2004-02-17 00:00:00	2004-02-12 00:00:00	Shipped	\N	487	2004-02-10	1	2	2004
10220	S12_1108	32	100.00000000000000000	2	7181.4399	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S12_3148	30	100.00000000000000000	3	4713.6001	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S12_3891	27	100.00000000000000000	1	5045.2202	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S18_4027	50	100.00000000000000000	5	8258	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S24_1444	26	56.07000000000000000	8	1457.8199	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S24_4048	37	100.00000000000000000	7	5032.7402	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S32_3207	20	52.82000000000000000	6	1056.4	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S50_1392	37	100.00000000000000000	9	3983.05	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10220	S50_1514	30	68.54000000000000000	4	2056.2	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189	2004-02-12	1	2	2004
10221	S18_3140	33	100.00000000000000000	3	4417.3799	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314	2004-02-18	1	2	2004
10221	S18_3259	23	80.67000000000000000	5	1855.41	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314	2004-02-18	1	2	2004
10221	S18_4522	39	89.53000000000000000	2	3491.6699	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314	2004-02-18	1	2	2004
10221	S24_2011	49	100.00000000000000000	1	6804.6299	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314	2004-02-18	1	2	2004
10221	S700_1938	23	97.00000000000000000	4	2231	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314	2004-02-18	1	2	2004
10222	S10_4757	49	100.00000000000000000	12	5997.6001	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S18_1662	49	100.00000000000000000	4	6954.0801	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S18_3029	49	94.62000000000000000	10	4636.3799	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S18_3856	45	85.75000000000000000	9	3858.75	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S24_2841	32	81.53000000000000000	5	2608.96	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S24_3151	47	70.81000000000000000	14	3328.0701	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S24_3420	43	70.35000000000000000	6	3025.05	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S24_3816	46	80.51000000000000000	11	3703.46	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S24_3949	48	56.64000000000000000	3	2718.72	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_1138	31	62.67000000000000000	15	1942.77	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_2047	26	100.00000000000000000	8	2659.54	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_2466	37	87.75000000000000000	1	3246.75	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_2610	36	80.95000000000000000	13	2914.2	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_3505	38	100.00000000000000000	16	4187.2202	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_3962	31	95.34000000000000000	17	2955.54	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S700_4002	43	74.03000000000000000	2	3183.29	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S72_1253	31	45.69000000000000000	7	1416.39	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10222	S72_3212	36	63.34000000000000000	18	2280.24	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239	2004-02-19	1	2	2004
10223	S10_1678	37	100.00000000000000000	1	3965.6599	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S10_2016	47	100.00000000000000000	4	5422.3901	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S10_4698	49	100.00000000000000000	3	9774.0303	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S18_2581	47	100.00000000000000000	9	4724.9102	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S18_2625	28	60.57000000000000000	5	1695.96	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S24_1578	32	91.29000000000000000	2	2921.28	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S24_1785	34	100.00000000000000000	11	3608.76	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S24_2000	38	69.31000000000000000	6	2633.78	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S24_4278	23	74.62000000000000000	10	1716.26	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S32_1374	21	100.00000000000000000	7	2475.27	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S32_4289	20	66.04000000000000000	12	1320.8	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S50_1341	41	46.26000000000000000	13	1896.66	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S700_1691	25	100.00000000000000000	14	2534.75	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S700_2834	29	100.00000000000000000	8	3199.8601	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10223	S700_3167	26	67.20000000000000000	15	1747.2	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114	2004-02-20	1	2	2004
10224	S12_2823	43	100.00000000000000000	6	6087.9399	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10224	S18_3782	38	58.44000000000000000	1	2220.72	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10224	S24_2360	37	80.34000000000000000	4	2972.5801	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10224	S32_2206	43	39.43000000000000000	2	1695.49	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10224	S32_4485	30	100.00000000000000000	5	3336.8999	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10224	S50_4713	50	77.29000000000000000	3	3864.5	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171	2004-02-21	1	2	2004
10225	S12_1099	27	100.00000000000000000	9	4517.9102	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S12_3380	25	99.82000000000000000	7	2495.5	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S12_3990	37	77.41000000000000000	10	2864.1699	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S12_4675	21	100.00000000000000000	6	2684.4299	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_1129	32	100.00000000000000000	1	4529.2798	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_1889	47	64.68000000000000000	5	3039.96	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_3232	43	100.00000000000000000	2	6407.8599	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_3278	37	95.69000000000000000	12	3540.53	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_3482	27	100.00000000000000000	11	4564.0801	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S18_4721	35	100.00000000000000000	14	5260.1499	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S24_2972	42	36.63000000000000000	3	1538.46	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S24_3371	24	50.21000000000000000	8	1205.04	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S24_3856	40	100.00000000000000000	4	4550	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10225	S24_4620	46	70.33000000000000000	13	3235.1799	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298	2004-02-22	1	2	2004
10226	S18_1589	38	100.00000000000000000	4	4161.3799	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S18_1984	24	100.00000000000000000	7	3892.0801	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S18_2870	24	100.00000000000000000	5	3231.3601	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S18_3685	46	100.00000000000000000	6	7343.8999	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S24_1046	21	60.26000000000000000	1	1265.46	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S24_1628	36	43.27000000000000000	3	1557.72	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10226	S24_3432	48	92.09000000000000000	2	4420.3198	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239	2004-02-26	1	2	2004
10227	S18_1342	25	100.00000000000000000	3	2953.75	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_1367	31	48.52000000000000000	2	1504.12	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_1749	26	100.00000000000000000	10	3712.8	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_2248	28	50.85000000000000000	9	1423.8	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_2325	46	100.00000000000000000	7	7017.7598	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_2795	29	100.00000000000000000	4	5579.02	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_3320	33	100.00000000000000000	1	3666.96	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_4409	34	100.00000000000000000	11	3566.9399	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S18_4933	37	57.73000000000000000	12	2136.01	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_1937	42	29.21000000000000000	6	1226.8199	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_2022	24	48.38000000000000000	5	1161.12	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_2766	47	88.14000000000000000	14	4142.5801	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_2887	33	100.00000000000000000	13	4340.4902	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_3191	40	79.62000000000000000	15	3184.8	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10227	S24_3969	27	43.90000000000000000	8	1185.3	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146	2004-03-02	1	3	2004
10228	S10_1949	29	100.00000000000000000	2	6463.23	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10228	S18_1097	32	100.00000000000000000	1	3360	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10228	S18_2949	24	100.00000000000000000	3	2504.3999	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10228	S18_2957	45	63.71000000000000000	5	2866.95	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10228	S18_3136	31	100.00000000000000000	4	3181.53	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10228	S24_4258	33	100.00000000000000000	6	3406.5901	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173	2004-03-10	1	3	2004
10229	S10_4962	50	100.00000000000000000	9	6426.5	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S12_1666	25	100.00000000000000000	13	3451	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S12_4473	36	100.00000000000000000	1	4521.96	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S18_2319	26	100.00000000000000000	4	3765.3201	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S18_2432	28	59.55000000000000000	7	1667.4	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S18_3232	22	100.00000000000000000	5	4172.52	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S18_4600	41	100.00000000000000000	10	4716.23	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S18_4668	39	40.25000000000000000	14	1569.75	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S24_2300	48	100.00000000000000000	6	5704.3198	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S24_2840	33	32.88000000000000000	2	1085.04	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S32_1268	25	100.00000000000000000	8	2793	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S32_2509	23	54.11000000000000000	3	1244.53	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S32_3522	30	73.04000000000000000	12	2191.2	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10229	S700_2824	50	100.00000000000000000	11	5614	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124	2004-03-11	1	3	2004
10230	S12_3148	43	100.00000000000000000	1	7016.3101	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S18_2238	49	100.00000000000000000	8	7300.5098	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S18_4027	42	100.00000000000000000	3	7238.2798	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S24_1444	36	54.33000000000000000	6	1955.88	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S24_4048	45	100.00000000000000000	5	4737.1499	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S32_3207	46	60.90000000000000000	4	2801.3999	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10424	S18_1097	54	100.00000000000000000	5	7182	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10230	S50_1392	34	100.00000000000000000	7	3974.9399	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10230	S50_1514	43	52.14000000000000000	2	2242.02	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128	2004-03-15	1	3	2004
10231	S12_1108	42	100.00000000000000000	2	8378.5801	2004-03-19 00:00:00	2004-03-26 00:00:00	2004-03-25 00:00:00	Shipped	\N	344	2004-03-19	1	3	2004
10231	S12_3891	49	100.00000000000000000	1	6952.1201	2004-03-19 00:00:00	2004-03-26 00:00:00	2004-03-25 00:00:00	Shipped	\N	344	2004-03-19	1	3	2004
10232	S18_3140	22	100.00000000000000000	6	3606.02	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S18_3259	48	95.80000000000000000	8	4598.3999	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S18_4522	23	89.53000000000000000	5	2059.1899	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S24_2011	46	100.00000000000000000	4	5652.9399	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S700_1938	26	88.34000000000000000	7	2296.8401	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S700_3505	48	96.16000000000000000	1	4615.6802	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S700_3962	35	82.43000000000000000	2	2885.05	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10232	S72_3212	24	49.69000000000000000	3	1192.5601	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240	2004-03-20	1	3	2004
10233	S24_3151	40	94.71000000000000000	2	3788.3999	2004-03-29 00:00:00	2004-04-04 00:00:00	2004-04-02 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	328	2004-03-29	1	3	2004
10233	S700_1138	36	70.67000000000000000	3	2544.1201	2004-03-29 00:00:00	2004-04-04 00:00:00	2004-04-02 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	328	2004-03-29	1	3	2004
10233	S700_2610	29	82.40000000000000000	1	2389.6001	2004-03-29 00:00:00	2004-04-04 00:00:00	2004-04-02 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	328	2004-03-29	1	3	2004
10234	S10_4757	48	100.00000000000000000	9	7246.0801	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S18_1662	50	100.00000000000000000	1	9461.5	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S18_3029	48	74.84000000000000000	7	3592.3201	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S18_3856	39	100.00000000000000000	6	4913.6099	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S24_2841	44	61.66000000000000000	2	2713.04	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S24_3420	25	57.20000000000000000	3	1430	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S24_3816	31	72.96000000000000000	8	2261.76	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S700_2047	29	87.80000000000000000	5	2546.2	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10234	S72_1253	40	56.12000000000000000	4	2244.8	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412	2004-03-30	1	3	2004
10235	S18_2581	24	76.03000000000000000	3	1824.72	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S24_1785	23	96.29000000000000000	5	2214.6699	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S24_3949	33	60.05000000000000000	12	1981.65	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S24_4278	40	81.14000000000000000	4	3245.6001	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S32_1374	41	100.00000000000000000	1	4177.4902	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S32_4289	34	77.73000000000000000	6	2642.8201	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S50_1341	41	35.35000000000000000	7	1449.35	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S700_1691	25	100.00000000000000000	8	2580.25	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S700_2466	38	88.75000000000000000	10	3372.5	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S700_2834	25	96.11000000000000000	2	2402.75	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S700_3167	32	92.00000000000000000	9	2944	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10235	S700_4002	34	72.55000000000000000	11	2466.7	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260	2004-04-02	2	4	2004
10236	S10_2016	22	100.00000000000000000	1	2852.0801	2004-04-03 00:00:00	2004-04-11 00:00:00	2004-04-08 00:00:00	Shipped	\N	486	2004-04-03	2	4	2004
10236	S18_2625	23	55.72000000000000000	2	1281.5601	2004-04-03 00:00:00	2004-04-11 00:00:00	2004-04-08 00:00:00	Shipped	\N	486	2004-04-03	2	4	2004
10236	S24_2000	36	87.60000000000000000	3	3153.6001	2004-04-03 00:00:00	2004-04-11 00:00:00	2004-04-08 00:00:00	Shipped	\N	486	2004-04-03	2	4	2004
10237	S10_1678	23	100.00000000000000000	7	2333.1201	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S10_4698	39	100.00000000000000000	9	7023.8999	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S12_2823	32	100.00000000000000000	6	4193.2798	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S18_3782	26	52.22000000000000000	1	1357.72	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S24_1578	20	100.00000000000000000	8	2299	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S24_2360	26	79.65000000000000000	4	2070.8999	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S32_2206	26	40.23000000000000000	2	1045.98	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S32_4485	27	100.00000000000000000	5	3113.6399	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10237	S50_4713	20	68.34000000000000000	3	1366.8	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181	2004-04-05	2	4	2004
10238	S12_1099	28	100.00000000000000000	3	5774.7202	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S12_3380	29	100.00000000000000000	1	3167.3799	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S12_3990	20	74.21000000000000000	4	1484.2	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S18_3278	41	73.17000000000000000	6	2999.97	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S18_3482	49	100.00000000000000000	5	6554.2402	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S18_4721	44	100.00000000000000000	8	6350.96	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S24_3371	47	62.45000000000000000	2	2935.1499	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10238	S24_4620	22	93.77000000000000000	7	2062.9399	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145	2004-04-09	2	4	2004
10239	S12_4675	21	93.28000000000000000	5	1958.88	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311	2004-04-12	2	4	2004
10239	S18_1889	46	73.92000000000000000	4	3400.3201	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311	2004-04-12	2	4	2004
10239	S18_3232	47	100.00000000000000000	1	7083.3701	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311	2004-04-12	2	4	2004
10239	S24_2972	20	44.56000000000000000	2	891.20001	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311	2004-04-12	2	4	2004
10239	S24_3856	29	100.00000000000000000	3	4479.6299	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311	2004-04-12	2	4	2004
10240	S18_1129	41	100.00000000000000000	3	5628.8901	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-20 00:00:00	Shipped	\N	177	2004-04-13	2	4	2004
10240	S18_1984	37	100.00000000000000000	2	5526.3198	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-20 00:00:00	Shipped	\N	177	2004-04-13	2	4	2004
10240	S18_3685	37	100.00000000000000000	1	5959.2202	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-20 00:00:00	Shipped	\N	177	2004-04-13	2	4	2004
10241	S18_1589	21	100.00000000000000000	11	2508.6599	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S18_1749	41	100.00000000000000000	2	7597.2998	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S18_2248	33	72.65000000000000000	1	2397.45	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S18_2870	44	100.00000000000000000	12	6853.4399	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S18_4409	42	90.19000000000000000	3	3787.98	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S18_4933	30	66.99000000000000000	4	2009.7	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_1046	22	76.43000000000000000	8	1681.46	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_1628	21	40.25000000000000000	10	845.25	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_2766	47	94.50000000000000000	6	4441.5	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_2887	28	98.65000000000000000	5	2762.2	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_3191	26	81.33000000000000000	7	2114.5801	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10241	S24_3432	27	86.73000000000000000	9	2341.71	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209	2004-04-13	2	4	2004
10242	S24_3969	46	36.93000000000000000	1	1698.78	2004-04-20 00:00:00	2004-04-28 00:00:00	2004-04-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	456	2004-04-20	2	4	2004
10243	S18_2325	47	100.00000000000000000	2	6154.1802	2004-04-26 00:00:00	2004-05-03 00:00:00	2004-04-28 00:00:00	Shipped	\N	495	2004-04-26	2	4	2004
10243	S24_1937	33	29.54000000000000000	1	974.82001	2004-04-26 00:00:00	2004-05-03 00:00:00	2004-04-28 00:00:00	Shipped	\N	495	2004-04-26	2	4	2004
10244	S18_1342	40	100.00000000000000000	7	4684.7998	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_1367	20	58.22000000000000000	6	1164.4	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_2795	43	100.00000000000000000	8	5950.3398	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_2949	30	100.00000000000000000	1	3525.6001	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_2957	24	58.09000000000000000	3	1394.16	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_3136	29	100.00000000000000000	2	3340.51	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S18_3320	36	84.33000000000000000	5	3035.8799	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S24_2022	39	45.25000000000000000	9	1764.75	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10244	S24_4258	40	86.68000000000000000	4	3467.2	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141	2004-04-29	2	4	2004
10245	S10_1949	34	100.00000000000000000	9	6120.3398	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S10_4962	28	100.00000000000000000	2	4591.7202	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S12_1666	38	100.00000000000000000	6	5920.3999	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S18_1097	29	100.00000000000000000	8	3451	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S18_4600	21	100.00000000000000000	3	2390.22	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S18_4668	45	59.87000000000000000	7	2694.1499	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S32_1268	37	100.00000000000000000	1	4133.6401	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S32_3522	44	69.16000000000000000	5	3043.04	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10245	S700_2824	44	100.00000000000000000	4	4628.7998	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455	2004-05-04	2	5	2004
10246	S12_4473	46	100.00000000000000000	5	5069.6602	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S18_2238	40	100.00000000000000000	4	6549.2002	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S18_2319	22	98.18000000000000000	8	2159.96	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S18_2432	30	61.99000000000000000	11	1859.7	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S18_3232	36	100.00000000000000000	9	7132.6802	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S24_1444	44	52.60000000000000000	2	2314.3999	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S24_2300	29	100.00000000000000000	10	3520.6001	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S24_2840	49	36.07000000000000000	6	1767.4301	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S24_4048	46	100.00000000000000000	1	6311.2002	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S32_2509	35	48.70000000000000000	7	1704.5	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10246	S50_1392	22	100.00000000000000000	3	2928.4199	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141	2004-05-05	2	5	2004
10247	S12_1108	44	100.00000000000000000	2	10606.2	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10247	S12_3148	25	100.00000000000000000	3	4381.25	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10247	S12_3891	27	100.00000000000000000	1	4157.73	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10247	S18_4027	48	100.00000000000000000	5	6756	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10247	S32_3207	40	49.71000000000000000	6	1988.4	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10247	S50_1514	49	63.85000000000000000	4	3128.6499	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334	2004-05-05	2	5	2004
10248	S10_4757	20	100.00000000000000000	3	2910.3999	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S18_3029	21	73.98000000000000000	1	1553.58	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S18_3140	32	100.00000000000000000	12	3802.5601	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S18_3259	42	100.00000000000000000	14	5082.4199	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S18_4522	42	75.48000000000000000	11	3170.1599	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S24_2011	48	100.00000000000000000	10	6960.48	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S24_3151	30	100.00000000000000000	5	3053.7	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S24_3816	23	76.31000000000000000	2	1755.13	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S700_1138	36	71.34000000000000000	6	2568.24	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S700_1938	40	100.00000000000000000	13	4157.2002	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S700_2610	32	75.89000000000000000	4	2428.48	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S700_3505	30	100.00000000000000000	7	3245.3999	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S700_3962	35	90.37000000000000000	8	3162.95	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10248	S72_3212	23	65.52000000000000000	9	1506.96	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131	2004-05-07	2	5	2004
10249	S18_3856	46	100.00000000000000000	5	5600.5	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173	2004-05-08	2	5	2004
10249	S24_2841	20	67.82000000000000000	1	1356.4	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173	2004-05-08	2	5	2004
10249	S24_3420	25	69.70000000000000000	2	1742.5	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173	2004-05-08	2	5	2004
10249	S700_2047	40	95.95000000000000000	4	3838	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173	2004-05-08	2	5	2004
10249	S72_1253	32	57.61000000000000000	3	1843.52	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173	2004-05-08	2	5	2004
10250	S18_1662	45	100.00000000000000000	14	8160.2998	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S18_2581	27	98.84000000000000000	4	2668.6799	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S24_1785	31	88.63000000000000000	6	2747.53	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S24_2000	32	87.60000000000000000	1	2803.2	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S24_3949	40	75.06000000000000000	13	3002.3999	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S24_4278	37	74.62000000000000000	5	2760.9399	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S32_1374	31	100.00000000000000000	2	3282.28	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S32_4289	50	61.22000000000000000	7	3061	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S50_1341	36	51.93000000000000000	8	1869.48	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S700_1691	31	91.34000000000000000	9	2831.54	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S700_2466	35	100.00000000000000000	11	3909.1499	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S700_2834	44	100.00000000000000000	3	6055.7202	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S700_3167	44	67.20000000000000000	10	2956.8	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10250	S700_4002	38	62.19000000000000000	12	2363.22	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450	2004-05-11	2	5	2004
10251	S10_1678	28	100.00000000000000000	2	3188.6399	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10251	S10_2016	44	100.00000000000000000	5	5756.52	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10251	S10_4698	43	100.00000000000000000	4	7078.23	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10251	S12_2823	46	100.00000000000000000	1	7552.2798	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10251	S18_2625	29	61.18000000000000000	6	1774.22	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10251	S24_1578	26	100.00000000000000000	3	2637.1799	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328	2004-05-18	2	5	2004
10252	S18_3278	20	76.39000000000000000	2	1527.8	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S18_3482	41	100.00000000000000000	1	6749.8301	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S18_3782	31	52.84000000000000000	5	1638.04	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S18_4721	26	100.00000000000000000	4	3559.3999	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S24_2360	47	65.80000000000000000	8	3092.6001	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S24_4620	38	87.31000000000000000	3	3317.78	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S32_2206	36	48.28000000000000000	6	1738.08	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S32_4485	25	100.00000000000000000	9	2832	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10252	S50_4713	48	72.41000000000000000	7	3475.6799	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406	2004-05-26	2	5	2004
10253	S12_1099	24	100.00000000000000000	13	3922.5601	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S12_3380	22	100.00000000000000000	11	2402.8401	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S12_3990	25	90.17000000000000000	14	2254.25	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S12_4675	41	100.00000000000000000	10	4910.5698	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_1129	26	100.00000000000000000	5	3054.48	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_1589	24	100.00000000000000000	1	3374.8799	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_1889	23	83.93000000000000000	9	1930.39	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_1984	33	100.00000000000000000	4	4459.6201	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_2870	37	100.00000000000000000	2	5177.04	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_3232	40	100.00000000000000000	6	6773.6001	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S18_3685	31	100.00000000000000000	3	4029.3799	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S24_2972	40	42.67000000000000000	7	1706.8	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S24_3371	24	52.66000000000000000	12	1263.84	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10253	S24_3856	39	100.00000000000000000	8	5148	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201	2004-06-01	2	6	2004
10254	S18_1749	49	100.00000000000000000	5	6997.2002	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S18_2248	36	63.57000000000000000	4	2288.52	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S18_2325	41	100.00000000000000000	2	4534.6001	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S18_4409	34	92.95000000000000000	6	3160.3	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S18_4933	30	57.73000000000000000	7	1731.9	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_1046	34	64.67000000000000000	11	2198.78	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_1628	32	60.37000000000000000	13	1931.84	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_1937	38	26.88000000000000000	1	1021.44	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_2766	31	100.00000000000000000	9	3126.97	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_2887	33	96.30000000000000000	8	3177.8999	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_3191	42	96.74000000000000000	10	4063.0801	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_3432	49	100.00000000000000000	12	4932.3398	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10254	S24_3969	20	43.49000000000000000	3	869.79999	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323	2004-06-03	2	6	2004
10255	S18_2795	24	100.00000000000000000	1	3726	2004-06-04 00:00:00	2004-06-12 00:00:00	2004-06-09 00:00:00	Shipped	\N	209	2004-06-04	2	6	2004
10255	S24_2022	37	45.70000000000000000	2	1690.9	2004-06-04 00:00:00	2004-06-12 00:00:00	2004-06-09 00:00:00	Shipped	\N	209	2004-06-04	2	6	2004
10256	S18_1342	34	95.55000000000000000	2	3248.7	2004-06-08 00:00:00	2004-06-16 00:00:00	2004-06-10 00:00:00	Shipped	\N	145	2004-06-08	2	6	2004
10256	S18_1367	29	51.75000000000000000	1	1500.75	2004-06-08 00:00:00	2004-06-16 00:00:00	2004-06-10 00:00:00	Shipped	\N	145	2004-06-08	2	6	2004
10257	S18_2949	50	88.14000000000000000	1	4407	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450	2004-06-14	2	6	2004
10257	S18_2957	49	53.72000000000000000	3	2632.28	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450	2004-06-14	2	6	2004
10257	S18_3136	37	84.82000000000000000	2	3138.3401	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450	2004-06-14	2	6	2004
10257	S18_3320	26	89.29000000000000000	5	2321.54	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450	2004-06-14	2	6	2004
10257	S24_4258	46	78.89000000000000000	4	3628.9399	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450	2004-06-14	2	6	2004
10258	S10_1949	32	100.00000000000000000	6	7680.6401	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10258	S12_1666	41	100.00000000000000000	3	6668.2402	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10258	S18_1097	41	100.00000000000000000	5	5453	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10258	S18_4668	21	59.87000000000000000	4	1257.27	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10258	S32_3522	20	61.41000000000000000	2	1228.2	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10258	S700_2824	45	80.92000000000000000	1	3641.3999	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398	2004-06-15	2	6	2004
10259	S10_4962	26	100.00000000000000000	12	4033.3799	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S12_4473	46	100.00000000000000000	4	6541.2002	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S18_2238	30	100.00000000000000000	3	5697.8999	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S18_2319	34	99.41000000000000000	7	3379.9399	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S18_2432	30	49.22000000000000000	10	1476.6	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S18_3232	27	100.00000000000000000	8	3657.6899	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S18_4600	41	100.00000000000000000	13	4666.6201	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S24_1444	28	46.82000000000000000	1	1310.96	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S24_2300	47	100.00000000000000000	9	5285.6201	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S24_2840	31	33.24000000000000000	5	1030.4399	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S32_1268	45	86.68000000000000000	11	3900.6001	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S32_2509	40	43.83000000000000000	6	1753.2	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10259	S50_1392	29	100.00000000000000000	2	3054.5701	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166	2004-06-15	2	6	2004
10260	S12_1108	46	100.00000000000000000	5	10514.7	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S12_3148	30	100.00000000000000000	6	5121.6001	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S12_3891	44	100.00000000000000000	4	7536.7598	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S18_3140	32	100.00000000000000000	1	4196.1602	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S18_3259	29	88.74000000000000000	3	2573.46	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S18_4027	23	100.00000000000000000	8	3567.53	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S24_4048	23	100.00000000000000000	10	2366.7	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S32_3207	27	57.17000000000000000	9	1543.59	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S50_1514	21	55.65000000000000000	7	1168.65	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10260	S700_1938	33	85.74000000000000000	2	2829.4199	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357	2004-06-16	2	6	2004
10261	S10_4757	27	100.00000000000000000	1	3378.24	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S18_4522	20	89.53000000000000000	9	1790.6	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S24_2011	36	100.00000000000000000	8	4512.6001	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S24_3151	22	91.17000000000000000	3	2005.74	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S700_1138	34	62.00000000000000000	4	2108	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S700_2610	44	68.67000000000000000	2	3021.48	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S700_3505	25	88.15000000000000000	5	2203.75	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S700_3962	50	81.43000000000000000	6	4071.5	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10261	S72_3212	29	50.78000000000000000	7	1472.62	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233	2004-06-17	2	6	2004
10262	S18_1662	49	100.00000000000000000	9	6567.96	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S18_3029	32	84.30000000000000000	15	2697.6001	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S18_3856	34	100.00000000000000000	14	4103.46	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S24_1785	34	97.38000000000000000	1	3310.9199	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S24_2841	24	67.14000000000000000	10	1611.36	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S24_3420	46	70.35000000000000000	11	3236.1001	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S24_3816	49	87.21000000000000000	16	4273.29	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S24_3949	48	61.42000000000000000	8	2948.1599	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S32_4289	40	79.11000000000000000	2	3164.3999	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S50_1341	49	37.97000000000000000	3	1860.53	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S700_1691	40	84.03000000000000000	4	3361.2	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S700_2047	44	94.14000000000000000	13	4142.1602	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S700_2466	33	90.75000000000000000	6	2994.75	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S700_3167	27	76.00000000000000000	5	2052	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S700_4002	35	71.07000000000000000	7	2487.45	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10262	S72_1253	21	57.11000000000000000	12	1199.3101	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141	2004-06-24	2	6	2004
10263	S10_1678	34	100.00000000000000000	2	3676.76	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S10_2016	40	100.00000000000000000	5	4472	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S10_4698	41	100.00000000000000000	4	8336.9404	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S12_2823	48	100.00000000000000000	1	6434.3999	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S18_2581	33	86.17000000000000000	10	2843.6101	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S18_2625	34	58.75000000000000000	6	1997.5	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S24_1578	42	100.00000000000000000	3	4307.52	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S24_2000	37	62.46000000000000000	7	2311.02	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S24_4278	24	75.35000000000000000	11	1808.4	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S32_1374	31	79.91000000000000000	8	2477.21	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10263	S700_2834	47	100.00000000000000000	9	5465.1602	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175	2004-06-28	2	6	2004
10264	S18_3782	48	54.71000000000000000	3	2626.0801	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S18_4721	20	100.00000000000000000	2	2410.6001	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S24_2360	37	65.10000000000000000	6	2408.7	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S24_4620	47	83.27000000000000000	1	3913.6899	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S32_2206	20	32.59000000000000000	4	651.79999	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S32_4485	34	97.97000000000000000	7	3330.98	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10264	S50_4713	47	89.50000000000000000	5	4206.5	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362	2004-06-30	2	6	2004
10265	S18_3278	45	86.84000000000000000	2	3907.8	2004-07-02 00:00:00	2004-07-09 00:00:00	2004-07-07 00:00:00	Shipped	\N	471	2004-07-02	3	7	2004
10265	S18_3482	49	100.00000000000000000	1	8427.0195	2004-07-02 00:00:00	2004-07-09 00:00:00	2004-07-07 00:00:00	Shipped	\N	471	2004-07-02	3	7	2004
10266	S12_1099	44	100.00000000000000000	14	9160.3604	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S12_3380	22	100.00000000000000000	12	2454.54	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S12_3990	35	76.61000000000000000	15	2681.3501	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S12_4675	40	100.00000000000000000	11	4468.3999	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_1129	21	100.00000000000000000	6	2526.51	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_1589	36	100.00000000000000000	2	5196.6001	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_1889	33	74.69000000000000000	10	2464.77	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_1984	49	100.00000000000000000	5	6203.3999	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_2870	20	100.00000000000000000	3	2824.8	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_3232	29	100.00000000000000000	7	4812.5498	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S18_3685	33	100.00000000000000000	4	5035.1401	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S24_1628	28	48.30000000000000000	1	1352.4	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S24_2972	34	40.40000000000000000	8	1373.6	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S24_3371	47	62.45000000000000000	13	2935.1499	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10266	S24_3856	24	100.00000000000000000	9	2932.0801	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386	2004-07-06	3	7	2004
10267	S18_4933	36	75.55000000000000000	1	2719.8	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10267	S24_1046	40	80.10000000000000000	5	3204	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10267	S24_2766	38	87.24000000000000000	3	3315.1201	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10267	S24_2887	43	100.00000000000000000	2	4645.7202	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10267	S24_3191	44	96.74000000000000000	4	4256.5601	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10267	S24_3432	43	100.00000000000000000	6	5110.98	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151	2004-07-07	3	7	2004
10268	S18_1342	49	100.00000000000000000	3	5738.8799	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_1367	26	64.69000000000000000	2	1681.9399	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_1749	34	100.00000000000000000	10	5491	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_2248	31	49.04000000000000000	9	1520.24	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_2325	50	100.00000000000000000	7	5276	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_2795	35	100.00000000000000000	4	5315.7998	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_3320	39	89.29000000000000000	1	3482.3101	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S18_4409	35	87.43000000000000000	11	3060.05	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S24_1937	33	38.83000000000000000	6	1281.39	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S24_2022	40	46.14000000000000000	5	1845.6	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10268	S24_3969	30	40.62000000000000000	8	1218.6	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412	2004-07-12	3	7	2004
10269	S18_2957	32	63.08000000000000000	1	2018.5601	2004-07-16 00:00:00	2004-07-22 00:00:00	2004-07-18 00:00:00	Shipped	\N	382	2004-07-16	3	7	2004
10269	S24_4258	48	97.39000000000000000	2	4674.7202	2004-07-16 00:00:00	2004-07-22 00:00:00	2004-07-18 00:00:00	Shipped	\N	382	2004-07-16	3	7	2004
10270	S10_1949	21	100.00000000000000000	9	4905.3901	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S10_4962	32	100.00000000000000000	2	4302.0801	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S12_1666	28	100.00000000000000000	6	4094.72	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S18_1097	43	96.84000000000000000	8	4164.1201	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S18_2949	31	96.24000000000000000	10	2983.4399	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S18_3136	38	100.00000000000000000	11	4775.0801	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S18_4600	38	100.00000000000000000	3	5383.0801	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S18_4668	44	58.36000000000000000	7	2567.8401	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S32_1268	32	85.72000000000000000	1	2743.04	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S32_3522	21	63.35000000000000000	5	1330.35	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10270	S700_2824	46	88.00000000000000000	4	4048	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282	2004-07-19	3	7	2004
10271	S12_4473	31	97.17000000000000000	5	3012.27	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S18_2238	50	100.00000000000000000	4	9169	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S18_2319	50	100.00000000000000000	8	5093.5	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S18_2432	25	69.28000000000000000	11	1732	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S18_3232	20	100.00000000000000000	9	3928.6001	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S24_1444	45	64.74000000000000000	2	2913.3	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S24_2300	43	100.00000000000000000	10	5605.0498	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S24_2840	38	41.72000000000000000	6	1585.36	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S24_4048	22	100.00000000000000000	1	3070.54	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S32_2509	35	47.62000000000000000	7	1666.7	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10271	S50_1392	34	98.39000000000000000	3	3345.26	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124	2004-07-20	3	7	2004
10272	S12_1108	35	100.00000000000000000	2	5818.3999	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10272	S12_3148	27	100.00000000000000000	3	4283.0098	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10272	S12_3891	39	100.00000000000000000	1	7962.2402	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10272	S18_4027	25	100.00000000000000000	5	3734	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10272	S32_3207	45	64.63000000000000000	6	2908.3501	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10272	S50_1514	43	56.82000000000000000	4	2443.26	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157	2004-07-20	3	7	2004
10273	S10_4757	30	100.00000000000000000	4	3508.8	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S18_3029	34	98.06000000000000000	2	3334.04	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S18_3140	40	100.00000000000000000	13	5026.3999	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S18_3259	47	100.00000000000000000	15	5450.5898	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S18_3856	50	85.75000000000000000	1	4287.5	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S18_4522	33	71.09000000000000000	12	2345.97	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S24_2011	22	100.00000000000000000	11	2784.76	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S24_3151	27	100.00000000000000000	6	2796.1201	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S24_3816	48	83.02000000000000000	3	3984.96	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S700_1138	21	65.34000000000000000	7	1372.14	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S700_1938	21	100.00000000000000000	14	2146.2	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S700_2610	42	62.16000000000000000	5	2610.72	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S700_3505	40	86.15000000000000000	8	3446	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S700_3962	26	100.00000000000000000	9	2969.46	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10273	S72_3212	37	45.86000000000000000	10	1696.8199	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314	2004-07-21	3	7	2004
10274	S18_1662	41	100.00000000000000000	1	6724	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379	2004-07-21	3	7	2004
10274	S24_2841	40	65.08000000000000000	2	2603.2	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379	2004-07-21	3	7	2004
10274	S24_3420	24	72.33000000000000000	3	1735.92	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379	2004-07-21	3	7	2004
10274	S700_2047	24	90.52000000000000000	5	2172.48	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379	2004-07-21	3	7	2004
10274	S72_1253	32	58.60000000000000000	4	1875.2	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379	2004-07-21	3	7	2004
10275	S10_1678	45	92.83000000000000000	1	4177.3501	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S10_2016	22	100.00000000000000000	4	2904.4399	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S10_4698	36	100.00000000000000000	3	6901.9199	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S18_2581	35	90.39000000000000000	9	3163.6499	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S18_2625	37	63.60000000000000000	5	2353.2	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S24_1578	21	100.00000000000000000	2	2153.76	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S24_1785	25	95.20000000000000000	11	2380	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S24_2000	30	79.98000000000000000	6	2399.3999	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S24_3949	41	81.89000000000000000	18	3357.49	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S24_4278	27	62.31000000000000000	10	1682.37	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S32_1374	23	81.91000000000000000	7	1883.9301	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S32_4289	28	63.97000000000000000	12	1791.16	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S50_1341	38	45.39000000000000000	13	1724.8199	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S700_1691	32	89.51000000000000000	14	2864.3201	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S700_2466	39	100.00000000000000000	16	4472.52	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S700_2834	48	100.00000000000000000	8	6378.7202	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S700_3167	43	73.60000000000000000	15	3164.8	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10275	S700_4002	31	72.55000000000000000	17	2249.05	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119	2004-07-23	3	7	2004
10276	S12_1099	50	100.00000000000000000	3	9631	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S12_2823	43	100.00000000000000000	14	5181.5	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S12_3380	47	100.00000000000000000	1	5464.6899	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S12_3990	38	83.79000000000000000	4	3184.02	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S18_3278	38	69.96000000000000000	6	2658.48	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S18_3482	30	100.00000000000000000	5	3924.6001	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S18_3782	33	50.36000000000000000	9	1661.88	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S18_4721	48	100.00000000000000000	8	5713.9199	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S24_2360	46	75.49000000000000000	12	3472.54	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S24_3371	20	61.23000000000000000	2	1224.6	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S24_4620	48	75.18000000000000000	7	3608.6399	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S32_2206	27	36.61000000000000000	10	988.46997	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S32_4485	38	100.00000000000000000	13	4304.6401	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10276	S50_4713	21	70.78000000000000000	11	1486.38	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204	2004-08-02	3	8	2004
10277	S12_4675	28	100.00000000000000000	1	3127.8799	2004-08-04 00:00:00	2004-08-12 00:00:00	2004-08-05 00:00:00	Shipped	\N	148	2004-08-04	3	8	2004
10278	S18_1129	34	100.00000000000000000	6	4667.8599	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_1589	23	100.00000000000000000	2	2604.52	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_1889	29	90.86000000000000000	10	2634.9399	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_1984	29	100.00000000000000000	5	3754.05	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_2870	39	100.00000000000000000	3	4324.3198	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_3232	42	100.00000000000000000	7	6401.2202	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S18_3685	31	100.00000000000000000	4	4116.7998	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S24_1628	35	45.28000000000000000	1	1584.8	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S24_2972	31	38.89000000000000000	8	1205.59	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10278	S24_3856	25	100.00000000000000000	9	3159.75	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112	2004-08-06	3	8	2004
10279	S18_4933	26	60.58000000000000000	1	1575.08	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10279	S24_1046	32	74.96000000000000000	5	2398.72	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10279	S24_2766	49	79.97000000000000000	3	3918.53	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10279	S24_2887	48	100.00000000000000000	2	5580.96	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10279	S24_3191	33	71.06000000000000000	4	2344.98	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10279	S24_3432	48	100.00000000000000000	6	6168	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141	2004-08-09	3	8	2004
10280	S10_1949	34	100.00000000000000000	2	8014.8198	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_1097	24	100.00000000000000000	1	2800.0801	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_1342	50	100.00000000000000000	9	5239.5	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_1367	27	57.68000000000000000	8	1557.36	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_1749	26	100.00000000000000000	16	3668.6001	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_2248	25	62.96000000000000000	15	1574	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_2325	37	100.00000000000000000	13	4750.7998	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_2795	22	100.00000000000000000	10	4455	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_2949	46	100.00000000000000000	3	5126.2402	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_2957	43	68.71000000000000000	5	2954.53	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_3136	29	100.00000000000000000	4	3006.4299	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_3320	34	100.00000000000000000	7	3474.46	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S18_4409	35	100.00000000000000000	17	3704.05	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S24_1937	20	28.88000000000000000	12	577.59998	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S24_2022	45	47.49000000000000000	11	2137.05	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S24_3969	33	41.85000000000000000	14	1381.05	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10280	S24_4258	21	78.89000000000000000	6	1656.6899	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249	2004-08-17	3	8	2004
10281	S10_4962	44	100.00000000000000000	9	7020.6401	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S12_1666	25	100.00000000000000000	13	2938.5	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S12_4473	41	100.00000000000000000	1	5247.1802	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S18_2319	48	100.00000000000000000	4	5773.4399	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S18_2432	29	57.73000000000000000	7	1674.17	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S18_3232	25	100.00000000000000000	5	4191.25	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S18_4600	25	99.29000000000000000	10	2482.25	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S18_4668	44	59.87000000000000000	14	2634.28	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S24_2300	25	100.00000000000000000	6	2779.5	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S24_2840	20	40.66000000000000000	2	813.20001	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S32_1268	29	82.83000000000000000	8	2402.0701	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S32_2509	31	55.19000000000000000	3	1710.89	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S32_3522	36	77.57000000000000000	12	2792.52	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10281	S700_2824	27	85.98000000000000000	11	2321.46	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157	2004-08-19	3	8	2004
10282	S12_1108	41	100.00000000000000000	5	7071.27	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S12_3148	27	100.00000000000000000	6	4364.8198	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S12_3891	24	100.00000000000000000	4	3778.8	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S18_2238	23	100.00000000000000000	13	3238.6299	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S18_3140	43	100.00000000000000000	1	6695.5298	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S18_3259	36	100.00000000000000000	3	4174.9199	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S18_4027	31	100.00000000000000000	8	4674.7998	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S24_1444	29	46.82000000000000000	11	1357.78	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S24_4048	39	100.00000000000000000	10	4797.3901	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S32_3207	36	59.65000000000000000	9	2147.3999	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S50_1392	38	100.00000000000000000	12	4310.7202	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S50_1514	37	66.78000000000000000	7	2470.8601	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10282	S700_1938	43	86.61000000000000000	2	3724.23	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124	2004-08-20	3	8	2004
10283	S10_4757	25	100.00000000000000000	6	2992	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S18_3029	21	98.06000000000000000	4	2059.26	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S18_3856	46	100.00000000000000000	3	5795.54	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S18_4522	34	100.00000000000000000	14	3580.8799	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S24_2011	42	100.00000000000000000	13	5316.3599	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S24_3151	34	92.94000000000000000	8	3159.96	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S24_3816	33	72.96000000000000000	5	2407.6799	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S700_1138	45	78.67000000000000000	9	3540.1499	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S700_2047	20	94.14000000000000000	2	1882.8	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S700_2610	47	65.77000000000000000	7	3091.1899	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S700_3505	22	88.15000000000000000	10	1939.3	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S700_3962	38	89.38000000000000000	11	3396.4399	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S72_1253	43	57.61000000000000000	1	2477.23	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10283	S72_3212	33	51.32000000000000000	12	1693.5601	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260	2004-08-20	3	8	2004
10284	S18_1662	45	100.00000000000000000	11	5747.8501	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S18_2581	31	71.81000000000000000	1	2226.1101	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S24_1785	22	100.00000000000000000	3	2310.8799	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S24_2841	30	73.99000000000000000	12	2219.7	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S24_3420	39	71.67000000000000000	13	2795.1299	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S24_3949	21	55.96000000000000000	10	1175.16	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S24_4278	21	71.00000000000000000	2	1491	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S32_4289	50	81.86000000000000000	4	4093	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S50_1341	33	51.93000000000000000	5	1713.6899	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S700_1691	24	83.12000000000000000	6	1994.88	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S700_2466	45	100.00000000000000000	8	4576.9502	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S700_3167	25	69.60000000000000000	7	1740	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10284	S700_4002	32	64.41000000000000000	9	2061.1201	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299	2004-08-21	3	8	2004
10285	S10_1678	36	100.00000000000000000	6	4099.6802	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S10_2016	47	100.00000000000000000	9	6484.5898	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S10_4698	27	100.00000000000000000	8	5438.0698	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S12_2823	49	100.00000000000000000	5	6863.9199	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S18_2625	20	49.06000000000000000	10	981.20001	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S24_1578	34	100.00000000000000000	7	3716.8799	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S24_2000	39	70.08000000000000000	11	2733.1201	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S24_2360	38	59.56000000000000000	3	2263.28	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S32_1374	37	98.89000000000000000	12	3658.9299	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S32_2206	37	41.03000000000000000	1	1518.11	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S32_4485	26	100.00000000000000000	4	2600.26	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S50_4713	39	78.92000000000000000	2	3077.8799	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10285	S700_2834	45	100.00000000000000000	13	5392.7998	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286	2004-08-27	3	8	2004
10286	S18_3782	38	57.20000000000000000	1	2173.6001	2004-08-28 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	172	2004-08-28	3	8	2004
10287	S12_1099	21	100.00000000000000000	12	3432.24	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S12_3380	45	100.00000000000000000	10	4756.5	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S12_3990	41	69.43000000000000000	13	2846.6299	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S12_4675	23	100.00000000000000000	9	2675.1299	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_1129	41	100.00000000000000000	4	6499.3198	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_1889	44	82.39000000000000000	8	3625.1599	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_1984	24	100.00000000000000000	3	3516.48	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_2870	44	100.00000000000000000	1	5052.96	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_3232	36	100.00000000000000000	5	5852.52	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_3278	43	70.76000000000000000	15	3042.6799	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_3482	40	100.00000000000000000	14	6761.6001	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_3685	27	100.00000000000000000	2	4310.5498	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S18_4721	34	100.00000000000000000	17	4300.3198	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S24_2972	36	39.65000000000000000	6	1427.4	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S24_3371	20	67.97000000000000000	11	1359.4	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S24_3856	36	100.00000000000000000	7	4297.3198	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10287	S24_4620	40	88.12000000000000000	16	3524.8	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298	2004-08-30	3	8	2004
10288	S18_1589	20	100.00000000000000000	14	2936.8	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S18_1749	32	100.00000000000000000	5	5875.2002	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S18_2248	28	61.75000000000000000	4	1729	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S18_2325	31	100.00000000000000000	2	3822.9199	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S18_4409	35	80.99000000000000000	6	2834.6499	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S18_4933	23	73.41000000000000000	7	1688.4301	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_1046	36	66.14000000000000000	11	2381.04	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_1628	50	52.32000000000000000	13	2616	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_1937	29	38.17000000000000000	1	1106.9301	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_2766	35	80.87000000000000000	9	2830.45	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_2887	48	100.00000000000000000	8	6539.04	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_3191	34	68.49000000000000000	10	2328.6599	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_3432	41	100.00000000000000000	12	4873.2598	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10288	S24_3969	33	40.62000000000000000	3	1340.46	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166	2004-09-01	3	9	2004
10289	S18_1342	38	100.00000000000000000	2	4567.98	2004-09-03 00:00:00	2004-09-13 00:00:00	2004-09-04 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	167	2004-09-03	3	9	2004
10289	S18_1367	24	56.07000000000000000	1	1345.6801	2004-09-03 00:00:00	2004-09-13 00:00:00	2004-09-04 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	167	2004-09-03	3	9	2004
10289	S18_2795	43	100.00000000000000000	3	8272.3398	2004-09-03 00:00:00	2004-09-13 00:00:00	2004-09-04 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	167	2004-09-03	3	9	2004
10289	S24_2022	45	48.38000000000000000	4	2177.1001	2004-09-03 00:00:00	2004-09-13 00:00:00	2004-09-04 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	167	2004-09-03	3	9	2004
10290	S18_3320	26	96.23000000000000000	2	2501.98	2004-09-07 00:00:00	2004-09-15 00:00:00	2004-09-13 00:00:00	Shipped	\N	198	2004-09-07	3	9	2004
10290	S24_4258	45	100.00000000000000000	1	5171.3999	2004-09-07 00:00:00	2004-09-15 00:00:00	2004-09-13 00:00:00	Shipped	\N	198	2004-09-07	3	9	2004
10291	S10_1949	37	100.00000000000000000	11	7136.1899	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S10_4962	30	100.00000000000000000	4	3855.8999	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S12_1666	41	100.00000000000000000	8	6387.7998	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_1097	41	100.00000000000000000	10	4687.9399	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_2432	26	57.73000000000000000	2	1500.98	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_2949	47	100.00000000000000000	12	5713.79	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_2957	37	50.59000000000000000	14	1871.83	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_3136	23	100.00000000000000000	13	2866.26	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_4600	48	100.00000000000000000	5	5288.6401	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S18_4668	29	51.82000000000000000	9	1502.78	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S24_2300	48	100.00000000000000000	1	5398.0801	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S32_1268	26	83.79000000000000000	3	2178.54	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S32_3522	32	71.75000000000000000	7	2296	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10291	S700_2824	28	100.00000000000000000	6	3256.96	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448	2004-09-08	3	9	2004
10292	S12_4473	21	100.00000000000000000	8	2214.8701	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S18_2238	26	100.00000000000000000	7	4554.9399	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S18_2319	41	100.00000000000000000	11	4528.8599	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S18_3232	21	100.00000000000000000	12	2844.8701	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S18_4027	44	100.00000000000000000	2	7140.7598	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S24_1444	40	53.75000000000000000	5	2150	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S24_2840	39	30.06000000000000000	9	1172.34	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S24_4048	27	100.00000000000000000	4	3832.3799	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S32_2509	50	46.53000000000000000	10	2326.5	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S32_3207	31	67.73000000000000000	3	2099.6299	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S50_1392	41	100.00000000000000000	6	4983.1401	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10292	S50_1514	35	55.07000000000000000	1	1927.45	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131	2004-09-08	3	9	2004
10293	S12_1108	46	100.00000000000000000	8	8411.5596	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S12_3148	24	100.00000000000000000	9	4242.2402	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S12_3891	45	100.00000000000000000	7	8253	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S18_3140	24	100.00000000000000000	4	2819.28	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S18_3259	22	100.00000000000000000	6	2418.24	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S18_4522	49	100.00000000000000000	3	4946.0601	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S24_2011	21	100.00000000000000000	2	2941.8899	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S700_1938	29	71.89000000000000000	5	2084.8101	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10293	S72_3212	32	60.06000000000000000	1	1921.92	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249	2004-09-09	3	9	2004
10294	S700_3962	45	100.00000000000000000	1	4692.6001	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	204	2004-09-10	3	9	2004
10295	S10_4757	24	100.00000000000000000	1	3427.2	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362	2004-09-10	3	9	2004
10295	S24_3151	46	84.97000000000000000	3	3908.6201	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362	2004-09-10	3	9	2004
10295	S700_1138	26	75.34000000000000000	4	1958.84	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362	2004-09-10	3	9	2004
10295	S700_2610	44	58.55000000000000000	2	2576.2	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362	2004-09-10	3	9	2004
10295	S700_3505	34	100.00000000000000000	5	3473.78	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362	2004-09-10	3	9	2004
10296	S18_1662	36	100.00000000000000000	7	5676.8398	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S18_3029	21	96.34000000000000000	13	2023.14	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S18_3856	22	84.70000000000000000	12	1863.4	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S24_2841	21	71.25000000000000000	8	1496.25	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S24_3420	31	53.92000000000000000	9	1671.52	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S24_3816	22	77.15000000000000000	14	1697.3	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S24_3949	32	71.65000000000000000	6	2292.8	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S50_1341	26	48.44000000000000000	1	1259.4399	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S700_1691	42	100.00000000000000000	2	4296.6001	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S700_2047	34	100.00000000000000000	11	3477.8601	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S700_2466	24	100.00000000000000000	4	2441.04	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S700_3167	22	80.80000000000000000	3	1777.6	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S700_4002	47	86.62000000000000000	5	4071.1399	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10296	S72_1253	21	45.19000000000000000	10	948.98999	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415	2004-09-15	3	9	2004
10297	S18_2581	25	82.79000000000000000	4	2069.75	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S24_1785	32	100.00000000000000000	6	4061.76	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S24_2000	32	65.51000000000000000	1	2096.3201	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S24_4278	23	72.45000000000000000	5	1666.35	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S32_1374	26	100.00000000000000000	2	2856.8799	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S32_4289	28	79.80000000000000000	7	2234.3999	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10297	S700_2834	35	100.00000000000000000	3	3986.5	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189	2004-09-16	3	9	2004
10298	S10_2016	39	96.34000000000000000	1	3757.26	2004-09-27 00:00:00	2004-10-05 00:00:00	2004-10-01 00:00:00	Shipped	\N	103	2004-09-27	3	9	2004
10298	S18_2625	32	48.46000000000000000	2	1550.72	2004-09-27 00:00:00	2004-10-05 00:00:00	2004-10-01 00:00:00	Shipped	\N	103	2004-09-27	3	9	2004
10299	S10_1678	23	100.00000000000000000	9	2597.3899	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S10_4698	29	100.00000000000000000	11	6683.3398	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S12_2823	24	100.00000000000000000	8	4157.04	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S18_3782	39	55.95000000000000000	3	2182.05	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S18_4721	49	100.00000000000000000	2	7947.3101	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S24_1578	47	100.00000000000000000	10	5455.7598	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S24_2360	33	66.49000000000000000	6	2194.1699	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S24_4620	32	80.84000000000000000	1	2586.8799	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S32_2206	24	42.24000000000000000	4	1013.76	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S32_4485	38	100.00000000000000000	7	4382.1602	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10299	S50_4713	44	80.55000000000000000	5	3544.2	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186	2004-09-30	3	9	2004
10300	S12_1099	33	100.00000000000000000	5	5521.8901	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S12_3380	29	100.00000000000000000	3	3984.6001	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S12_3990	22	76.61000000000000000	6	1685.42	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S12_4675	23	100.00000000000000000	2	2807.6101	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S18_1889	41	92.40000000000000000	1	3788.3999	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S18_3278	49	78.80000000000000000	8	3861.2	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S18_3482	23	100.00000000000000000	7	3786.49	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10300	S24_3371	31	58.78000000000000000	4	1822.1801	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128	2003-10-04	4	10	2003
10301	S18_1129	37	100.00000000000000000	8	5917.7798	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S18_1589	32	100.00000000000000000	4	3424.6399	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S18_1984	47	100.00000000000000000	7	7488.04	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S18_2870	22	100.00000000000000000	5	3223.4399	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S18_3232	23	100.00000000000000000	9	4011.6599	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S18_3685	39	100.00000000000000000	6	6446.7002	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S24_1046	27	72.02000000000000000	1	1944.54	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S24_1628	22	51.32000000000000000	3	1129.04	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S24_2972	48	34.36000000000000000	10	1649.28	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S24_3432	22	96.37000000000000000	2	2120.1399	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10301	S24_3856	50	100.00000000000000000	11	7723.5	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299	2003-10-05	4	10	2003
10302	S18_1749	43	100.00000000000000000	1	7310	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10302	S18_4409	38	89.27000000000000000	2	3392.26	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10302	S18_4933	23	72.70000000000000000	3	1672.1	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10302	S24_2766	49	100.00000000000000000	5	5298.8599	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10302	S24_2887	45	100.00000000000000000	4	5548.9502	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10302	S24_3191	48	74.48000000000000000	6	3575.04	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201	2003-10-06	4	10	2003
10303	S18_2248	46	49.04000000000000000	2	2255.8401	2004-10-06 00:00:00	2004-10-14 00:00:00	2004-10-09 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	484	2004-10-06	4	10	2004
10303	S24_3969	24	40.21000000000000000	1	965.03998	2004-10-06 00:00:00	2004-10-14 00:00:00	2004-10-09 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	484	2004-10-06	4	10	2004
10304	S10_1949	47	100.00000000000000000	6	10172.7	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S12_1666	39	100.00000000000000000	3	6396	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_1097	46	98.00000000000000000	5	4508	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_1342	37	95.55000000000000000	13	3535.3501	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_1367	37	48.52000000000000000	12	1795.24	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_2325	24	100.00000000000000000	17	2440.8	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_2795	20	100.00000000000000000	14	3577.6001	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_2949	46	100.00000000000000000	7	4613.7998	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_2957	24	64.96000000000000000	9	1559.04	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_3136	26	85.87000000000000000	8	2232.6201	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_3320	38	100.00000000000000000	11	3958.46	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S18_4668	34	49.30000000000000000	4	1676.2	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S24_1937	23	30.20000000000000000	16	694.59998	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S24_2022	44	39.42000000000000000	15	1734.48	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S24_4258	33	100.00000000000000000	10	3342.5701	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S32_3522	36	73.04000000000000000	2	2629.4399	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10304	S700_2824	40	100.00000000000000000	1	4208	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256	2004-10-11	4	10	2004
10305	S10_4962	38	100.00000000000000000	13	6680.7798	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S12_4473	38	100.00000000000000000	5	4773.1802	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S18_2238	27	100.00000000000000000	4	3934.4399	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S18_2319	36	100.00000000000000000	8	4816.0801	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S18_2432	41	53.48000000000000000	11	2192.6799	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S18_3232	37	100.00000000000000000	9	7455.8701	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S18_4600	22	99.29000000000000000	14	2184.3799	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S24_1444	45	61.85000000000000000	2	2783.25	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S24_2300	24	100.00000000000000000	10	3189.6001	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S24_2840	48	31.47000000000000000	6	1510.5601	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S24_4048	36	100.00000000000000000	1	4641.48	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S32_1268	28	100.00000000000000000	12	3155.04	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S32_2509	40	57.90000000000000000	7	2316	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10305	S50_1392	42	100.00000000000000000	3	4618.3198	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286	2004-10-13	4	10	2004
10306	S12_1108	31	100.00000000000000000	13	6570.7598	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S12_3148	34	100.00000000000000000	14	4982.7002	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S12_3891	20	100.00000000000000000	12	3633.3999	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S18_3140	32	100.00000000000000000	9	3759.04	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S18_3259	40	91.76000000000000000	11	3670.3999	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S18_4027	23	100.00000000000000000	16	3600.6499	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S18_4522	39	90.40000000000000000	8	3525.6001	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S24_2011	29	100.00000000000000000	7	3207.3999	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S24_3151	31	84.08000000000000000	2	2606.48	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S32_3207	46	50.33000000000000000	17	2315.1799	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S50_1514	34	60.34000000000000000	15	2051.5601	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S700_1138	50	54.00000000000000000	3	2700	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S700_1938	38	91.81000000000000000	10	3488.78	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S700_2610	43	75.17000000000000000	1	3232.3101	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S700_3505	32	90.15000000000000000	4	2884.8	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S700_3962	30	100.00000000000000000	5	3515.7	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10306	S72_3212	35	59.51000000000000000	6	2082.8501	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187	2004-10-14	4	10	2004
10307	S10_4757	22	100.00000000000000000	9	2692.8	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S18_1662	39	100.00000000000000000	1	7379.9702	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S18_3029	31	83.44000000000000000	7	2586.6399	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S18_3856	48	86.81000000000000000	6	4166.8799	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S24_2841	25	75.36000000000000000	2	1884	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S24_3420	22	71.67000000000000000	3	1576.74	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S24_3816	22	91.41000000000000000	8	2011.02	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S700_2047	34	97.76000000000000000	5	3323.8401	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10307	S72_1253	34	53.63000000000000000	4	1823.42	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339	2004-10-14	4	10	2004
10308	S10_2016	34	100.00000000000000000	2	4043.96	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S10_4698	20	100.00000000000000000	1	4570.3999	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S18_2581	27	82.79000000000000000	7	2235.3301	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S18_2625	34	52.09000000000000000	3	1771.0601	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S24_1785	31	100.00000000000000000	9	3493.7	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S24_2000	47	63.22000000000000000	4	2971.3401	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S24_3949	43	76.43000000000000000	16	3286.49	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S24_4278	44	83.32000000000000000	8	3666.0801	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S32_1374	24	79.91000000000000000	5	1917.84	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S32_4289	46	66.04000000000000000	10	3037.8401	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S50_1341	47	43.64000000000000000	11	2051.0801	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S700_1691	21	100.00000000000000000	12	2224.95	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S700_2466	35	88.75000000000000000	14	3106.25	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S700_2834	31	100.00000000000000000	6	4009.23	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S700_3167	21	87.20000000000000000	13	1831.2	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10308	S700_4002	39	68.11000000000000000	15	2656.29	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319	2004-10-15	4	10	2004
10309	S10_1678	41	100.00000000000000000	5	4394.3799	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10309	S12_2823	26	100.00000000000000000	4	4660.2402	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10309	S24_1578	21	100.00000000000000000	6	2650.6201	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10309	S24_2360	24	56.10000000000000000	2	1346.4	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10309	S32_4485	50	84.70000000000000000	3	4235	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10309	S50_4713	28	88.68000000000000000	1	2483.04	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121	2004-10-15	4	10	2004
10310	S12_1099	33	100.00000000000000000	10	6934.6201	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S12_3380	24	100.00000000000000000	8	3100.3201	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S12_3990	49	81.40000000000000000	11	3988.6001	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S12_4675	25	100.00000000000000000	7	2504.75	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_1129	37	100.00000000000000000	2	6231.9102	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_1889	20	91.63000000000000000	6	1832.6	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_1984	24	100.00000000000000000	1	3448.0801	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_3232	48	100.00000000000000000	3	8940.96	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_3278	27	80.41000000000000000	13	2171.0701	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_3482	49	100.00000000000000000	12	6266.1201	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_3782	42	67.14000000000000000	16	2819.8799	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S18_4721	40	100.00000000000000000	15	5356.7998	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S24_2972	33	41.91000000000000000	4	1383.03	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S24_3371	38	56.94000000000000000	9	2163.72	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S24_3856	45	100.00000000000000000	5	5497.6499	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S24_4620	49	97.01000000000000000	14	4753.4902	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10310	S32_2206	36	43.05000000000000000	17	1549.8	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259	2004-10-16	4	10	2004
10311	S18_1589	29	100.00000000000000000	9	2923.2	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S18_2870	43	100.00000000000000000	10	5278.6802	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S18_3685	32	100.00000000000000000	11	3616.6399	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S18_4409	41	81.91000000000000000	1	3358.3101	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S18_4933	25	66.99000000000000000	2	1674.75	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_1046	26	87.45000000000000000	6	2273.7	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_1628	45	49.30000000000000000	8	2218.5	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_2766	28	93.60000000000000000	4	2620.8	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_2887	43	100.00000000000000000	3	4595.4102	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_3191	25	83.04000000000000000	5	2076	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10311	S24_3432	46	92.09000000000000000	7	4236.1401	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141	2004-10-16	4	10	2004
10312	S10_1949	48	100.00000000000000000	3	11623.7	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_1097	32	100.00000000000000000	2	4181.4399	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_1342	43	89.38000000000000000	10	3843.3401	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_1367	25	44.21000000000000000	9	1105.25	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_1749	48	100.00000000000000000	17	8078.3999	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_2248	30	61.15000000000000000	16	1834.5	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_2325	31	100.00000000000000000	14	4729.3599	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_2795	25	100.00000000000000000	11	3881.25	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_2949	37	100.00000000000000000	4	3711.1001	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_2957	35	53.72000000000000000	6	1880.2	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_3136	38	100.00000000000000000	5	4457.02	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_3320	33	100.00000000000000000	8	3535.95	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S18_4668	39	56.85000000000000000	1	2217.1499	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S24_1937	39	29.54000000000000000	13	1152.0601	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S24_2022	23	37.63000000000000000	12	865.48999	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S24_3969	31	35.29000000000000000	15	1093.99	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10312	S24_4258	44	100.00000000000000000	7	4884.8799	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124	2004-10-21	4	10	2004
10313	S10_4962	40	100.00000000000000000	7	6678	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S12_1666	21	100.00000000000000000	11	2669.1001	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S18_2319	29	100.00000000000000000	2	3416.78	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S18_2432	34	52.87000000000000000	5	1797.58	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S18_3232	25	100.00000000000000000	3	4572.25	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S18_4600	28	100.00000000000000000	8	2881.76	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S24_2300	42	100.00000000000000000	4	5581.7998	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S32_1268	27	87.64000000000000000	6	2366.28	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S32_2509	38	45.45000000000000000	1	1727.1	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S32_3522	34	56.24000000000000000	10	1912.16	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10313	S700_2824	30	99.13000000000000000	9	2973.8999	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202	2004-10-22	4	10	2004
10314	S12_1108	38	100.00000000000000000	5	7975.4399	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S12_3148	46	100.00000000000000000	6	6393.54	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S12_3891	36	100.00000000000000000	4	6913.7998	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S12_4473	45	100.00000000000000000	14	6185.7002	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S18_2238	42	100.00000000000000000	13	5776.2598	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S18_3140	20	100.00000000000000000	1	2731.8	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S18_3259	23	100.00000000000000000	3	2481.7	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S18_4027	29	100.00000000000000000	8	4206.7402	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S24_1444	44	53.18000000000000000	11	2339.9199	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S24_2840	39	37.13000000000000000	15	1448.0699	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S24_4048	38	100.00000000000000000	10	4000.26	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S32_3207	35	66.49000000000000000	9	2327.1499	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S50_1392	28	100.00000000000000000	12	3403.1201	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S50_1514	38	61.51000000000000000	7	2337.3799	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10314	S700_1938	23	76.22000000000000000	2	1753.0601	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227	2004-10-22	4	10	2004
10315	S18_4522	36	100.00000000000000000	7	3602.1599	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S24_2011	35	100.00000000000000000	6	4215.0498	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S24_3151	24	86.74000000000000000	1	2081.76	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S700_1138	41	62.00000000000000000	2	2542	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S700_3505	31	86.15000000000000000	3	2670.6499	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S700_3962	37	91.37000000000000000	4	3380.6899	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10315	S72_3212	40	55.69000000000000000	5	2227.6001	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119	2004-10-29	4	10	2004
10316	S10_4757	33	100.00000000000000000	17	4128.96	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S18_1662	27	100.00000000000000000	9	3704.1299	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S18_3029	21	94.62000000000000000	15	1987.02	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S18_3856	47	86.81000000000000000	14	4080.0701	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S24_1785	25	100.00000000000000000	1	2872.25	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S24_2841	34	63.71000000000000000	10	2166.1399	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S24_3420	47	76.93000000000000000	11	3615.71	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S24_3816	25	92.25000000000000000	16	2306.25	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S24_3949	30	77.79000000000000000	8	2333.7	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S32_4289	24	59.16000000000000000	2	1419.84	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S50_1341	34	47.57000000000000000	3	1617.38	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_1691	34	82.21000000000000000	4	2795.1399	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_2047	45	93.24000000000000000	13	4195.7998	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_2466	23	100.00000000000000000	6	2706.4099	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_2610	48	74.45000000000000000	18	3573.6001	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_3167	48	75.20000000000000000	5	3609.6001	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S700_4002	44	62.19000000000000000	7	2736.3601	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10316	S72_1253	34	43.70000000000000000	12	1485.8	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240	2004-11-01	4	11	2004
10317	S24_4278	35	83.32000000000000000	1	2916.2	2004-11-02 00:00:00	2004-11-12 00:00:00	2004-11-08 00:00:00	Shipped	\N	161	2004-11-02	4	11	2004
10318	S10_1678	46	94.74000000000000000	1	4358.04	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S10_2016	45	100.00000000000000000	4	5566.5	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S10_4698	37	100.00000000000000000	3	7667.1401	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S18_2581	31	100.00000000000000000	9	3116.4299	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S18_2625	42	52.70000000000000000	5	2213.3999	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S24_1578	48	100.00000000000000000	2	6437.2798	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S24_2000	26	86.83000000000000000	6	2257.5801	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S32_1374	47	100.00000000000000000	7	5305.3599	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10318	S700_2834	50	100.00000000000000000	8	7119	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157	2004-11-02	4	11	2004
10319	S12_2823	30	100.00000000000000000	9	4111.7998	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S18_3278	46	73.98000000000000000	1	3403.0801	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S18_3782	44	59.06000000000000000	4	2598.6399	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S18_4721	45	100.00000000000000000	3	7901.1001	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S24_2360	31	81.73000000000000000	7	2533.6299	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S24_4620	43	85.69000000000000000	2	3684.6699	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S32_2206	29	38.22000000000000000	5	1108.38	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S32_4485	22	100.00000000000000000	8	2626.8	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10319	S50_4713	45	77.29000000000000000	6	3478.05	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456	2004-11-03	4	11	2004
10320	S12_1099	31	100.00000000000000000	3	6876.1099	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144	2004-11-03	4	11	2004
10320	S12_3380	35	100.00000000000000000	1	4850.2998	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144	2004-11-03	4	11	2004
10320	S12_3990	38	73.42000000000000000	4	2789.96	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144	2004-11-03	4	11	2004
10320	S18_3482	25	100.00000000000000000	5	3491	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144	2004-11-03	4	11	2004
10320	S24_3371	26	61.23000000000000000	2	1591.98	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144	2004-11-03	4	11	2004
10321	S12_4675	24	100.00000000000000000	15	2984.8799	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_1129	41	100.00000000000000000	10	5803.1401	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_1589	44	100.00000000000000000	6	4489.7598	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_1889	37	78.54000000000000000	14	2905.98	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_1984	25	100.00000000000000000	9	3734	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_2870	27	100.00000000000000000	7	2851.2	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_3232	33	100.00000000000000000	11	5700.0898	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S18_3685	28	100.00000000000000000	8	4232.7598	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_1046	30	70.55000000000000000	3	2116.5	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_1628	48	42.26000000000000000	5	2028.48	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_2766	30	72.70000000000000000	1	2181	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_2972	37	33.23000000000000000	12	1229.51	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_3191	39	84.75000000000000000	2	3305.25	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_3432	21	89.95000000000000000	4	1888.95	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10321	S24_3856	26	100.00000000000000000	13	4052.8799	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462	2004-11-04	4	11	2004
10322	S10_1949	40	100.00000000000000000	1	6000.3999	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S10_4962	46	61.99000000000000000	8	2851.54	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S12_1666	27	100.00000000000000000	9	4784.1299	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_1097	22	100.00000000000000000	10	2251.04	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_1342	43	86.30000000000000000	14	3710.8999	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_1367	41	57.68000000000000000	5	2364.8799	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_2325	50	100.00000000000000000	6	12536.5	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_2432	35	61.21000000000000000	11	2142.3501	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_2795	36	100.00000000000000000	2	5797.4399	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_2949	33	100.00000000000000000	12	3524.73	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_2957	41	29.87000000000000000	13	1224.67	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S18_3136	48	47.04000000000000000	7	2257.9199	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S24_1937	20	100.00000000000000000	3	2624	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10322	S24_2022	30	100.00000000000000000	4	3500.1001	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363	2004-11-04	4	11	2004
10323	S18_3320	33	91.27000000000000000	2	3011.9099	2004-11-05 00:00:00	2004-11-12 00:00:00	2004-11-09 00:00:00	Shipped	\N	128	2004-11-05	4	11	2004
10323	S18_4600	47	100.00000000000000000	1	6203.0601	2004-11-05 00:00:00	2004-11-12 00:00:00	2004-11-09 00:00:00	Shipped	\N	128	2004-11-05	4	11	2004
10324	S12_3148	27	54.33000000000000000	1	1466.91	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S12_4473	26	58.38000000000000000	7	1517.88	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S18_2238	47	100.00000000000000000	8	7207.4502	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S18_2319	33	37.48000000000000000	10	1236.84	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S18_3232	27	100.00000000000000000	12	3155.49	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S18_4027	49	100.00000000000000000	13	5379.71	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S18_4668	38	100.00000000000000000	6	6832.02	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S24_1444	25	69.16000000000000000	14	1729	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S24_2300	31	100.00000000000000000	2	3820.4399	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S24_2840	30	100.00000000000000000	9	3338.1001	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S24_4258	33	100.00000000000000000	3	6267.6899	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S32_1268	20	98.18000000000000000	11	1963.6	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S32_3522	48	100.00000000000000000	4	8209.4404	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10324	S700_2824	34	100.00000000000000000	5	4248.2998	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181	2004-11-05	4	11	2004
10325	S10_4757	47	64.93000000000000000	6	3051.71	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S12_1108	42	64.00000000000000000	8	2688	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S12_3891	24	100.00000000000000000	1	2583.6001	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S18_3140	24	69.12000000000000000	9	1658.88	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S24_4048	44	100.00000000000000000	5	5325.7598	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S32_2509	38	100.00000000000000000	3	8844.1201	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S32_3207	28	100.00000000000000000	2	5377.3999	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S50_1392	38	100.00000000000000000	4	5190.4199	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10325	S50_1514	44	100.00000000000000000	7	5932.96	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121	2004-11-05	4	11	2004
10326	S18_3259	32	100.00000000000000000	6	3807.6799	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10326	S18_4522	50	86.01000000000000000	5	4300.5	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10326	S24_2011	41	100.00000000000000000	4	4333.29	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10326	S24_3151	41	85.85000000000000000	3	3519.8501	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10326	S24_3816	20	92.25000000000000000	2	1845	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10326	S700_1138	39	60.00000000000000000	1	2340	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144	2004-11-09	4	11	2004
10327	S18_1662	25	100.00000000000000000	6	2804.75	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S18_2581	45	100.00000000000000000	8	4781.7002	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S18_3029	25	45.86000000000000000	5	1146.5	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S700_1938	20	100.00000000000000000	7	3469.2	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S700_2610	21	96.31000000000000000	1	2022.51	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S700_3505	43	80.00000000000000000	2	3440	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10424	S18_4668	26	59.87000000000000000	4	1556.62	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10327	S700_3962	37	86.61000000000000000	3	3204.5701	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10327	S72_3212	37	86.74000000000000000	4	3209.3799	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145	2004-11-10	4	11	2004
10328	S18_3856	34	100.00000000000000000	6	3815.48	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S24_1785	47	87.54000000000000000	14	4114.3799	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S24_2841	48	58.92000000000000000	1	2828.1599	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S24_3420	20	72.98000000000000000	2	1459.6	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S24_3949	35	76.43000000000000000	3	2675.05	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S24_4278	43	60.86000000000000000	4	2616.98	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S32_4289	24	81.17000000000000000	5	1948.08	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S50_1341	34	51.93000000000000000	7	1765.62	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S700_1691	27	100.00000000000000000	8	2762.1001	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S700_2047	41	100.00000000000000000	9	4156.5801	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10332	S18_2957	26	100.00000000000000000	17	2979.0801	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10328	S700_2466	37	100.00000000000000000	10	4021.53	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S700_2834	33	100.00000000000000000	11	4072.2	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S700_3167	33	64.00000000000000000	13	2112	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10328	S700_4002	39	85.87000000000000000	12	3348.9299	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278	2004-11-12	4	11	2004
10329	S10_1678	42	100.00000000000000000	1	4396.1401	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S10_2016	20	100.00000000000000000	2	3176	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S10_4698	26	100.00000000000000000	3	5868.2002	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S12_1099	41	71.47000000000000000	5	2930.27	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S12_2823	24	100.00000000000000000	6	3542.6399	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S12_3380	46	83.63000000000000000	13	3846.98	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S12_3990	33	100.00000000000000000	14	3607.5601	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S12_4675	39	64.74000000000000000	15	2524.8601	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S18_1889	29	100.00000000000000000	9	2954.8101	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S18_2625	38	100.00000000000000000	12	5266.04	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S18_3278	38	59.10000000000000000	10	2245.8	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S24_1578	30	87.78000000000000000	7	2633.3999	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S24_2000	37	94.43000000000000000	4	3493.9099	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S32_1374	45	63.91000000000000000	11	2875.95	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10329	S72_1253	44	86.13000000000000000	8	3789.72	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131	2004-11-15	4	11	2004
10330	S18_3482	37	100.00000000000000000	3	4405.2202	2004-11-16 00:00:00	2004-11-25 00:00:00	2004-11-21 00:00:00	Shipped	\N	385	2004-11-16	4	11	2004
10330	S18_3782	29	69.63000000000000000	2	2019.27	2004-11-16 00:00:00	2004-11-25 00:00:00	2004-11-21 00:00:00	Shipped	\N	385	2004-11-16	4	11	2004
10330	S18_4721	50	100.00000000000000000	4	6101	2004-11-16 00:00:00	2004-11-25 00:00:00	2004-11-21 00:00:00	Shipped	\N	385	2004-11-16	4	11	2004
10330	S24_2360	42	81.03000000000000000	1	3403.26	2004-11-16 00:00:00	2004-11-25 00:00:00	2004-11-21 00:00:00	Shipped	\N	385	2004-11-16	4	11	2004
10331	S18_1129	46	100.00000000000000000	6	6434.02	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_1589	44	100.00000000000000000	14	4849.2402	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_1749	44	74.04000000000000000	7	3257.76	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_1984	30	32.47000000000000000	8	974.09998	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_2870	26	64.90000000000000000	10	1687.4	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_3232	27	100.00000000000000000	11	4170.6899	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S18_3685	26	67.91000000000000000	12	1765.66	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S24_2972	27	42.24000000000000000	13	1140.48	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S24_3371	25	100.00000000000000000	9	3078.5	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S24_3856	21	100.00000000000000000	1	3135.9299	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S24_4620	41	100.00000000000000000	2	5715.3999	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S32_2206	28	100.00000000000000000	3	4102.5601	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S32_4485	32	100.00000000000000000	4	5026.5601	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10331	S50_4713	20	100.00000000000000000	5	3657.8	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486	2004-11-17	4	11	2004
10332	S18_1342	46	95.13000000000000000	15	4375.98	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_1367	27	89.89000000000000000	16	2427.03	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_2248	38	84.25000000000000000	9	3201.5	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_2325	35	64.69000000000000000	8	2264.1499	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_2795	24	52.67000000000000000	1	1264.08	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_3136	40	39.80000000000000000	18	1592	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_4409	50	100.00000000000000000	2	7310	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S18_4933	21	100.00000000000000000	3	3472.98	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_1046	23	56.84000000000000000	4	1307.3199	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_1628	20	87.96000000000000000	5	1759.2	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_1937	45	81.91000000000000000	6	3685.95	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_2022	26	85.52000000000000000	10	2223.52	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_2766	39	86.72000000000000000	7	3382.0801	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_2887	44	42.26000000000000000	11	1859.4399	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_3191	45	34.19000000000000000	12	1538.55	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_3432	31	37.18000000000000000	13	1152.58	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10332	S24_3969	41	77.24000000000000000	14	3166.8401	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187	2004-11-17	4	11	2004
10333	S10_1949	26	100.00000000000000000	3	3003	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S12_1666	33	99.21000000000000000	6	3273.9299	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S18_1097	29	40.25000000000000000	7	1167.25	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S18_2949	31	90.17000000000000000	5	2795.27	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S18_3320	46	100.00000000000000000	2	11336.7	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S18_4668	24	79.86000000000000000	8	1916.64	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S24_4258	39	100.00000000000000000	1	4424.1602	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10333	S32_3522	33	73.69000000000000000	4	2431.77	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129	2004-11-18	4	11	2004
10334	S10_4962	26	100.00000000000000000	2	3188.1201	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10334	S18_2319	46	100.00000000000000000	6	5814.8599	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10334	S18_2432	34	61.38000000000000000	1	2086.9199	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10334	S18_3232	20	100.00000000000000000	3	2878.8	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10334	S18_4600	49	100.00000000000000000	4	6763.4702	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10334	S24_2300	42	100.00000000000000000	5	5528.04	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144	2004-11-19	4	11	2004
10335	S24_2840	33	37.13000000000000000	2	1225.29	2004-11-19 00:00:00	2004-11-29 00:00:00	2004-11-23 00:00:00	Shipped	\N	124	2004-11-19	4	11	2004
10335	S32_1268	44	100.00000000000000000	1	4746.2798	2004-11-19 00:00:00	2004-11-29 00:00:00	2004-11-23 00:00:00	Shipped	\N	124	2004-11-19	4	11	2004
10335	S32_2509	40	60.60000000000000000	3	2424	2004-11-19 00:00:00	2004-11-29 00:00:00	2004-11-23 00:00:00	Shipped	\N	124	2004-11-19	4	11	2004
10336	S12_1108	33	57.22000000000000000	10	1888.26	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S12_3148	33	100.00000000000000000	11	4059.3301	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S12_3891	49	63.38000000000000000	1	3105.6201	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S12_4473	38	100.00000000000000000	3	6372.6001	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S18_2238	49	100.00000000000000000	6	7460.7402	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S18_3140	48	100.00000000000000000	12	5778.2402	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S18_3259	21	100.00000000000000000	7	2230.4099	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S24_1444	45	100.00000000000000000	4	5972.3999	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S24_4048	31	100.00000000000000000	5	4618.6899	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S32_3207	31	84.71000000000000000	9	2626.01	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S50_1392	23	100.00000000000000000	8	3141.5701	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10336	S700_2824	46	100.00000000000000000	2	9558.7998	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172	2004-11-20	4	11	2004
10337	S10_4757	25	48.05000000000000000	8	1201.25	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S18_4027	36	100.00000000000000000	3	5679.3599	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S18_4522	29	100.00000000000000000	2	4498.1899	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S24_2011	29	71.97000000000000000	4	2087.1299	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S50_1514	21	100.00000000000000000	6	2296.77	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S700_1938	36	70.30000000000000000	9	2530.8	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S700_3505	31	89.38000000000000000	1	2770.78	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S700_3962	36	71.89000000000000000	7	2588.04	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10337	S72_3212	42	97.16000000000000000	5	4080.72	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424	2004-11-21	4	11	2004
10338	S18_1662	41	100.00000000000000000	1	5624.79	2004-11-22 00:00:00	2004-12-02 00:00:00	2004-11-27 00:00:00	Shipped	\N	381	2004-11-22	4	11	2004
10338	S18_3029	28	82.58000000000000000	3	2312.24	2004-11-22 00:00:00	2004-12-02 00:00:00	2004-11-27 00:00:00	Shipped	\N	381	2004-11-22	4	11	2004
10338	S18_3856	45	100.00000000000000000	2	5526.4502	2004-11-22 00:00:00	2004-12-02 00:00:00	2004-11-27 00:00:00	Shipped	\N	381	2004-11-22	4	11	2004
10339	S10_2016	40	68.92000000000000000	4	2756.8	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S10_4698	39	76.67000000000000000	3	2990.1299	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S18_2581	27	100.00000000000000000	2	2810.7	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S18_2625	30	62.16000000000000000	1	1864.8	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_1578	27	84.39000000000000000	10	2278.53	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_1785	21	50.65000000000000000	7	1063.65	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_2841	55	100.00000000000000000	12	6214.4502	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_3151	55	100.00000000000000000	13	10758	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_3420	29	99.69000000000000000	14	2891.01	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_3816	42	59.36000000000000000	16	2493.1201	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S24_3949	45	96.92000000000000000	11	4361.3999	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S700_1138	22	100.00000000000000000	5	2816.4399	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S700_2047	55	71.25000000000000000	15	3918.75	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S700_2610	50	74.35000000000000000	9	3717.5	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S700_4002	50	57.86000000000000000	8	2893	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10339	S72_1253	27	76.31000000000000000	6	2060.3701	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398	2004-11-23	4	11	2004
10340	S24_2000	55	79.98000000000000000	8	4398.8999	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S24_4278	40	84.77000000000000000	1	3390.8	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S32_1374	55	100.00000000000000000	2	6482.8501	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S32_4289	39	59.16000000000000000	3	2307.24	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S50_1341	40	50.62000000000000000	4	2024.8	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S700_1691	30	88.60000000000000000	5	2658	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S700_2466	55	87.75000000000000000	7	4826.25	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10340	S700_2834	29	100.00000000000000000	6	4094.51	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216	2004-11-24	4	11	2004
10341	S10_1678	41	100.00000000000000000	9	7737.9302	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S12_1099	45	79.65000000000000000	2	3584.25	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S12_2823	55	100.00000000000000000	8	8118.5498	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S12_3380	44	95.93000000000000000	1	4220.9199	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S12_3990	36	93.56000000000000000	10	3368.1599	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S12_4675	55	75.20000000000000000	7	4136	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S24_2360	32	100.00000000000000000	6	3307.2	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S32_4485	31	71.02000000000000000	4	2201.6201	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S50_4713	38	100.00000000000000000	3	4682.3599	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10341	S700_3167	34	100.00000000000000000	5	3644.1201	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382	2004-11-24	4	11	2004
10342	S18_1129	40	100.00000000000000000	2	6454.3999	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_1889	55	65.45000000000000000	1	3599.75	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_1984	22	100.00000000000000000	3	3160.74	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_3232	30	100.00000000000000000	4	5029.5	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_3278	25	66.74000000000000000	5	1668.5	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_3482	55	100.00000000000000000	7	6548.2998	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_3782	26	55.95000000000000000	8	1454.7	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S18_4721	38	100.00000000000000000	11	6276.46	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S24_2972	39	40.40000000000000000	9	1575.6	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S24_3371	48	62.45000000000000000	10	2997.6001	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10342	S24_3856	42	100.00000000000000000	6	5013.54	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114	2004-11-24	4	11	2004
10343	S18_1589	36	100.00000000000000000	4	5848.9199	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10343	S18_2870	25	52.32000000000000000	3	1308	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10343	S18_3685	44	84.88000000000000000	2	3734.72	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10343	S24_1628	27	36.21000000000000000	6	977.66998	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10343	S24_4620	30	100.00000000000000000	1	3098.7	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10343	S32_2206	29	100.00000000000000000	5	3713.1599	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353	2004-11-24	4	11	2004
10344	S18_1749	45	100.00000000000000000	1	7650	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S18_2248	40	56.91000000000000000	2	2276.3999	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S18_2325	30	100.00000000000000000	3	3928.2	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S18_4409	21	100.00000000000000000	4	2203.1101	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S18_4933	26	63.43000000000000000	5	1649.1801	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S24_1046	29	59.53000000000000000	7	1726.37	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10344	S24_1937	20	35.18000000000000000	6	703.59998	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350	2004-11-25	4	11	2004
10345	S24_2022	43	53.76000000000000000	1	2311.6799	2004-11-25 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	103	2004-11-25	4	11	2004
10346	S18_1342	42	36.11000000000000000	3	1516.62	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10346	S24_2766	25	100.00000000000000000	1	2876.75	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10346	S24_2887	24	87.24000000000000000	5	2093.76	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10346	S24_3191	24	100.00000000000000000	2	3325.9199	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10346	S24_3432	26	95.88000000000000000	6	2492.8799	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10346	S24_3969	22	97.44000000000000000	4	2143.6799	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112	2004-11-29	4	11	2004
10347	S10_1949	30	100.00000000000000000	1	3944.7	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S10_4962	27	100.00000000000000000	2	4428	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S12_1666	29	100.00000000000000000	3	3586.4299	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_1097	42	49.60000000000000000	5	2083.2	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_1367	21	58.95000000000000000	7	1237.95	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_2432	50	100.00000000000000000	8	6834.5	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_2795	21	100.00000000000000000	6	4815.2998	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_2949	48	100.00000000000000000	9	4814.3999	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_2957	34	64.96000000000000000	10	2208.6399	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_3136	45	100.00000000000000000	11	4948.2002	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_3320	26	100.00000000000000000	12	2656.9399	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10347	S18_4600	45	100.00000000000000000	4	5884.6499	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114	2004-11-29	4	11	2004
10348	S12_1108	48	52.36000000000000000	8	2513.28	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S12_3148	47	100.00000000000000000	4	4801.52	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S18_4668	29	100.00000000000000000	6	7110.7998	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S24_2300	37	100.00000000000000000	1	5981.4199	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S24_4258	39	50.31000000000000000	2	1962.09	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S32_1268	42	100.00000000000000000	3	6386.9399	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S32_3522	31	100.00000000000000000	5	3139.99	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10348	S700_2824	32	82.83000000000000000	7	2650.5601	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458	2004-11-01	4	11	2004
10349	S12_3891	26	100.00000000000000000	10	4408.5601	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S12_4473	48	100.00000000000000000	9	5232.96	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S18_2238	38	100.00000000000000000	8	6719.54	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S18_2319	38	100.00000000000000000	7	5223.48	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S18_3232	48	100.00000000000000000	6	7396.7998	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S18_4027	34	100.00000000000000000	5	4394.8398	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S24_1444	48	47.40000000000000000	4	2275.2	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S24_2840	36	37.13000000000000000	3	1336.6801	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S24_4048	23	100.00000000000000000	2	3182.97	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10349	S32_2509	33	46.53000000000000000	1	1535.49	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151	2004-12-01	4	12	2004
10350	S10_4757	26	75.47000000000000000	5	1962.22	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S18_3029	43	64.97000000000000000	6	2793.71	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S18_3140	44	100.00000000000000000	1	5191.1201	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S18_3259	41	93.04000000000000000	2	3814.6399	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S18_4522	30	100.00000000000000000	3	3023.1001	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S24_2011	34	50.33000000000000000	7	1711.22	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S24_3151	30	100.00000000000000000	9	3021	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S24_3816	25	60.34000000000000000	10	1508.5	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S32_3207	27	100.00000000000000000	14	4406.3999	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S50_1392	31	71.40000000000000000	8	2213.3999	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S50_1514	44	100.00000000000000000	17	6490.8799	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S700_1138	46	76.67000000000000000	11	3526.8201	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S700_1938	28	100.00000000000000000	4	2924.3201	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S700_2610	29	75.35000000000000000	12	2185.1499	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S700_3505	31	77.34000000000000000	13	2397.54	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S700_3962	25	100.00000000000000000	16	2854.75	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10350	S72_3212	20	100.00000000000000000	15	2244.3999	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141	2004-12-02	4	12	2004
10351	S18_1662	39	99.52000000000000000	1	3881.28	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324	2004-12-03	4	12	2004
10351	S18_3856	20	100.00000000000000000	2	3374.6001	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324	2004-12-03	4	12	2004
10351	S24_2841	25	74.68000000000000000	5	1867	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324	2004-12-03	4	12	2004
10351	S24_3420	38	68.38000000000000000	4	2598.4399	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324	2004-12-03	4	12	2004
10351	S24_3949	34	59.37000000000000000	3	2018.58	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324	2004-12-03	4	12	2004
10352	S700_2047	23	100.00000000000000000	3	2352.6699	2004-12-03 00:00:00	2004-12-12 00:00:00	2004-12-09 00:00:00	Shipped	\N	198	2004-12-03	4	12	2004
10352	S700_2466	49	100.00000000000000000	2	4935.2798	2004-12-03 00:00:00	2004-12-12 00:00:00	2004-12-09 00:00:00	Shipped	\N	198	2004-12-03	4	12	2004
10352	S700_4002	22	75.51000000000000000	1	1661.22	2004-12-03 00:00:00	2004-12-12 00:00:00	2004-12-09 00:00:00	Shipped	\N	198	2004-12-03	4	12	2004
10352	S72_1253	49	52.64000000000000000	4	2579.3601	2004-12-03 00:00:00	2004-12-12 00:00:00	2004-12-09 00:00:00	Shipped	\N	198	2004-12-03	4	12	2004
10353	S18_2581	27	100.00000000000000000	1	3515.6699	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S24_1785	28	71.73000000000000000	2	2008.4399	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S24_4278	35	89.90000000000000000	3	3146.5	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S32_1374	46	81.17000000000000000	5	3733.8201	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S32_4289	40	44.51000000000000000	7	1780.4	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S50_1341	40	82.21000000000000000	8	3288.3999	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S700_1691	39	100.00000000000000000	9	5043.8701	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S700_2834	48	68.80000000000000000	4	3302.3999	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10353	S700_3167	43	81.95000000000000000	6	3523.8501	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447	2004-12-04	4	12	2004
10354	S10_1678	42	86.13000000000000000	6	3617.46	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S10_2016	20	100.00000000000000000	2	2093.3999	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S10_4698	42	100.00000000000000000	3	8947.2598	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S12_1099	31	93.28000000000000000	9	2891.6799	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S12_2823	35	100.00000000000000000	4	6401.5	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S12_3380	29	73.15000000000000000	11	2121.3501	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S12_3990	23	50.88000000000000000	12	1170.24	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S12_4675	28	86.84000000000000000	13	2431.52	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S18_1889	21	100.00000000000000000	8	2319.45	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S18_2625	28	100.00000000000000000	10	4639.04	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S18_3278	36	82.26000000000000000	7	2961.3601	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S24_1578	21	100.00000000000000000	5	2392.3201	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10354	S24_2000	28	69.43000000000000000	1	1944.04	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323	2004-12-04	4	12	2004
10355	S18_3482	23	100.00000000000000000	7	3177.9099	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S18_3782	31	53.47000000000000000	1	1657.5699	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S18_4721	25	100.00000000000000000	2	4203.5	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S24_2360	41	70.65000000000000000	3	2896.6499	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S24_2972	36	38.52000000000000000	4	1386.72	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S24_3371	44	62.45000000000000000	6	2747.8	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S24_3856	32	100.00000000000000000	8	5302.7202	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S24_4620	28	95.39000000000000000	9	2670.9199	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S32_2206	38	39.83000000000000000	10	1513.54	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10355	S32_4485	40	100.00000000000000000	5	4326.7998	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141	2004-12-07	4	12	2004
10356	S18_1129	43	97.60000000000000000	8	4196.7998	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S18_1342	50	50.18000000000000000	9	2509	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S18_1367	22	72.41000000000000000	6	1593.02	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S18_1984	27	64.69000000000000000	2	1746.63	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S18_2325	29	100.00000000000000000	3	3630.22	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S18_2795	30	100.00000000000000000	1	4462.2002	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S24_1937	48	100.00000000000000000	5	9720	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S24_2022	26	31.86000000000000000	7	828.35999	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10356	S50_4713	26	100.00000000000000000	4	3937.7	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250	2004-12-09	4	12	2004
10357	S10_1949	32	100.00000000000000000	10	5691.8398	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S10_4962	43	100.00000000000000000	9	5780.9199	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S12_1666	49	100.00000000000000000	8	5960.3599	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_1097	39	98.00000000000000000	1	3822	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_2432	41	61.99000000000000000	7	2541.5901	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_2949	41	87.13000000000000000	6	3572.3301	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_2957	49	70.58000000000000000	5	3458.4199	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_3136	44	100.00000000000000000	4	5160.7598	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_3320	25	100.00000000000000000	3	2604.25	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10357	S18_4600	28	100.00000000000000000	2	3559.6399	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124	2004-12-10	4	12	2004
10358	S12_3148	49	55.34000000000000000	5	2711.6599	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S12_4473	42	64.16000000000000000	9	2694.72	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S18_2238	20	100.00000000000000000	10	2428	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S18_2319	20	36.42000000000000000	11	728.40002	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S18_3232	32	93.49000000000000000	12	2991.6799	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S18_4027	25	100.00000000000000000	13	2528.25	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S18_4668	30	100.00000000000000000	8	5302.7998	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S24_1444	44	60.76000000000000000	14	2673.4399	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S24_2300	41	100.00000000000000000	7	5684.6499	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S24_2840	36	82.94000000000000000	4	2985.8401	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S24_4258	41	100.00000000000000000	6	6847	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S32_1268	41	100.00000000000000000	1	4428	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S32_3522	36	100.00000000000000000	2	5669.6401	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10358	S700_2824	27	100.00000000000000000	3	3761.3701	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141	2004-12-10	4	12	2004
10359	S10_4757	48	54.68000000000000000	6	2624.6399	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S12_1108	42	100.00000000000000000	8	4764.48	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S12_3891	49	62.09000000000000000	5	3042.4099	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S24_4048	22	100.00000000000000000	7	2603.04	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S32_2509	36	100.00000000000000000	3	6358.6802	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S32_3207	22	100.00000000000000000	1	4301.2202	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S50_1392	46	100.00000000000000000	2	4896.7002	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10359	S50_1514	25	64.93000000000000000	4	1623.25	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353	2004-12-15	4	12	2004
10360	S18_1662	50	58.67000000000000000	12	2933.5	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_2581	41	87.48000000000000000	13	3586.6799	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_3029	46	77.34000000000000000	14	3557.6399	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_3140	29	100.00000000000000000	8	5076.1602	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_3259	29	100.00000000000000000	18	2940.02	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_3856	40	87.15000000000000000	15	3486	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S18_4522	40	86.02000000000000000	1	3440.8	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S24_1785	22	100.00000000000000000	17	2534.3999	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S24_2011	31	100.00000000000000000	2	3683.73	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S24_2841	49	56.78000000000000000	16	2782.22	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S24_3151	36	100.00000000000000000	3	4102.2002	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S24_3816	22	100.00000000000000000	4	2445.52	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S700_1138	32	100.00000000000000000	5	3230.0801	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S700_1938	26	97.38000000000000000	6	2531.8799	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S700_2610	30	100.00000000000000000	7	3760.5	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S700_3505	35	65.77000000000000000	9	2301.95	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S700_3962	31	100.00000000000000000	10	3210.3601	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10360	S72_3212	31	96.44000000000000000	11	2989.6399	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496	2004-12-16	4	12	2004
10361	S10_1678	20	72.55000000000000000	13	1451	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S10_2016	26	51.15000000000000000	8	1329.9	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S24_3420	34	100.00000000000000000	6	3871.9199	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S24_3949	26	100.00000000000000000	7	3710.98	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S24_4278	25	62.46000000000000000	1	1561.5	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S32_4289	49	72.33000000000000000	2	3544.1699	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S50_1341	33	82.59000000000000000	3	2725.47	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_1691	20	60.54000000000000000	4	1210.8	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_2047	24	45.39000000000000000	14	1089.36	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_2466	26	100.00000000000000000	9	2754.7	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_2834	44	72.42000000000000000	5	3186.48	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_3167	44	100.00000000000000000	10	5001.9199	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S700_4002	35	100.00000000000000000	11	4277.3501	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10361	S72_1253	23	95.20000000000000000	12	2189.6001	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282	2004-12-17	4	12	2004
10362	S10_4698	22	100.00000000000000000	4	3664.1001	2005-01-05 00:00:00	2005-01-16 00:00:00	2005-01-10 00:00:00	Shipped	\N	161	2005-01-05	1	1	2005
10362	S12_2823	22	100.00000000000000000	1	3877.0601	2005-01-05 00:00:00	2005-01-16 00:00:00	2005-01-10 00:00:00	Shipped	\N	161	2005-01-05	1	1	2005
10362	S18_2625	23	49.67000000000000000	3	1142.41	2005-01-05 00:00:00	2005-01-16 00:00:00	2005-01-10 00:00:00	Shipped	\N	161	2005-01-05	1	1	2005
10362	S24_1578	50	96.92000000000000000	2	4846	2005-01-05 00:00:00	2005-01-16 00:00:00	2005-01-10 00:00:00	Shipped	\N	161	2005-01-05	1	1	2005
10363	S12_1099	33	85.39000000000000000	3	2817.8701	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S12_3380	34	96.73000000000000000	4	3288.8201	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S12_3990	34	81.62000000000000000	5	2775.0801	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S12_4675	46	88.45000000000000000	6	4068.7	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S18_1889	22	100.00000000000000000	7	3686.54	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S18_3278	46	60.30000000000000000	10	2773.8	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S18_3482	24	100.00000000000000000	11	4142.6401	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S18_3782	32	89.12000000000000000	12	2851.8401	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S18_4721	28	58.18000000000000000	13	1629.04	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S24_2000	21	100.00000000000000000	8	3595.6201	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S24_2360	43	61.23000000000000000	14	2632.8899	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S24_3371	21	100.00000000000000000	15	2447.76	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S24_3856	31	94.58000000000000000	1	2931.98	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S24_4620	43	100.00000000000000000	9	5154.4102	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10363	S32_1374	50	100.00000000000000000	2	6576.5	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334	2005-01-06	1	1	2005
10364	S32_2206	48	48.28000000000000000	1	2317.4399	2005-01-06 00:00:00	2005-01-17 00:00:00	2005-01-09 00:00:00	Shipped	\N	350	2005-01-06	1	1	2005
10365	S18_1129	30	87.06000000000000000	1	2611.8	2005-01-07 00:00:00	2005-01-18 00:00:00	2005-01-11 00:00:00	Shipped	\N	320	2005-01-07	1	1	2005
10365	S32_4485	22	100.00000000000000000	3	3425.1799	2005-01-07 00:00:00	2005-01-18 00:00:00	2005-01-11 00:00:00	Shipped	\N	320	2005-01-07	1	1	2005
10365	S50_4713	44	100.00000000000000000	2	4984.3198	2005-01-07 00:00:00	2005-01-18 00:00:00	2005-01-11 00:00:00	Shipped	\N	320	2005-01-07	1	1	2005
10366	S18_1984	34	100.00000000000000000	3	4207.8398	2005-01-10 00:00:00	2005-01-19 00:00:00	2005-01-12 00:00:00	Shipped	\N	381	2005-01-10	1	1	2005
10366	S18_2870	49	100.00000000000000000	2	6144.6001	2005-01-10 00:00:00	2005-01-19 00:00:00	2005-01-12 00:00:00	Shipped	\N	381	2005-01-10	1	1	2005
10366	S18_3232	34	100.00000000000000000	1	6275.7202	2005-01-10 00:00:00	2005-01-19 00:00:00	2005-01-12 00:00:00	Shipped	\N	381	2005-01-10	1	1	2005
10367	S18_1589	49	56.30000000000000000	1	2758.7	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10371	S32_2509	20	66.47000000000000000	2	1329.4	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10367	S18_1749	37	100.00000000000000000	3	4703.8101	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_2248	45	100.00000000000000000	4	8884.7998	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_2325	27	100.00000000000000000	5	4196.0698	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_2795	32	94.79000000000000000	7	3033.28	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_3685	46	100.00000000000000000	6	4808.3799	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_4409	43	62.72000000000000000	8	2696.96	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S18_4933	44	85.25000000000000000	9	3751	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S24_1046	21	60.37000000000000000	10	1267.77	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S24_1628	38	38.50000000000000000	11	1463	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S24_1937	23	36.29000000000000000	13	834.66998	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S24_2022	28	30.59000000000000000	12	856.52002	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10367	S24_2972	36	100.00000000000000000	2	5018.3999	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205	2005-01-12	1	1	2005
10368	S24_2766	40	100.00000000000000000	2	4107.2002	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124	2005-01-19	1	1	2005
10368	S24_2887	31	100.00000000000000000	5	4223.1299	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124	2005-01-19	1	1	2005
10368	S24_3191	46	79.62000000000000000	1	3662.52	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124	2005-01-19	1	1	2005
10368	S24_3432	20	99.58000000000000000	4	1991.6	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124	2005-01-19	1	1	2005
10368	S24_3969	46	37.34000000000000000	3	1717.64	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124	2005-01-19	1	1	2005
10369	S10_1949	41	100.00000000000000000	2	4514.9199	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_1342	44	100.00000000000000000	8	9240.4404	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_1367	32	98.63000000000000000	7	3156.1599	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_2949	42	100.00000000000000000	1	4581.3599	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_2957	28	44.21000000000000000	6	1237.88	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_3136	21	94.22000000000000000	5	1978.62	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S18_3320	45	73.08000000000000000	4	3288.6001	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10369	S24_4258	40	86.92000000000000000	3	3476.8	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379	2005-01-20	1	1	2005
10370	S10_4962	35	65.63000000000000000	4	2297.05	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S12_1666	49	100.00000000000000000	8	8470.1396	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_1097	27	100.00000000000000000	1	3911.49	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_2319	22	100.00000000000000000	5	3949	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_2432	22	96.86000000000000000	7	2130.9199	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_3232	27	56.85000000000000000	9	1534.95	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_4600	29	57.53000000000000000	6	1668.37	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S18_4668	20	100.00000000000000000	2	2730	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10370	S32_3522	25	100.00000000000000000	3	3160.25	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276	2005-01-20	1	1	2005
10371	S12_1108	32	100.00000000000000000	6	3560.6399	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S12_4473	49	35.71000000000000000	4	1749.79	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S18_2238	25	100.00000000000000000	7	2602.25	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S24_1444	25	97.27000000000000000	12	2431.75	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S24_2300	20	100.00000000000000000	5	3449.3999	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S24_2840	45	100.00000000000000000	8	5545.7998	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S24_4048	28	50.32000000000000000	9	1408.96	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S32_1268	26	100.00000000000000000	1	4044.04	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S32_3207	30	99.55000000000000000	11	2986.5	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S50_1392	48	56.55000000000000000	10	2714.3999	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10371	S700_2824	34	100.00000000000000000	3	4301.3398	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124	2005-01-23	1	1	2005
10372	S12_3148	40	100.00000000000000000	4	5862	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S12_3891	34	100.00000000000000000	1	5941.5	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S18_3140	28	100.00000000000000000	3	3862.8799	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S18_3259	25	84.71000000000000000	5	2117.75	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S18_4027	48	100.00000000000000000	6	7031.52	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S18_4522	41	86.89000000000000000	7	3562.49	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S24_2011	37	100.00000000000000000	8	3910.53	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S50_1514	24	58.58000000000000000	9	1405.92	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10372	S700_1938	44	100.00000000000000000	2	4496.7998	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398	2005-01-26	1	1	2005
10373	S10_4757	39	100.00000000000000000	3	4046.25	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S18_1662	28	57.55000000000000000	4	1611.4	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S18_3029	22	86.74000000000000000	5	1908.28	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S18_3856	50	60.49000000000000000	6	3024.5	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S24_2841	38	70.44000000000000000	7	2676.72	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S24_3151	33	57.32000000000000000	12	1891.5601	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S24_3420	46	66.00000000000000000	11	3036	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S24_3816	23	100.00000000000000000	10	2394.3	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S24_3949	39	73.00000000000000000	13	2847	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_1138	44	100.00000000000000000	14	4627.9199	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_2047	32	84.41000000000000000	15	2701.1201	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_2610	41	70.33000000000000000	16	2883.53	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_3505	34	96.34000000000000000	2	3275.5601	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_3962	37	100.00000000000000000	8	4025.6001	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S700_4002	45	55.62000000000000000	17	2502.8999	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S72_1253	25	64.97000000000000000	9	1624.25	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10373	S72_3212	29	100.00000000000000000	1	3978.51	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311	2005-01-31	1	1	2005
10374	S10_2016	39	100.00000000000000000	5	5288.0098	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10374	S10_4698	22	100.00000000000000000	1	3834.3799	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10374	S18_2581	42	69.27000000000000000	2	2909.3401	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10374	S18_2625	22	53.30000000000000000	4	1172.6	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10374	S24_1578	38	100.00000000000000000	6	4197.1001	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10374	S24_1785	46	94.10000000000000000	3	4328.6001	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333	2005-02-02	1	2	2005
10375	S10_1678	21	34.91000000000000000	12	733.10999	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S12_1099	45	76.00000000000000000	7	3420	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S12_2823	49	78.92000000000000000	13	3867.0801	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S24_2000	23	100.00000000000000000	9	2443.29	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S24_2360	20	100.00000000000000000	14	2046	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S24_4278	43	100.00000000000000000	2	10039.6	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S32_1374	37	100.00000000000000000	3	6353.27	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S32_4289	44	82.26000000000000000	4	3619.4399	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S32_4485	41	100.00000000000000000	15	4701.8799	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S50_1341	49	65.80000000000000000	5	3224.2	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S50_4713	49	100.00000000000000000	8	5406.6602	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S700_1691	37	81.87000000000000000	6	3029.1899	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S700_2466	33	100.00000000000000000	1	3856.71	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S700_2834	25	66.73000000000000000	10	1668.25	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10375	S700_3167	44	100.00000000000000000	11	5208.7202	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119	2005-02-03	1	2	2005
10376	S12_3380	35	100.00000000000000000	1	3987.2	2005-02-08 00:00:00	2005-02-18 00:00:00	2005-02-13 00:00:00	Shipped	\N	219	2005-02-08	1	2	2005
10377	S12_3990	24	67.83000000000000000	5	1627.92	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10377	S12_4675	50	100.00000000000000000	1	5182	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10377	S18_1129	35	100.00000000000000000	2	5895.0498	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10377	S18_1889	31	67.76000000000000000	4	2100.5601	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10377	S18_1984	36	100.00000000000000000	6	4352.7598	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10377	S18_3232	39	100.00000000000000000	3	7264.5298	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186	2005-02-09	1	2	2005
10378	S18_1589	34	42.64000000000000000	5	1449.76	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S18_3278	22	100.00000000000000000	4	2464	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S18_3482	43	96.49000000000000000	10	4149.0698	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S18_3782	28	100.00000000000000000	9	4609.6401	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S18_4721	49	67.14000000000000000	8	3289.8601	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S24_2972	41	100.00000000000000000	7	5856.8501	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S24_3371	46	41.54000000000000000	6	1910.84	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S24_3856	33	53.27000000000000000	3	1757.91	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S24_4620	41	100.00000000000000000	2	4894.1699	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10378	S32_2206	40	82.46000000000000000	1	3298.3999	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10379	S18_1749	39	100.00000000000000000	2	5399.5498	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10379	S18_2248	27	49.30000000000000000	1	1331.1	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10379	S18_2870	29	100.00000000000000000	5	5127.2002	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10379	S18_3685	32	70.83000000000000000	4	2266.5601	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10379	S24_1628	32	100.00000000000000000	3	3970.5601	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141	2005-02-10	1	2	2005
10380	S18_1342	27	93.16000000000000000	13	2515.3201	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S18_2325	40	100.00000000000000000	10	4931.6001	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S18_2795	21	47.18000000000000000	8	990.78003	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S18_4409	32	100.00000000000000000	1	3376.6399	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S18_4933	24	100.00000000000000000	2	4536	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_1046	34	100.00000000000000000	3	3441.8201	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_1937	32	70.56000000000000000	4	2257.9199	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_2022	27	68.35000000000000000	5	1845.45	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_2766	36	37.50000000000000000	6	1350	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_2887	44	36.29000000000000000	7	1596.76	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_3191	44	79.06000000000000000	9	3478.6399	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_3432	34	100.00000000000000000	11	3953.1799	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10380	S24_3969	43	95.03000000000000000	12	4086.29	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141	2005-02-16	1	2	2005
10381	S10_1949	36	100.00000000000000000	3	8254.7998	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S10_4962	37	100.00000000000000000	6	6231.54	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S12_1666	20	100.00000000000000000	1	2952	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_1097	48	98.00000000000000000	2	4704	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_1367	25	52.83000000000000000	9	1320.75	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_2432	35	48.62000000000000000	7	1701.7	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_2949	41	100.00000000000000000	8	4319.7598	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_2957	40	68.08000000000000000	4	2723.2	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10381	S18_3136	35	100.00000000000000000	5	4288.2002	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321	2005-02-17	1	2	2005
10382	S12_1108	34	100.00000000000000000	10	3823.6399	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S12_3148	37	100.00000000000000000	11	4071.8501	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S12_3891	34	95.35000000000000000	12	3241.8999	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S12_4473	32	66.58000000000000000	13	2130.5601	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S18_2238	25	88.00000000000000000	5	2200	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S18_3320	50	100.00000000000000000	7	8935.5	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S18_4600	39	100.00000000000000000	1	4890.6001	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S18_4668	39	100.00000000000000000	2	7827.2998	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S24_2300	20	100.00000000000000000	3	2654.3999	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S24_4258	33	100.00000000000000000	4	4592.6099	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S32_1268	26	100.00000000000000000	6	2708.4199	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S32_3522	48	100.00000000000000000	8	6799.6802	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10382	S700_2824	34	54.84000000000000000	9	1864.5601	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124	2005-02-17	1	2	2005
10383	S18_2319	27	100.00000000000000000	11	3843.99	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S18_3140	24	61.52000000000000000	9	1476.48	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S18_3232	47	100.00000000000000000	6	6869.0498	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S18_3259	26	100.00000000000000000	12	3340.48	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S18_4027	38	100.00000000000000000	1	5340.8999	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S18_4522	28	58.58000000000000000	7	1640.24	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S24_1444	22	91.76000000000000000	2	2018.72	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S24_2840	40	100.00000000000000000	3	6089.6001	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S24_4048	21	93.91000000000000000	4	1972.11	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S32_2509	32	53.18000000000000000	5	1701.76	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S32_3207	44	36.07000000000000000	8	1587.08	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S50_1392	29	100.00000000000000000	13	3087.05	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10383	S50_1514	38	60.06000000000000000	10	2282.28	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141	2005-02-22	1	2	2005
10384	S10_4757	34	100.00000000000000000	4	4846.7002	2005-02-23 00:00:00	2005-03-06 00:00:00	2005-02-27 00:00:00	Shipped	\N	321	2005-02-23	1	2	2005
10384	S24_2011	28	80.54000000000000000	3	2255.1201	2005-02-23 00:00:00	2005-03-06 00:00:00	2005-02-27 00:00:00	Shipped	\N	321	2005-02-23	1	2	2005
10384	S24_3151	43	97.87000000000000000	2	4208.4102	2005-02-23 00:00:00	2005-03-06 00:00:00	2005-02-27 00:00:00	Shipped	\N	321	2005-02-23	1	2	2005
10384	S700_1938	49	100.00000000000000000	1	6397.4399	2005-02-23 00:00:00	2005-03-06 00:00:00	2005-02-27 00:00:00	Shipped	\N	321	2005-02-23	1	2	2005
10385	S24_3816	37	85.54000000000000000	2	3164.98	2005-02-28 00:00:00	2005-03-09 00:00:00	2005-03-01 00:00:00	Shipped	\N	124	2005-02-28	1	2	2005
10385	S700_1138	25	77.34000000000000000	1	1933.5	2005-02-28 00:00:00	2005-03-09 00:00:00	2005-03-01 00:00:00	Shipped	\N	124	2005-02-28	1	2	2005
10386	S18_1662	25	54.57000000000000000	7	1364.25	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S18_2581	21	74.77000000000000000	18	1570.17	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S18_3029	37	93.01000000000000000	5	3441.3701	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S18_3856	22	57.55000000000000000	6	1266.1	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S24_1785	33	41.71000000000000000	11	1376.4301	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S24_2841	39	55.96000000000000000	1	2182.4399	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S24_3420	35	63.76000000000000000	9	2231.6001	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S24_3949	41	73.32000000000000000	12	3006.1201	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S24_4278	50	63.34000000000000000	8	3167	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_2047	29	85.76000000000000000	13	2487.04	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_2466	37	83.84000000000000000	14	3102.0801	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_2610	37	100.00000000000000000	10	5017.5698	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_3167	32	94.34000000000000000	17	3018.8799	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_3505	45	92.08000000000000000	2	4143.6001	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10424	S32_3522	44	61.41000000000000000	2	2702.04	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10386	S700_3962	30	95.48000000000000000	3	2864.3999	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S700_4002	44	86.40000000000000000	15	3801.6001	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S72_1253	50	87.15000000000000000	16	4357.5	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10386	S72_3212	43	100.00000000000000000	4	5417.5698	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141	2005-03-01	1	3	2005
10387	S32_1374	44	94.90000000000000000	1	4175.6001	2005-03-02 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	148	2005-03-02	1	3	2005
10388	S10_1678	42	76.36000000000000000	4	3207.1201	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S10_2016	50	44.51000000000000000	5	2225.5	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S10_4698	21	86.77000000000000000	7	1822.17	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S12_2823	44	100.00000000000000000	6	5951.4399	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S32_4289	35	100.00000000000000000	8	3918.95	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S50_1341	27	100.00000000000000000	1	3211.3799	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S700_1691	46	100.00000000000000000	2	10066.6	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10388	S700_2834	50	100.00000000000000000	3	7154.5	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462	2005-03-03	1	3	2005
10389	S12_1099	26	99.04000000000000000	4	2575.04	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S12_3380	25	72.38000000000000000	6	1809.5	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S12_3990	36	70.26000000000000000	7	2529.3601	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S12_4675	47	100.00000000000000000	8	5243.79	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S18_1889	49	79.22000000000000000	3	3881.78	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S18_2625	39	100.00000000000000000	5	6981	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S24_1578	45	100.00000000000000000	1	4597.6499	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10389	S24_2000	49	81.40000000000000000	2	3988.6001	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448	2005-03-03	1	3	2005
10390	S18_1129	36	93.77000000000000000	14	3375.72	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_1984	34	43.05000000000000000	15	1463.7	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_2325	31	98.99000000000000000	16	3068.6899	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_2795	26	78.11000000000000000	7	2030.86	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_3278	40	100.00000000000000000	9	5491.6001	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_3482	50	100.00000000000000000	1	7397	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_3782	36	100.00000000000000000	2	5079.96	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S18_4721	49	100.00000000000000000	3	6862.9399	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S24_2360	35	65.13000000000000000	4	2279.55	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S24_2972	37	100.00000000000000000	5	4894.73	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S24_3371	46	52.84000000000000000	6	2430.6399	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S24_3856	45	100.00000000000000000	8	6763.0498	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S24_4620	30	82.42000000000000000	10	2472.6001	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S32_2206	41	44.56000000000000000	11	1826.96	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S32_4485	45	48.98000000000000000	12	2204.1001	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10390	S50_4713	22	100.00000000000000000	13	3491.1799	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124	2005-03-04	1	3	2005
10391	S10_1949	24	100.00000000000000000	4	2416.5601	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S10_4962	37	46.90000000000000000	7	1735.3	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S12_1666	39	63.20000000000000000	9	2464.8	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S18_1097	29	85.10000000000000000	10	2467.8999	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S18_1342	35	100.00000000000000000	2	5548.8999	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S18_1367	42	100.00000000000000000	3	4998	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S18_2432	44	38.50000000000000000	5	1694	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S18_2949	32	45.25000000000000000	6	1448	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S24_1937	33	100.00000000000000000	8	8344.71	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10391	S24_2022	24	100.00000000000000000	1	4042.0801	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276	2005-03-09	1	3	2005
10392	S18_2957	37	59.96000000000000000	3	2218.52	2005-03-10 00:00:00	2005-03-18 00:00:00	2005-03-12 00:00:00	Shipped	\N	452	2005-03-10	1	3	2005
10392	S18_3136	29	86.92000000000000000	2	2520.6799	2005-03-10 00:00:00	2005-03-18 00:00:00	2005-03-12 00:00:00	Shipped	\N	452	2005-03-10	1	3	2005
10392	S18_3320	36	100.00000000000000000	1	4035.96	2005-03-10 00:00:00	2005-03-18 00:00:00	2005-03-12 00:00:00	Shipped	\N	452	2005-03-10	1	3	2005
10393	S12_3148	35	100.00000000000000000	8	3817.8	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S12_4473	32	100.00000000000000000	10	3236.1599	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S18_2238	20	69.81000000000000000	11	1396.2	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S18_2319	38	100.00000000000000000	7	3805.3201	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S18_4600	30	100.00000000000000000	9	3625.8	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S18_4668	44	100.00000000000000000	1	4849.2402	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S24_2300	33	100.00000000000000000	2	5835.3901	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S24_4258	33	98.18000000000000000	3	3239.9399	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S32_1268	38	100.00000000000000000	4	5521.3999	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S32_3522	31	57.86000000000000000	5	1793.66	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10393	S700_2824	21	100.00000000000000000	6	2146.8301	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323	2005-03-11	1	3	2005
10394	S18_3232	22	100.00000000000000000	5	3353.02	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S18_4027	37	100.00000000000000000	1	6376.5801	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S24_1444	31	50.29000000000000000	2	1558.99	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S24_2840	46	38.90000000000000000	6	1789.4	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S24_4048	37	100.00000000000000000	7	5207.75	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S32_2509	36	62.77000000000000000	3	2259.72	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10394	S32_3207	30	60.28000000000000000	4	1808.4	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141	2005-03-15	1	3	2005
10395	S10_4757	32	100.00000000000000000	2	3370.5601	2005-03-17 00:00:00	2005-03-24 00:00:00	2005-03-23 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	250	2005-03-17	1	3	2005
10395	S12_1108	33	69.12000000000000000	1	2280.96	2005-03-17 00:00:00	2005-03-24 00:00:00	2005-03-23 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	250	2005-03-17	1	3	2005
10395	S50_1392	46	100.00000000000000000	4	5692.96	2005-03-17 00:00:00	2005-03-24 00:00:00	2005-03-23 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	250	2005-03-17	1	3	2005
10395	S50_1514	45	100.00000000000000000	3	8977.0498	2005-03-17 00:00:00	2005-03-24 00:00:00	2005-03-23 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	250	2005-03-17	1	3	2005
10396	S12_3891	33	100.00000000000000000	3	6109.29	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S18_3140	33	100.00000000000000000	2	5273.73	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S18_3259	24	89.75000000000000000	4	2154	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S18_4522	45	100.00000000000000000	5	4739.3999	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S24_2011	49	100.00000000000000000	6	5720.75	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S24_3151	27	83.20000000000000000	7	2246.3999	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S24_3816	37	90.57000000000000000	8	3351.0901	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10396	S700_1138	39	66.67000000000000000	1	2600.1299	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124	2005-03-23	1	3	2005
10397	S700_1938	32	80.55000000000000000	5	2577.6001	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242	2005-03-28	1	3	2005
10397	S700_2610	22	66.50000000000000000	4	1463	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242	2005-03-28	1	3	2005
10397	S700_3505	48	100.00000000000000000	3	5192.6401	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242	2005-03-28	1	3	2005
10397	S700_3962	36	100.00000000000000000	2	3789.72	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242	2005-03-28	1	3	2005
10397	S72_3212	34	62.24000000000000000	1	2116.1599	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242	2005-03-28	1	3	2005
10398	S18_1662	33	100.00000000000000000	11	4215.0898	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S18_2581	34	76.88000000000000000	15	2613.9199	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S18_3029	28	72.26000000000000000	18	2023.28	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S18_3856	45	100.00000000000000000	17	4811.8501	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S24_1785	43	100.00000000000000000	16	5552.1602	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S24_2841	28	57.55000000000000000	3	1611.4	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S24_3420	34	71.67000000000000000	13	2436.78	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S24_3949	41	68.24000000000000000	2	2797.8401	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S24_4278	45	78.25000000000000000	14	3521.25	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S32_4289	22	67.41000000000000000	4	1483.02	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S50_1341	49	36.66000000000000000	5	1796.34	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_1691	47	87.69000000000000000	6	4121.4302	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_2047	36	100.00000000000000000	7	3910.3201	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_2466	22	86.76000000000000000	8	1908.72	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_2834	23	100.00000000000000000	9	2810.8301	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_3167	29	65.60000000000000000	10	1902.4	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S700_4002	36	87.36000000000000000	12	3144.96	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10398	S72_1253	34	40.22000000000000000	1	1367.48	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353	2005-03-30	1	3	2005
10399	S10_1678	40	100.00000000000000000	8	4555.2002	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S10_2016	51	100.00000000000000000	7	6308.7002	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S10_4698	22	100.00000000000000000	6	3493.6001	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S12_2823	29	100.00000000000000000	5	4761.2202	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S18_2625	30	68.44000000000000000	4	2053.2	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S24_1578	57	100.00000000000000000	3	6038.5801	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S24_2000	58	89.12000000000000000	2	5168.96	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10399	S32_1374	32	99.89000000000000000	1	3196.48	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496	2005-04-01	2	4	2005
10400	S10_4757	64	100.00000000000000000	9	9661.4404	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S18_1662	34	100.00000000000000000	1	6433.8198	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S18_3029	30	74.84000000000000000	7	2245.2	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S18_3856	58	100.00000000000000000	6	7307.4199	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S24_2841	24	61.66000000000000000	2	1479.84	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S24_3420	38	57.20000000000000000	3	2173.6001	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S24_3816	42	72.96000000000000000	8	3064.3201	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S700_2047	46	87.80000000000000000	5	4038.8	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10400	S72_1253	20	56.12000000000000000	4	1122.4	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450	2005-04-01	2	4	2005
10401	S18_2581	42	76.03000000000000000	3	3193.26	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S24_1785	38	96.29000000000000000	5	3659.02	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S24_3949	64	60.05000000000000000	12	3843.2	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S24_4278	52	81.14000000000000000	4	4219.2798	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S32_1374	49	100.00000000000000000	1	4992.6099	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S32_4289	62	77.73000000000000000	6	4819.2598	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S50_1341	56	35.35000000000000000	7	1979.6	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S700_1691	11	100.00000000000000000	8	1135.3101	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S700_2466	85	88.75000000000000000	10	7543.75	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S700_2834	21	96.11000000000000000	2	2018.3101	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S700_3167	77	92.00000000000000000	9	7084	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10401	S700_4002	28	72.55000000000000000	11	2031.4	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328	2005-04-03	2	4	2005
10402	S10_2016	45	100.00000000000000000	1	5833.7998	2005-04-07 00:00:00	2005-04-14 00:00:00	2005-04-12 00:00:00	Shipped	\N	406	2005-04-07	2	4	2005
10402	S18_2625	55	55.72000000000000000	2	3064.6001	2005-04-07 00:00:00	2005-04-14 00:00:00	2005-04-12 00:00:00	Shipped	\N	406	2005-04-07	2	4	2005
10402	S24_2000	59	87.60000000000000000	3	5168.3999	2005-04-07 00:00:00	2005-04-14 00:00:00	2005-04-12 00:00:00	Shipped	\N	406	2005-04-07	2	4	2005
10403	S10_1678	24	100.00000000000000000	7	2434.5601	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S10_4698	66	100.00000000000000000	9	11886.6	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S12_2823	66	100.00000000000000000	6	8648.6396	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S18_3782	36	52.22000000000000000	1	1879.92	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S24_1578	46	100.00000000000000000	8	5287.7002	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S24_2360	27	79.65000000000000000	4	2150.55	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S32_2206	30	40.23000000000000000	2	1206.9	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S32_4485	45	100.00000000000000000	5	5189.3999	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10403	S50_4713	31	68.34000000000000000	3	2118.54	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201	2005-04-08	2	4	2005
10404	S12_1099	64	100.00000000000000000	3	13199.4	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S12_3380	43	100.00000000000000000	1	4696.46	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S12_3990	77	74.21000000000000000	4	5714.1699	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S18_3278	90	73.17000000000000000	6	6585.2998	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S18_3482	28	100.00000000000000000	5	3745.28	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S18_4721	48	100.00000000000000000	8	6928.3198	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S24_3371	49	62.45000000000000000	2	3060.05	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10404	S24_4620	48	93.77000000000000000	7	4500.96	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323	2005-04-08	2	4	2005
10405	S12_4675	97	93.28000000000000000	5	9048.1602	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209	2005-04-14	2	4	2005
10405	S18_1889	61	73.92000000000000000	4	4509.1201	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209	2005-04-14	2	4	2005
10405	S18_3232	55	100.00000000000000000	1	8289.0498	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209	2005-04-14	2	4	2005
10405	S24_2972	47	44.56000000000000000	2	2094.3201	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209	2005-04-14	2	4	2005
10405	S24_3856	76	100.00000000000000000	3	11739.7	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209	2005-04-14	2	4	2005
10406	S18_1129	61	100.00000000000000000	3	8374.6904	2005-04-15 00:00:00	2005-04-25 00:00:00	2005-04-21 00:00:00	Disputed	Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.	145	2005-04-15	2	4	2005
10406	S18_1984	48	100.00000000000000000	2	7169.2798	2005-04-15 00:00:00	2005-04-25 00:00:00	2005-04-21 00:00:00	Disputed	Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.	145	2005-04-15	2	4	2005
10406	S18_3685	65	100.00000000000000000	1	10468.9	2005-04-15 00:00:00	2005-04-25 00:00:00	2005-04-21 00:00:00	Disputed	Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.	145	2005-04-15	2	4	2005
10407	S18_1589	59	100.00000000000000000	11	7048.1401	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S18_1749	76	100.00000000000000000	2	14082.8	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S18_2248	42	72.65000000000000000	1	3051.3	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S18_2870	41	100.00000000000000000	12	6386.1602	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S18_4409	6	90.19000000000000000	3	541.14001	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S18_4933	66	66.99000000000000000	4	4421.3398	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_1046	26	76.43000000000000000	8	1987.1801	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_1628	64	40.25000000000000000	10	2576	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_2766	76	94.50000000000000000	6	7182	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_2887	59	98.65000000000000000	5	5820.3501	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_3191	13	81.33000000000000000	7	1057.29	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10407	S24_3432	43	86.73000000000000000	9	3729.3899	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450	2005-04-22	2	4	2005
10408	S24_3969	15	36.93000000000000000	1	553.95001	2005-04-22 00:00:00	2005-04-29 00:00:00	2005-04-27 00:00:00	Shipped	\N	398	2005-04-22	2	4	2005
10409	S18_2325	6	100.00000000000000000	2	785.64001	2005-04-23 00:00:00	2005-05-05 00:00:00	2005-04-24 00:00:00	Shipped	\N	166	2005-04-23	2	4	2005
10409	S24_1937	61	29.54000000000000000	1	1801.9399	2005-04-23 00:00:00	2005-05-05 00:00:00	2005-04-24 00:00:00	Shipped	\N	166	2005-04-23	2	4	2005
10410	S18_1342	65	100.00000000000000000	7	7612.7998	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_1367	44	58.22000000000000000	6	2561.6799	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_2795	56	100.00000000000000000	8	7749.2798	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_2949	47	100.00000000000000000	1	5523.4399	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_2957	53	58.09000000000000000	3	3078.77	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_3136	34	100.00000000000000000	2	3916.46	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S18_3320	44	84.33000000000000000	5	3710.52	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S24_2022	31	45.25000000000000000	9	1402.75	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10410	S24_4258	50	86.68000000000000000	4	4334	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357	2005-04-29	2	4	2005
10411	S10_1949	23	100.00000000000000000	9	4140.23	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S10_4962	27	100.00000000000000000	2	4427.73	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S12_1666	40	100.00000000000000000	6	6232	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S18_1097	27	100.00000000000000000	8	3213	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S18_4600	46	100.00000000000000000	3	5235.7202	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S18_4668	35	59.87000000000000000	7	2095.45	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S32_1268	26	100.00000000000000000	1	2904.72	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S32_3522	27	69.16000000000000000	5	1867.3199	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10411	S700_2824	34	100.00000000000000000	4	3576.8	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233	2005-05-01	2	5	2005
10412	S12_4473	54	100.00000000000000000	5	5951.3398	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S18_2238	41	100.00000000000000000	4	6712.9302	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S18_2319	56	98.18000000000000000	8	5498.0801	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S18_2432	47	61.99000000000000000	11	2913.53	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S18_3232	60	100.00000000000000000	9	11887.8	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S24_1444	21	52.60000000000000000	2	1104.6	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S24_2300	70	100.00000000000000000	10	8498	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S24_2840	30	36.07000000000000000	6	1082.1	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S24_4048	31	100.00000000000000000	1	4253.2002	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S32_2509	19	48.70000000000000000	7	925.29999	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10412	S50_1392	26	100.00000000000000000	3	3460.8601	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141	2005-05-03	2	5	2005
10413	S12_1108	36	100.00000000000000000	2	8677.7998	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10413	S12_3148	47	100.00000000000000000	3	8236.75	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10413	S12_3891	22	100.00000000000000000	1	3387.78	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10413	S18_4027	49	100.00000000000000000	5	6896.75	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10413	S32_3207	24	49.71000000000000000	6	1193.04	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10413	S50_1514	51	63.85000000000000000	4	3256.3501	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175	2005-05-05	2	5	2005
10414	S10_4757	19	100.00000000000000000	3	2764.8799	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S18_3029	44	73.98000000000000000	1	3255.1201	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S18_3140	41	100.00000000000000000	12	4872.0298	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S18_3259	48	100.00000000000000000	14	5808.48	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S18_4522	16	75.48000000000000000	11	1207.6801	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S24_2011	23	100.00000000000000000	10	3335.23	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S24_3151	60	100.00000000000000000	5	6107.3999	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S24_3816	51	76.31000000000000000	2	3891.8101	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S700_1138	37	71.34000000000000000	6	2639.5801	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S700_1938	34	100.00000000000000000	13	3533.6201	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S700_2610	31	75.89000000000000000	4	2352.5901	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S700_3505	28	100.00000000000000000	7	3029.04	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S700_3962	27	90.37000000000000000	8	2439.99	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10414	S72_3212	47	65.52000000000000000	9	3079.4399	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362	2005-05-06	2	5	2005
10415	S18_3856	51	100.00000000000000000	5	6209.25	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471	2005-05-09	2	5	2005
10415	S24_2841	21	67.82000000000000000	1	1424.22	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471	2005-05-09	2	5	2005
10415	S24_3420	18	69.70000000000000000	2	1254.6	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471	2005-05-09	2	5	2005
10415	S700_2047	32	95.95000000000000000	4	3070.3999	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471	2005-05-09	2	5	2005
10415	S72_1253	42	57.61000000000000000	3	2419.6201	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471	2005-05-09	2	5	2005
10416	S18_1662	24	100.00000000000000000	14	4352.1602	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S18_2581	15	98.84000000000000000	4	1482.6	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S24_1785	47	88.63000000000000000	6	4165.6099	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S24_2000	32	87.60000000000000000	1	2803.2	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S24_3949	18	75.06000000000000000	13	1351.08	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S24_4278	48	74.62000000000000000	5	3581.76	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S32_1374	45	100.00000000000000000	2	4764.6001	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S32_4289	26	61.22000000000000000	7	1591.72	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S50_1341	37	51.93000000000000000	8	1921.41	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S700_1691	23	91.34000000000000000	9	2100.8201	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S700_2466	22	100.00000000000000000	11	2457.1799	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S700_2834	41	100.00000000000000000	3	5642.8301	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S700_3167	39	67.20000000000000000	10	2620.8	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10416	S700_4002	43	62.19000000000000000	12	2674.1699	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386	2005-05-10	2	5	2005
10417	S10_1678	66	100.00000000000000000	2	7516.0801	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10417	S10_2016	45	100.00000000000000000	5	5887.3501	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10417	S10_4698	56	100.00000000000000000	4	9218.1602	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10417	S12_2823	21	100.00000000000000000	1	3447.78	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10417	S18_2625	36	61.18000000000000000	6	2202.48	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10417	S24_1578	35	100.00000000000000000	3	3550.05	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141	2005-05-13	2	5	2005
10418	S18_3278	16	76.39000000000000000	2	1222.24	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S18_3482	27	100.00000000000000000	1	4445.0098	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S18_3782	33	52.84000000000000000	5	1743.72	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S18_4721	28	100.00000000000000000	4	3833.2	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S24_2360	52	65.80000000000000000	8	3421.6001	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S24_4620	10	87.31000000000000000	3	873.09998	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S32_2206	43	48.28000000000000000	6	2076.04	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S32_4485	50	100.00000000000000000	9	5664	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10418	S50_4713	40	72.41000000000000000	7	2896.3999	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412	2005-05-16	2	5	2005
10419	S12_1099	12	100.00000000000000000	13	1961.28	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S12_3380	10	100.00000000000000000	11	1092.2	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S12_3990	34	90.17000000000000000	14	3065.78	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S12_4675	32	100.00000000000000000	10	3832.6399	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_1129	38	100.00000000000000000	5	4464.2402	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_1589	37	100.00000000000000000	1	5202.9399	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_1889	39	83.93000000000000000	9	3273.27	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_1984	34	100.00000000000000000	4	4594.7598	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_2870	55	100.00000000000000000	2	7695.6001	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_3232	35	100.00000000000000000	6	5926.8999	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S18_3685	43	100.00000000000000000	3	5589.1401	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S24_2972	15	42.67000000000000000	7	640.04999	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S24_3371	55	52.66000000000000000	12	2896.3	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10419	S24_3856	70	100.00000000000000000	8	9240	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382	2005-05-17	2	5	2005
10420	S18_1749	37	100.00000000000000000	5	5283.6001	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S18_2248	36	63.57000000000000000	4	2288.52	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S18_2325	45	100.00000000000000000	2	4977	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S18_4409	66	92.95000000000000000	6	6134.7002	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S18_4933	36	57.73000000000000000	7	2078.28	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_1046	60	64.67000000000000000	11	3880.2	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_1628	37	60.37000000000000000	13	2233.6899	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_1937	45	26.88000000000000000	1	1209.6	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_2766	39	100.00000000000000000	9	3933.9299	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_2887	55	96.30000000000000000	8	5296.5	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_3191	35	96.74000000000000000	10	3385.8999	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_3432	26	100.00000000000000000	12	2617.1599	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10420	S24_3969	15	43.49000000000000000	3	652.34998	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282	2005-05-29	2	5	2005
10421	S18_2795	35	100.00000000000000000	1	5433.75	2005-05-29 00:00:00	2005-06-06 00:00:00	\N	In Process	Custom shipping instructions were sent to warehouse	124	2005-05-29	2	5	2005
10421	S24_2022	40	45.70000000000000000	2	1828	2005-05-29 00:00:00	2005-06-06 00:00:00	\N	In Process	Custom shipping instructions were sent to warehouse	124	2005-05-29	2	5	2005
10422	S18_1342	51	95.55000000000000000	2	4873.0498	2005-05-30 00:00:00	2005-06-11 00:00:00	\N	In Process	\N	157	2005-05-30	2	5	2005
10422	S18_1367	25	51.75000000000000000	1	1293.75	2005-05-30 00:00:00	2005-06-11 00:00:00	\N	In Process	\N	157	2005-05-30	2	5	2005
10423	S18_2949	10	88.14000000000000000	1	881.40002	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314	2005-05-30	2	5	2005
10423	S18_2957	31	53.72000000000000000	3	1665.3199	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314	2005-05-30	2	5	2005
10423	S18_3136	21	84.82000000000000000	2	1781.22	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314	2005-05-30	2	5	2005
10424	S700_2824	46	80.92000000000000000	1	3722.3201	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141	2005-05-31	2	5	2005
10425	S10_4962	38	100.00000000000000000	12	5894.9399	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S12_4473	33	100.00000000000000000	4	4692.6001	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S18_2238	28	100.00000000000000000	3	5318.04	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S18_2319	38	99.41000000000000000	7	3777.5801	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S18_2432	19	49.22000000000000000	10	935.17999	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S18_3232	28	100.00000000000000000	8	3793.1599	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S18_4600	38	100.00000000000000000	13	4325.1602	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S24_1444	55	46.82000000000000000	1	2575.1001	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S24_2300	49	100.00000000000000000	9	5510.54	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S24_2840	31	33.24000000000000000	5	1030.4399	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S32_1268	41	86.68000000000000000	11	3553.8799	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S32_2509	11	43.83000000000000000	6	482.13	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
10425	S50_1392	18	100.00000000000000000	2	1895.9399	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119	2005-05-31	2	5	2005
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY orders (ordernumber, orderdate, requireddate, shippeddate, status, comments, customernumber) FROM stdin;
10100	2003-01-06 00:00:00	2003-01-13 00:00:00	2003-01-10 00:00:00	Shipped	\N	363
10101	2003-01-09 00:00:00	2003-01-18 00:00:00	2003-01-11 00:00:00	Shipped	Check on availability.	128
10102	2003-01-10 00:00:00	2003-01-18 00:00:00	2003-01-14 00:00:00	Shipped	\N	181
10103	2003-01-29 00:00:00	2003-02-07 00:00:00	2003-02-02 00:00:00	Shipped	\N	121
10104	2003-01-31 00:00:00	2003-02-09 00:00:00	2003-02-01 00:00:00	Shipped	\N	141
10105	2003-02-11 00:00:00	2003-02-21 00:00:00	2003-02-12 00:00:00	Shipped	\N	145
10106	2003-02-17 00:00:00	2003-02-24 00:00:00	2003-02-21 00:00:00	Shipped	\N	278
10107	2003-02-24 00:00:00	2003-03-03 00:00:00	2003-02-26 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	131
10108	2003-03-03 00:00:00	2003-03-12 00:00:00	2003-03-08 00:00:00	Shipped	\N	385
10109	2003-03-10 00:00:00	2003-03-19 00:00:00	2003-03-11 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	486
10110	2003-03-18 00:00:00	2003-03-24 00:00:00	2003-03-20 00:00:00	Shipped	\N	187
10111	2003-03-25 00:00:00	2003-03-31 00:00:00	2003-03-30 00:00:00	Shipped	\N	129
10112	2003-03-24 00:00:00	2003-04-03 00:00:00	2003-03-29 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	144
10113	2003-03-26 00:00:00	2003-04-02 00:00:00	2003-03-27 00:00:00	Shipped	\N	124
10114	2003-04-01 00:00:00	2003-04-07 00:00:00	2003-04-02 00:00:00	Shipped	\N	172
10115	2003-04-04 00:00:00	2003-04-12 00:00:00	2003-04-07 00:00:00	Shipped	\N	424
10116	2003-04-11 00:00:00	2003-04-19 00:00:00	2003-04-13 00:00:00	Shipped	\N	381
10117	2003-04-16 00:00:00	2003-04-24 00:00:00	2003-04-17 00:00:00	Shipped	\N	148
10118	2003-04-21 00:00:00	2003-04-29 00:00:00	2003-04-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	216
10119	2003-04-28 00:00:00	2003-05-05 00:00:00	2003-05-02 00:00:00	Shipped	\N	382
10120	2003-04-29 00:00:00	2003-05-08 00:00:00	2003-05-01 00:00:00	Shipped	\N	114
10121	2003-05-07 00:00:00	2003-05-13 00:00:00	2003-05-13 00:00:00	Shipped	\N	353
10122	2003-05-08 00:00:00	2003-05-16 00:00:00	2003-05-13 00:00:00	Shipped	\N	350
10123	2003-05-20 00:00:00	2003-05-29 00:00:00	2003-05-22 00:00:00	Shipped	\N	103
10124	2003-05-21 00:00:00	2003-05-29 00:00:00	2003-05-25 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	112
10125	2003-05-21 00:00:00	2003-05-27 00:00:00	2003-05-24 00:00:00	Shipped	\N	114
10126	2003-05-28 00:00:00	2003-06-07 00:00:00	2003-06-02 00:00:00	Shipped	\N	458
10127	2003-06-03 00:00:00	2003-06-09 00:00:00	2003-06-06 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	151
10128	2003-06-06 00:00:00	2003-06-12 00:00:00	2003-06-11 00:00:00	Shipped	\N	141
10129	2003-06-12 00:00:00	2003-06-18 00:00:00	2003-06-14 00:00:00	Shipped	\N	324
10130	2003-06-16 00:00:00	2003-06-24 00:00:00	2003-06-21 00:00:00	Shipped	\N	198
10131	2003-06-16 00:00:00	2003-06-25 00:00:00	2003-06-21 00:00:00	Shipped	\N	447
10132	2003-06-25 00:00:00	2003-07-01 00:00:00	2003-06-28 00:00:00	Shipped	\N	323
10133	2003-06-27 00:00:00	2003-07-04 00:00:00	2003-07-03 00:00:00	Shipped	\N	141
10134	2003-07-01 00:00:00	2003-07-10 00:00:00	2003-07-05 00:00:00	Shipped	\N	250
10135	2003-07-02 00:00:00	2003-07-12 00:00:00	2003-07-03 00:00:00	Shipped	\N	124
10136	2003-07-04 00:00:00	2003-07-14 00:00:00	2003-07-06 00:00:00	Shipped	Customer is interested in buying more Ferrari models	242
10137	2003-07-10 00:00:00	2003-07-20 00:00:00	2003-07-14 00:00:00	Shipped	\N	353
10138	2003-07-07 00:00:00	2003-07-16 00:00:00	2003-07-13 00:00:00	Shipped	\N	496
10139	2003-07-16 00:00:00	2003-07-23 00:00:00	2003-07-21 00:00:00	Shipped	\N	282
10140	2003-07-24 00:00:00	2003-08-02 00:00:00	2003-07-30 00:00:00	Shipped	\N	161
10141	2003-08-01 00:00:00	2003-08-09 00:00:00	2003-08-04 00:00:00	Shipped	\N	334
10142	2003-08-08 00:00:00	2003-08-16 00:00:00	2003-08-13 00:00:00	Shipped	\N	124
10143	2003-08-10 00:00:00	2003-08-18 00:00:00	2003-08-12 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	320
10144	2003-08-13 00:00:00	2003-08-21 00:00:00	2003-08-14 00:00:00	Shipped	\N	381
10145	2003-08-25 00:00:00	2003-09-02 00:00:00	2003-08-31 00:00:00	Shipped	\N	205
10146	2003-09-03 00:00:00	2003-09-13 00:00:00	2003-09-06 00:00:00	Shipped	\N	447
10147	2003-09-05 00:00:00	2003-09-12 00:00:00	2003-09-09 00:00:00	Shipped	\N	379
10148	2003-09-11 00:00:00	2003-09-21 00:00:00	2003-09-15 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	276
10149	2003-09-12 00:00:00	2003-09-18 00:00:00	2003-09-17 00:00:00	Shipped	\N	487
10150	2003-09-19 00:00:00	2003-09-27 00:00:00	2003-09-21 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	148
10151	2003-09-21 00:00:00	2003-09-30 00:00:00	2003-09-24 00:00:00	Shipped	\N	311
10152	2003-09-25 00:00:00	2003-10-03 00:00:00	2003-10-01 00:00:00	Shipped	\N	333
10153	2003-09-28 00:00:00	2003-10-05 00:00:00	2003-10-03 00:00:00	Shipped	\N	141
10154	2003-10-02 00:00:00	2003-10-12 00:00:00	2003-10-08 00:00:00	Shipped	\N	219
10155	2003-10-06 00:00:00	2003-10-13 00:00:00	2003-10-07 00:00:00	Shipped	\N	186
10156	2003-10-08 00:00:00	2003-10-17 00:00:00	2003-10-11 00:00:00	Shipped	\N	141
10157	2003-10-09 00:00:00	2003-10-15 00:00:00	2003-10-14 00:00:00	Shipped	\N	473
10158	2003-10-10 00:00:00	2003-10-18 00:00:00	2003-10-15 00:00:00	Shipped	\N	121
10159	2003-10-10 00:00:00	2003-10-19 00:00:00	2003-10-16 00:00:00	Shipped	\N	321
10160	2003-10-11 00:00:00	2003-10-17 00:00:00	2003-10-17 00:00:00	Shipped	\N	347
10161	2003-10-17 00:00:00	2003-10-25 00:00:00	2003-10-20 00:00:00	Shipped	\N	227
10162	2003-10-18 00:00:00	2003-10-26 00:00:00	2003-10-19 00:00:00	Shipped	\N	321
10163	2003-10-20 00:00:00	2003-10-27 00:00:00	2003-10-24 00:00:00	Shipped	\N	424
10164	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-23 00:00:00	Resolved	This order was disputed, but resolved on 11/1/2003; Customer doesn't like the colors and precision of the models.	452
10165	2003-10-22 00:00:00	2003-10-31 00:00:00	2003-12-26 00:00:00	Shipped	This order was on hold because customers's credit limit had been exceeded. Order will ship when payment is received	148
10166	2003-10-21 00:00:00	2003-10-30 00:00:00	2003-10-27 00:00:00	Shipped	\N	462
10167	2003-10-23 00:00:00	2003-10-30 00:00:00	\N	Cancelled	Customer called to cancel. The warehouse was notified in time and the order didn't ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.	448
10168	2003-10-28 00:00:00	2003-11-03 00:00:00	2003-11-01 00:00:00	Shipped	\N	161
10169	2003-11-04 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	276
10170	2003-11-04 00:00:00	2003-11-12 00:00:00	2003-11-07 00:00:00	Shipped	\N	452
10171	2003-11-05 00:00:00	2003-11-13 00:00:00	2003-11-07 00:00:00	Shipped	\N	233
10172	2003-11-05 00:00:00	2003-11-14 00:00:00	2003-11-11 00:00:00	Shipped	\N	175
10173	2003-11-05 00:00:00	2003-11-15 00:00:00	2003-11-09 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	278
10174	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-10 00:00:00	Shipped	\N	333
10175	2003-11-06 00:00:00	2003-11-14 00:00:00	2003-11-09 00:00:00	Shipped	\N	324
10176	2003-11-06 00:00:00	2003-11-15 00:00:00	2003-11-12 00:00:00	Shipped	\N	386
10177	2003-11-07 00:00:00	2003-11-17 00:00:00	2003-11-12 00:00:00	Shipped	\N	344
10178	2003-11-08 00:00:00	2003-11-16 00:00:00	2003-11-10 00:00:00	Shipped	Custom shipping instructions sent to warehouse	242
10179	2003-11-11 00:00:00	2003-11-17 00:00:00	2003-11-13 00:00:00	Cancelled	Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.	496
10180	2003-11-11 00:00:00	2003-11-19 00:00:00	2003-11-14 00:00:00	Shipped	\N	171
10181	2003-11-12 00:00:00	2003-11-19 00:00:00	2003-11-15 00:00:00	Shipped	\N	167
10182	2003-11-12 00:00:00	2003-11-21 00:00:00	2003-11-18 00:00:00	Shipped	\N	124
10183	2003-11-13 00:00:00	2003-11-22 00:00:00	2003-11-15 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	339
10184	2003-11-14 00:00:00	2003-11-22 00:00:00	2003-11-20 00:00:00	Shipped	\N	484
10185	2003-11-14 00:00:00	2003-11-21 00:00:00	2003-11-20 00:00:00	Shipped	\N	320
10186	2003-11-14 00:00:00	2003-11-20 00:00:00	2003-11-18 00:00:00	Shipped	They want to reevaluate their terms agreement with the VP of Sales	489
10187	2003-11-15 00:00:00	2003-11-24 00:00:00	2003-11-16 00:00:00	Shipped	\N	211
10188	2003-11-18 00:00:00	2003-11-26 00:00:00	2003-11-24 00:00:00	Shipped	\N	167
10189	2003-11-18 00:00:00	2003-11-25 00:00:00	2003-11-24 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	205
10190	2003-11-19 00:00:00	2003-11-29 00:00:00	2003-11-20 00:00:00	Shipped	\N	141
10376	2005-02-08 00:00:00	2005-02-18 00:00:00	2005-02-13 00:00:00	Shipped	\N	219
10191	2003-11-20 00:00:00	2003-11-30 00:00:00	2003-11-24 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	259
10192	2003-11-20 00:00:00	2003-11-29 00:00:00	2003-11-25 00:00:00	Shipped	\N	363
10193	2003-11-21 00:00:00	2003-11-28 00:00:00	2003-11-27 00:00:00	Shipped	\N	471
10194	2003-11-25 00:00:00	2003-12-02 00:00:00	2003-11-26 00:00:00	Shipped	\N	146
10195	2003-11-25 00:00:00	2003-12-01 00:00:00	2003-11-28 00:00:00	Shipped	\N	319
10196	2003-11-26 00:00:00	2003-12-03 00:00:00	2003-12-01 00:00:00	Shipped	\N	455
10197	2003-11-26 00:00:00	2003-12-02 00:00:00	2003-12-01 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	216
10198	2003-11-27 00:00:00	2003-12-06 00:00:00	2003-12-03 00:00:00	Shipped	\N	385
10199	2003-12-01 00:00:00	2003-12-10 00:00:00	2003-12-06 00:00:00	Shipped	\N	475
10200	2003-12-01 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	211
10201	2003-12-01 00:00:00	2003-12-11 00:00:00	2003-12-02 00:00:00	Shipped	\N	129
10202	2003-12-02 00:00:00	2003-12-09 00:00:00	2003-12-06 00:00:00	Shipped	\N	357
10203	2003-12-02 00:00:00	2003-12-11 00:00:00	2003-12-07 00:00:00	Shipped	\N	141
10204	2003-12-02 00:00:00	2003-12-10 00:00:00	2003-12-04 00:00:00	Shipped	\N	151
10205	2003-12-03 00:00:00	2003-12-09 00:00:00	2003-12-07 00:00:00	Shipped	 I need all the information I can get on our competitors.	141
10206	2003-12-05 00:00:00	2003-12-13 00:00:00	2003-12-08 00:00:00	Shipped	Can we renegotiate this one?	202
10207	2003-12-09 00:00:00	2003-12-17 00:00:00	2003-12-11 00:00:00	Shipped	Check on availability.	495
10208	2004-01-02 00:00:00	2004-01-11 00:00:00	2004-01-04 00:00:00	Shipped	\N	146
10209	2004-01-09 00:00:00	2004-01-15 00:00:00	2004-01-12 00:00:00	Shipped	\N	347
10210	2004-01-12 00:00:00	2004-01-22 00:00:00	2004-01-20 00:00:00	Shipped	\N	177
10211	2004-01-15 00:00:00	2004-01-25 00:00:00	2004-01-18 00:00:00	Shipped	\N	406
10212	2004-01-16 00:00:00	2004-01-24 00:00:00	2004-01-18 00:00:00	Shipped	\N	141
10213	2004-01-22 00:00:00	2004-01-28 00:00:00	2004-01-27 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	489
10214	2004-01-26 00:00:00	2004-02-04 00:00:00	2004-01-29 00:00:00	Shipped	\N	458
10215	2004-01-29 00:00:00	2004-02-08 00:00:00	2004-02-01 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	475
10216	2004-02-02 00:00:00	2004-02-10 00:00:00	2004-02-04 00:00:00	Shipped	\N	256
10217	2004-02-04 00:00:00	2004-02-14 00:00:00	2004-02-06 00:00:00	Shipped	\N	166
10218	2004-02-09 00:00:00	2004-02-16 00:00:00	2004-02-11 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	473
10219	2004-02-10 00:00:00	2004-02-17 00:00:00	2004-02-12 00:00:00	Shipped	\N	487
10220	2004-02-12 00:00:00	2004-02-19 00:00:00	2004-02-16 00:00:00	Shipped	\N	189
10221	2004-02-18 00:00:00	2004-02-26 00:00:00	2004-02-19 00:00:00	Shipped	\N	314
10222	2004-02-19 00:00:00	2004-02-27 00:00:00	2004-02-20 00:00:00	Shipped	\N	239
10223	2004-02-20 00:00:00	2004-02-29 00:00:00	2004-02-24 00:00:00	Shipped	\N	114
10224	2004-02-21 00:00:00	2004-03-02 00:00:00	2004-02-26 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	171
10225	2004-02-22 00:00:00	2004-03-01 00:00:00	2004-02-24 00:00:00	Shipped	\N	298
10226	2004-02-26 00:00:00	2004-03-06 00:00:00	2004-03-02 00:00:00	Shipped	\N	239
10227	2004-03-02 00:00:00	2004-03-12 00:00:00	2004-03-08 00:00:00	Shipped	\N	146
10228	2004-03-10 00:00:00	2004-03-18 00:00:00	2004-03-13 00:00:00	Shipped	\N	173
10229	2004-03-11 00:00:00	2004-03-20 00:00:00	2004-03-12 00:00:00	Shipped	\N	124
10230	2004-03-15 00:00:00	2004-03-24 00:00:00	2004-03-20 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	128
10231	2004-03-19 00:00:00	2004-03-26 00:00:00	2004-03-25 00:00:00	Shipped	\N	344
10232	2004-03-20 00:00:00	2004-03-30 00:00:00	2004-03-25 00:00:00	Shipped	\N	240
10233	2004-03-29 00:00:00	2004-04-04 00:00:00	2004-04-02 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	328
10234	2004-03-30 00:00:00	2004-04-05 00:00:00	2004-04-02 00:00:00	Shipped	\N	412
10235	2004-04-02 00:00:00	2004-04-12 00:00:00	2004-04-06 00:00:00	Shipped	\N	260
10236	2004-04-03 00:00:00	2004-04-11 00:00:00	2004-04-08 00:00:00	Shipped	\N	486
10237	2004-04-05 00:00:00	2004-04-12 00:00:00	2004-04-10 00:00:00	Shipped	\N	181
10238	2004-04-09 00:00:00	2004-04-16 00:00:00	2004-04-10 00:00:00	Shipped	\N	145
10239	2004-04-12 00:00:00	2004-04-21 00:00:00	2004-04-17 00:00:00	Shipped	\N	311
10240	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-20 00:00:00	Shipped	\N	177
10241	2004-04-13 00:00:00	2004-04-20 00:00:00	2004-04-19 00:00:00	Shipped	\N	209
10242	2004-04-20 00:00:00	2004-04-28 00:00:00	2004-04-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	456
10243	2004-04-26 00:00:00	2004-05-03 00:00:00	2004-04-28 00:00:00	Shipped	\N	495
10244	2004-04-29 00:00:00	2004-05-09 00:00:00	2004-05-04 00:00:00	Shipped	\N	141
10245	2004-05-04 00:00:00	2004-05-12 00:00:00	2004-05-09 00:00:00	Shipped	\N	455
10246	2004-05-05 00:00:00	2004-05-13 00:00:00	2004-05-06 00:00:00	Shipped	\N	141
10247	2004-05-05 00:00:00	2004-05-11 00:00:00	2004-05-08 00:00:00	Shipped	\N	334
10248	2004-05-07 00:00:00	2004-05-14 00:00:00	\N	Cancelled	Order was mistakenly placed. The warehouse noticed the lack of documentation.	131
10249	2004-05-08 00:00:00	2004-05-17 00:00:00	2004-05-11 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	173
10250	2004-05-11 00:00:00	2004-05-19 00:00:00	2004-05-15 00:00:00	Shipped	\N	450
10251	2004-05-18 00:00:00	2004-05-24 00:00:00	2004-05-24 00:00:00	Shipped	\N	328
10252	2004-05-26 00:00:00	2004-06-04 00:00:00	2004-05-29 00:00:00	Shipped	\N	406
10253	2004-06-01 00:00:00	2004-06-09 00:00:00	2004-06-02 00:00:00	Cancelled	Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.	201
10254	2004-06-03 00:00:00	2004-06-13 00:00:00	2004-06-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	323
10255	2004-06-04 00:00:00	2004-06-12 00:00:00	2004-06-09 00:00:00	Shipped	\N	209
10256	2004-06-08 00:00:00	2004-06-16 00:00:00	2004-06-10 00:00:00	Shipped	\N	145
10257	2004-06-14 00:00:00	2004-06-24 00:00:00	2004-06-15 00:00:00	Shipped	\N	450
10258	2004-06-15 00:00:00	2004-06-25 00:00:00	2004-06-23 00:00:00	Shipped	\N	398
10259	2004-06-15 00:00:00	2004-06-22 00:00:00	2004-06-17 00:00:00	Shipped	\N	166
10260	2004-06-16 00:00:00	2004-06-22 00:00:00	\N	Cancelled	Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.	357
10261	2004-06-17 00:00:00	2004-06-25 00:00:00	2004-06-22 00:00:00	Shipped	\N	233
10262	2004-06-24 00:00:00	2004-07-01 00:00:00	\N	Cancelled	This customer found a better offer from one of our competitors. Will call back to renegotiate.	141
10263	2004-06-28 00:00:00	2004-07-04 00:00:00	2004-07-02 00:00:00	Shipped	\N	175
10264	2004-06-30 00:00:00	2004-07-06 00:00:00	2004-07-01 00:00:00	Shipped	Customer will send a truck to our local warehouse on 7/1/2004	362
10265	2004-07-02 00:00:00	2004-07-09 00:00:00	2004-07-07 00:00:00	Shipped	\N	471
10266	2004-07-06 00:00:00	2004-07-14 00:00:00	2004-07-10 00:00:00	Shipped	\N	386
10267	2004-07-07 00:00:00	2004-07-17 00:00:00	2004-07-09 00:00:00	Shipped	\N	151
10268	2004-07-12 00:00:00	2004-07-18 00:00:00	2004-07-14 00:00:00	Shipped	\N	412
10269	2004-07-16 00:00:00	2004-07-22 00:00:00	2004-07-18 00:00:00	Shipped	\N	382
10270	2004-07-19 00:00:00	2004-07-27 00:00:00	2004-07-24 00:00:00	Shipped	Can we renegotiate this one?	282
10271	2004-07-20 00:00:00	2004-07-29 00:00:00	2004-07-23 00:00:00	Shipped	\N	124
10272	2004-07-20 00:00:00	2004-07-26 00:00:00	2004-07-22 00:00:00	Shipped	\N	157
10273	2004-07-21 00:00:00	2004-07-28 00:00:00	2004-07-22 00:00:00	Shipped	\N	314
10274	2004-07-21 00:00:00	2004-07-29 00:00:00	2004-07-22 00:00:00	Shipped	\N	379
10275	2004-07-23 00:00:00	2004-08-02 00:00:00	2004-07-29 00:00:00	Shipped	\N	119
10276	2004-08-02 00:00:00	2004-08-11 00:00:00	2004-08-08 00:00:00	Shipped	\N	204
10277	2004-08-04 00:00:00	2004-08-12 00:00:00	2004-08-05 00:00:00	Shipped	\N	148
10278	2004-08-06 00:00:00	2004-08-16 00:00:00	2004-08-09 00:00:00	Shipped	\N	112
10279	2004-08-09 00:00:00	2004-08-19 00:00:00	2004-08-15 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	141
10280	2004-08-17 00:00:00	2004-08-27 00:00:00	2004-08-19 00:00:00	Shipped	\N	249
10281	2004-08-19 00:00:00	2004-08-28 00:00:00	2004-08-23 00:00:00	Shipped	\N	157
10282	2004-08-20 00:00:00	2004-08-26 00:00:00	2004-08-22 00:00:00	Shipped	\N	124
10283	2004-08-20 00:00:00	2004-08-30 00:00:00	2004-08-23 00:00:00	Shipped	\N	260
10284	2004-08-21 00:00:00	2004-08-29 00:00:00	2004-08-26 00:00:00	Shipped	Custom shipping instructions sent to warehouse	299
10285	2004-08-27 00:00:00	2004-09-04 00:00:00	2004-08-31 00:00:00	Shipped	\N	286
10286	2004-08-28 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	172
10287	2004-08-30 00:00:00	2004-09-06 00:00:00	2004-09-01 00:00:00	Shipped	\N	298
10288	2004-09-01 00:00:00	2004-09-11 00:00:00	2004-09-05 00:00:00	Shipped	\N	166
10289	2004-09-03 00:00:00	2004-09-13 00:00:00	2004-09-04 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	167
10290	2004-09-07 00:00:00	2004-09-15 00:00:00	2004-09-13 00:00:00	Shipped	\N	198
10291	2004-09-08 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	448
10292	2004-09-08 00:00:00	2004-09-18 00:00:00	2004-09-11 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	131
10293	2004-09-09 00:00:00	2004-09-18 00:00:00	2004-09-14 00:00:00	Shipped	\N	249
10294	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	\N	204
10295	2004-09-10 00:00:00	2004-09-17 00:00:00	2004-09-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	362
10296	2004-09-15 00:00:00	2004-09-22 00:00:00	2004-09-16 00:00:00	Shipped	\N	415
10297	2004-09-16 00:00:00	2004-09-22 00:00:00	2004-09-21 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	189
10298	2004-09-27 00:00:00	2004-10-05 00:00:00	2004-10-01 00:00:00	Shipped	\N	103
10299	2004-09-30 00:00:00	2004-10-10 00:00:00	2004-10-01 00:00:00	Shipped	\N	186
10300	2003-10-04 00:00:00	2003-10-13 00:00:00	2003-10-09 00:00:00	Shipped	\N	128
10301	2003-10-05 00:00:00	2003-10-15 00:00:00	2003-10-08 00:00:00	Shipped	\N	299
10302	2003-10-06 00:00:00	2003-10-16 00:00:00	2003-10-07 00:00:00	Shipped	\N	201
10303	2004-10-06 00:00:00	2004-10-14 00:00:00	2004-10-09 00:00:00	Shipped	Customer inquired about remote controlled models and gold models.	484
10304	2004-10-11 00:00:00	2004-10-20 00:00:00	2004-10-17 00:00:00	Shipped	\N	256
10305	2004-10-13 00:00:00	2004-10-22 00:00:00	2004-10-15 00:00:00	Shipped	Check on availability.	286
10306	2004-10-14 00:00:00	2004-10-21 00:00:00	2004-10-17 00:00:00	Shipped	\N	187
10307	2004-10-14 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	\N	339
10308	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-20 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	319
10309	2004-10-15 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	121
10310	2004-10-16 00:00:00	2004-10-24 00:00:00	2004-10-18 00:00:00	Shipped	\N	259
10311	2004-10-16 00:00:00	2004-10-23 00:00:00	2004-10-20 00:00:00	Shipped	Difficult to negotiate with customer. We need more marketing materials	141
10312	2004-10-21 00:00:00	2004-10-27 00:00:00	2004-10-23 00:00:00	Shipped	\N	124
10313	2004-10-22 00:00:00	2004-10-28 00:00:00	2004-10-25 00:00:00	Shipped	Customer requested that FedEx Ground is used for this shipping	202
10314	2004-10-22 00:00:00	2004-11-01 00:00:00	2004-10-23 00:00:00	Shipped	\N	227
10315	2004-10-29 00:00:00	2004-11-08 00:00:00	2004-10-30 00:00:00	Shipped	\N	119
10316	2004-11-01 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	Customer requested that ad materials (such as posters, pamphlets) be included in the shippment	240
10317	2004-11-02 00:00:00	2004-11-12 00:00:00	2004-11-08 00:00:00	Shipped	\N	161
10318	2004-11-02 00:00:00	2004-11-09 00:00:00	2004-11-07 00:00:00	Shipped	\N	157
10319	2004-11-03 00:00:00	2004-11-11 00:00:00	2004-11-06 00:00:00	Shipped	Customer requested that DHL is used for this shipping	456
10320	2004-11-03 00:00:00	2004-11-13 00:00:00	2004-11-07 00:00:00	Shipped	\N	144
10321	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-07 00:00:00	Shipped	\N	462
10322	2004-11-04 00:00:00	2004-11-12 00:00:00	2004-11-10 00:00:00	Shipped	Customer has worked with some of our vendors in the past and is aware of their MSRP	363
10323	2004-11-05 00:00:00	2004-11-12 00:00:00	2004-11-09 00:00:00	Shipped	\N	128
10324	2004-11-05 00:00:00	2004-11-11 00:00:00	2004-11-08 00:00:00	Shipped	\N	181
10325	2004-11-05 00:00:00	2004-11-13 00:00:00	2004-11-08 00:00:00	Shipped	\N	121
10326	2004-11-09 00:00:00	2004-11-16 00:00:00	2004-11-10 00:00:00	Shipped	\N	144
10327	2004-11-10 00:00:00	2004-11-19 00:00:00	2004-11-13 00:00:00	Resolved	Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don't match what was discussed.	145
10328	2004-11-12 00:00:00	2004-11-21 00:00:00	2004-11-18 00:00:00	Shipped	Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch	278
10329	2004-11-15 00:00:00	2004-11-24 00:00:00	2004-11-16 00:00:00	Shipped	\N	131
10330	2004-11-16 00:00:00	2004-11-25 00:00:00	2004-11-21 00:00:00	Shipped	\N	385
10331	2004-11-17 00:00:00	2004-11-23 00:00:00	2004-11-23 00:00:00	Shipped	Customer requested special shippment. The instructions were passed along to the warehouse	486
10332	2004-11-17 00:00:00	2004-11-25 00:00:00	2004-11-18 00:00:00	Shipped	\N	187
10333	2004-11-18 00:00:00	2004-11-27 00:00:00	2004-11-20 00:00:00	Shipped	\N	129
10334	2004-11-19 00:00:00	2004-11-28 00:00:00	\N	On Hold	The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.	144
10335	2004-11-19 00:00:00	2004-11-29 00:00:00	2004-11-23 00:00:00	Shipped	\N	124
10336	2004-11-20 00:00:00	2004-11-26 00:00:00	2004-11-24 00:00:00	Shipped	Customer requested that DHL is used for this shipping	172
10337	2004-11-21 00:00:00	2004-11-30 00:00:00	2004-11-26 00:00:00	Shipped	\N	424
10338	2004-11-22 00:00:00	2004-12-02 00:00:00	2004-11-27 00:00:00	Shipped	\N	381
10339	2004-11-23 00:00:00	2004-11-30 00:00:00	2004-11-30 00:00:00	Shipped	\N	398
10340	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-25 00:00:00	Shipped	Customer is interested in buying more Ferrari models	216
10341	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	382
10342	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-29 00:00:00	Shipped	\N	114
10343	2004-11-24 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	353
10344	2004-11-25 00:00:00	2004-12-02 00:00:00	2004-11-29 00:00:00	Shipped	\N	350
10345	2004-11-25 00:00:00	2004-12-01 00:00:00	2004-11-26 00:00:00	Shipped	\N	103
10346	2004-11-29 00:00:00	2004-12-05 00:00:00	2004-11-30 00:00:00	Shipped	\N	112
10347	2004-11-29 00:00:00	2004-12-07 00:00:00	2004-11-30 00:00:00	Shipped	Can we deliver the new Ford Mustang models by end-of-quarter?	114
10348	2004-11-01 00:00:00	2004-11-08 00:00:00	2004-11-05 00:00:00	Shipped	\N	458
10349	2004-12-01 00:00:00	2004-12-07 00:00:00	2004-12-03 00:00:00	Shipped	\N	151
10350	2004-12-02 00:00:00	2004-12-08 00:00:00	2004-12-05 00:00:00	Shipped	\N	141
10351	2004-12-03 00:00:00	2004-12-11 00:00:00	2004-12-07 00:00:00	Shipped	\N	324
10352	2004-12-03 00:00:00	2004-12-12 00:00:00	2004-12-09 00:00:00	Shipped	\N	198
10353	2004-12-04 00:00:00	2004-12-11 00:00:00	2004-12-05 00:00:00	Shipped	\N	447
10354	2004-12-04 00:00:00	2004-12-10 00:00:00	2004-12-05 00:00:00	Shipped	\N	323
10355	2004-12-07 00:00:00	2004-12-14 00:00:00	2004-12-13 00:00:00	Shipped	\N	141
10356	2004-12-09 00:00:00	2004-12-15 00:00:00	2004-12-12 00:00:00	Shipped	\N	250
10357	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-14 00:00:00	Shipped	\N	124
10358	2004-12-10 00:00:00	2004-12-16 00:00:00	2004-12-16 00:00:00	Shipped	Customer requested that DHL is used for this shipping	141
10359	2004-12-15 00:00:00	2004-12-23 00:00:00	2004-12-18 00:00:00	Shipped	\N	353
10360	2004-12-16 00:00:00	2004-12-22 00:00:00	2004-12-18 00:00:00	Shipped	\N	496
10361	2004-12-17 00:00:00	2004-12-24 00:00:00	2004-12-20 00:00:00	Shipped	\N	282
10362	2005-01-05 00:00:00	2005-01-16 00:00:00	2005-01-10 00:00:00	Shipped	\N	161
10363	2005-01-06 00:00:00	2005-01-12 00:00:00	2005-01-10 00:00:00	Shipped	\N	334
10364	2005-01-06 00:00:00	2005-01-17 00:00:00	2005-01-09 00:00:00	Shipped	\N	350
10365	2005-01-07 00:00:00	2005-01-18 00:00:00	2005-01-11 00:00:00	Shipped	\N	320
10366	2005-01-10 00:00:00	2005-01-19 00:00:00	2005-01-12 00:00:00	Shipped	\N	381
10367	2005-01-12 00:00:00	2005-01-21 00:00:00	2005-01-16 00:00:00	Resolved	This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx's investigation proved this wrong.	205
10368	2005-01-19 00:00:00	2005-01-27 00:00:00	2005-01-24 00:00:00	Shipped	Can we renegotiate this one?	124
10369	2005-01-20 00:00:00	2005-01-28 00:00:00	2005-01-24 00:00:00	Shipped	\N	379
10370	2005-01-20 00:00:00	2005-02-01 00:00:00	2005-01-25 00:00:00	Shipped	\N	276
10371	2005-01-23 00:00:00	2005-02-03 00:00:00	2005-01-25 00:00:00	Shipped	\N	124
10372	2005-01-26 00:00:00	2005-02-05 00:00:00	2005-01-28 00:00:00	Shipped	\N	398
10373	2005-01-31 00:00:00	2005-02-08 00:00:00	2005-02-06 00:00:00	Shipped	\N	311
10374	2005-02-02 00:00:00	2005-02-09 00:00:00	2005-02-03 00:00:00	Shipped	\N	333
10375	2005-02-03 00:00:00	2005-02-10 00:00:00	2005-02-06 00:00:00	Shipped	\N	119
10377	2005-02-09 00:00:00	2005-02-21 00:00:00	2005-02-12 00:00:00	Shipped	Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches	186
10378	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141
10379	2005-02-10 00:00:00	2005-02-18 00:00:00	2005-02-11 00:00:00	Shipped	\N	141
10380	2005-02-16 00:00:00	2005-02-24 00:00:00	2005-02-18 00:00:00	Shipped	\N	141
10381	2005-02-17 00:00:00	2005-02-25 00:00:00	2005-02-18 00:00:00	Shipped	\N	321
10382	2005-02-17 00:00:00	2005-02-23 00:00:00	2005-02-18 00:00:00	Shipped	Custom shipping instructions sent to warehouse	124
10383	2005-02-22 00:00:00	2005-03-02 00:00:00	2005-02-25 00:00:00	Shipped	\N	141
10384	2005-02-23 00:00:00	2005-03-06 00:00:00	2005-02-27 00:00:00	Shipped	\N	321
10385	2005-02-28 00:00:00	2005-03-09 00:00:00	2005-03-01 00:00:00	Shipped	\N	124
10386	2005-03-01 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Resolved	Disputed then Resolved on 3/15/2005. Customer doesn't like the craftsmaship of the models.	141
10387	2005-03-02 00:00:00	2005-03-09 00:00:00	2005-03-06 00:00:00	Shipped	We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.	148
10388	2005-03-03 00:00:00	2005-03-11 00:00:00	2005-03-09 00:00:00	Shipped	\N	462
10389	2005-03-03 00:00:00	2005-03-09 00:00:00	2005-03-08 00:00:00	Shipped	\N	448
10390	2005-03-04 00:00:00	2005-03-11 00:00:00	2005-03-07 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	124
10391	2005-03-09 00:00:00	2005-03-20 00:00:00	2005-03-15 00:00:00	Shipped	\N	276
10392	2005-03-10 00:00:00	2005-03-18 00:00:00	2005-03-12 00:00:00	Shipped	\N	452
10393	2005-03-11 00:00:00	2005-03-22 00:00:00	2005-03-14 00:00:00	Shipped	They want to reevaluate their terms agreement with Finance.	323
10394	2005-03-15 00:00:00	2005-03-25 00:00:00	2005-03-19 00:00:00	Shipped	\N	141
10395	2005-03-17 00:00:00	2005-03-24 00:00:00	2005-03-23 00:00:00	Shipped	We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.	250
10396	2005-03-23 00:00:00	2005-04-02 00:00:00	2005-03-28 00:00:00	Shipped	\N	124
10397	2005-03-28 00:00:00	2005-04-09 00:00:00	2005-04-01 00:00:00	Shipped	\N	242
10398	2005-03-30 00:00:00	2005-04-09 00:00:00	2005-03-31 00:00:00	Shipped	\N	353
10399	2005-04-01 00:00:00	2005-04-12 00:00:00	2005-04-03 00:00:00	Shipped	\N	496
10400	2005-04-01 00:00:00	2005-04-11 00:00:00	2005-04-04 00:00:00	Shipped	Customer requested that DHL is used for this shipping	450
10401	2005-04-03 00:00:00	2005-04-14 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	328
10402	2005-04-07 00:00:00	2005-04-14 00:00:00	2005-04-12 00:00:00	Shipped	\N	406
10403	2005-04-08 00:00:00	2005-04-18 00:00:00	2005-04-11 00:00:00	Shipped	\N	201
10404	2005-04-08 00:00:00	2005-04-14 00:00:00	2005-04-11 00:00:00	Shipped	\N	323
10405	2005-04-14 00:00:00	2005-04-24 00:00:00	2005-04-20 00:00:00	Shipped	\N	209
10406	2005-04-15 00:00:00	2005-04-25 00:00:00	2005-04-21 00:00:00	Disputed	Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.	145
10407	2005-04-22 00:00:00	2005-05-04 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	450
10408	2005-04-22 00:00:00	2005-04-29 00:00:00	2005-04-27 00:00:00	Shipped	\N	398
10409	2005-04-23 00:00:00	2005-05-05 00:00:00	2005-04-24 00:00:00	Shipped	\N	166
10410	2005-04-29 00:00:00	2005-05-10 00:00:00	2005-04-30 00:00:00	Shipped	\N	357
10411	2005-05-01 00:00:00	2005-05-08 00:00:00	2005-05-06 00:00:00	Shipped	\N	233
10412	2005-05-03 00:00:00	2005-05-13 00:00:00	2005-05-05 00:00:00	Shipped	\N	141
10413	2005-05-05 00:00:00	2005-05-14 00:00:00	2005-05-09 00:00:00	Shipped	Customer requested that DHL is used for this shipping	175
10414	2005-05-06 00:00:00	2005-05-13 00:00:00	\N	On Hold	Customer credit limit exceeded. Will ship when a payment is received.	362
10415	2005-05-09 00:00:00	2005-05-20 00:00:00	2005-05-12 00:00:00	Disputed	Customer claims the scales of the models don't match what was discussed. I keep all the paperwork though to prove otherwise	471
10416	2005-05-10 00:00:00	2005-05-16 00:00:00	2005-05-14 00:00:00	Shipped	\N	386
10417	2005-05-13 00:00:00	2005-05-19 00:00:00	2005-05-19 00:00:00	Disputed	Customer doesn't like the colors and precision of the models.	141
10418	2005-05-16 00:00:00	2005-05-24 00:00:00	2005-05-20 00:00:00	Shipped	\N	412
10419	2005-05-17 00:00:00	2005-05-28 00:00:00	2005-05-19 00:00:00	Shipped	\N	382
10420	2005-05-29 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	282
10421	2005-05-29 00:00:00	2005-06-06 00:00:00	\N	In Process	Custom shipping instructions were sent to warehouse	124
10422	2005-05-30 00:00:00	2005-06-11 00:00:00	\N	In Process	\N	157
10423	2005-05-30 00:00:00	2005-06-05 00:00:00	\N	In Process	\N	314
10424	2005-05-31 00:00:00	2005-06-08 00:00:00	\N	In Process	\N	141
10425	2005-05-31 00:00:00	2005-06-07 00:00:00	\N	In Process	\N	119
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY payments (customernumber, checknumber, paymentdate, amount) FROM stdin;
103	HQ336336	2004-10-19 00:00:00	5308
103	JM555205	2003-06-05 00:00:00	16560
103	OM314933	2004-12-18 00:00:00	2312
112	BO864823	2004-12-17 00:00:00	14450
112	HQ55022	2003-06-06 00:00:00	33848
112	ND748579	2004-08-20 00:00:00	34454
114	GG31455	2003-05-20 00:00:00	50398
114	MA765515	2004-12-15 00:00:00	85591
114	NP603840	2003-05-31 00:00:00	9738
114	NR27552	2004-03-10 00:00:00	49638
119	DB933704	2004-11-14 00:00:00	20720
119	LN373447	2004-08-08 00:00:00	56003
119	NG94694	2005-02-22 00:00:00	59617
121	DB889831	2003-02-16 00:00:00	54702
121	FD317790	2003-10-28 00:00:00	1475
121	KI831359	2004-11-04 00:00:00	19770
121	MA302151	2004-11-28 00:00:00	40653
124	AE215433	2005-02-18 00:00:00	51826
124	AQ50522	2005-06-03 00:00:00	32195
124	BG255406	2004-08-28 00:00:00	93929
124	CQ287967	2003-04-11 00:00:00	12399
124	ET64396	2005-04-16 00:00:00	121973
124	HI366474	2004-12-27 00:00:00	50548
124	HR86578	2004-11-02 00:00:00	63075
124	KI131716	2003-08-15 00:00:00	122369
124	LF217299	2004-03-26 00:00:00	48923
124	NT141748	2003-11-25 00:00:00	50361
128	DI925118	2003-01-28 00:00:00	11432
128	FA465482	2003-10-18 00:00:00	27258
128	FH668230	2004-03-24 00:00:00	37266
128	IP383901	2004-11-18 00:00:00	9215
129	DM826140	2004-12-08 00:00:00	30349
129	ID449593	2003-12-11 00:00:00	25432
129	PI42991	2003-04-09 00:00:00	18696
131	CL442705	2003-03-12 00:00:00	25784
131	KG113538	2004-05-22 00:00:00	45358
131	MA724562	2004-12-02 00:00:00	53152
131	NB445135	2004-09-11 00:00:00	39776
141	AU364101	2003-07-19 00:00:00	39616
141	DB583216	2004-11-01 00:00:00	34872
141	DL460618	2005-05-19 00:00:00	22354
141	HJ32686	2004-01-30 00:00:00	65165
141	ID10962	2004-12-31 00:00:00	133589
141	IN446258	2005-03-25 00:00:00	95065
141	JE105477	2005-03-18 00:00:00	90136
141	JN355280	2003-10-26 00:00:00	53502
141	JN722010	2003-02-25 00:00:00	44622
141	KT52578	2003-12-09 00:00:00	72488
141	MC46946	2004-07-09 00:00:00	91328
141	MF629602	2004-08-16 00:00:00	21986
141	NU627706	2004-05-17 00:00:00	28328
144	IR846303	2004-12-12 00:00:00	66006
144	LA685678	2003-04-09 00:00:00	9749
145	CN328545	2004-07-03 00:00:00	4749
145	ED39322	2004-04-26 00:00:00	31330
145	HR182688	2004-12-01 00:00:00	24079
145	JJ246391	2003-02-20 00:00:00	58871
146	FP549817	2004-03-18 00:00:00	46802
146	FU793410	2004-01-16 00:00:00	54537
146	LJ160635	2003-12-10 00:00:00	41535
148	BI507030	2003-04-22 00:00:00	43657
148	DD635282	2004-08-11 00:00:00	3128
148	KM172879	2003-12-26 00:00:00	122029
148	ME497970	2005-03-27 00:00:00	4176
151	BF686658	2003-12-22 00:00:00	64316
151	GB852215	2004-07-26 00:00:00	23252
151	IP568906	2003-06-18 00:00:00	68462
151	KI884577	2004-12-14 00:00:00	41707
157	HI618861	2004-11-19 00:00:00	44041
157	NN711988	2004-09-07 00:00:00	71931
161	BR352384	2004-11-14 00:00:00	2916
161	BR478494	2003-11-18 00:00:00	62305
161	KG644125	2005-02-02 00:00:00	13530
161	NI908214	2003-08-05 00:00:00	42032
166	BQ327613	2004-09-16 00:00:00	42903
166	DC979307	2004-07-07 00:00:00	45789
166	LA318629	2004-02-28 00:00:00	24220
167	ED743615	2004-09-19 00:00:00	16363
167	GN228846	2003-12-03 00:00:00	95277
171	GB878038	2004-03-15 00:00:00	20178
171	IL104425	2003-11-22 00:00:00	48874
172	AD832091	2004-09-09 00:00:00	2174
172	CE51751	2004-12-04 00:00:00	56813
172	EH208589	2003-04-20 00:00:00	38217
173	GP545698	2004-05-13 00:00:00	14381
173	IG462397	2004-03-29 00:00:00	21783
175	IO448913	2003-11-19 00:00:00	26116
175	PI15215	2004-07-10 00:00:00	44131
177	AU750837	2004-04-17 00:00:00	17114
177	CI381435	2004-01-19 00:00:00	50491
181	CM564612	2004-04-25 00:00:00	24804
181	GQ132144	2003-01-30 00:00:00	6864
181	OH367219	2004-11-16 00:00:00	56373
186	AE192287	2005-03-10 00:00:00	26423
186	AK412714	2003-10-27 00:00:00	42084
186	KA602407	2004-10-21 00:00:00	42744
187	AM968797	2004-11-03 00:00:00	57828
187	BQ39062	2004-12-08 00:00:00	48962
187	KL124726	2003-03-27 00:00:00	51018
189	BO711618	2004-10-03 00:00:00	18972
189	NM916675	2004-03-01 00:00:00	38784
198	FI192930	2004-12-06 00:00:00	11529
198	HQ920205	2003-07-06 00:00:00	7277
198	IS946883	2004-09-21 00:00:00	7673
201	DP677013	2003-10-20 00:00:00	26797
201	OO846801	2004-06-15 00:00:00	50408
202	HI358554	2003-12-18 00:00:00	38662
202	IQ627690	2004-11-08 00:00:00	36577
204	GC697638	2004-08-13 00:00:00	52505
204	IS150005	2004-09-24 00:00:00	4693
205	GL756480	2003-12-04 00:00:00	4512
205	LL562733	2003-09-05 00:00:00	55776
205	NM739638	2005-02-06 00:00:00	44273
209	ED520529	2004-06-21 00:00:00	5417
209	PH785937	2004-05-04 00:00:00	39341
211	BJ535230	2003-12-09 00:00:00	48784
216	BG407567	2003-05-09 00:00:00	4219
216	ML780814	2004-12-06 00:00:00	21250
216	MM342086	2003-12-14 00:00:00	44009
219	BN17870	2005-03-02 00:00:00	3987
219	BR941480	2003-10-18 00:00:00	5142
227	MQ413968	2003-10-31 00:00:00	40322
227	NU21326	2004-11-02 00:00:00	60274
233	II180006	2004-07-01 00:00:00	24565
233	JG981190	2003-11-18 00:00:00	15947
239	NQ865547	2004-03-15 00:00:00	87489
240	IF245157	2004-11-16 00:00:00	51334
240	JO719695	2004-03-28 00:00:00	26907
242	AF40894	2003-11-22 00:00:00	38098
242	HR224331	2005-06-03 00:00:00	15139
242	KI744716	2003-07-21 00:00:00	17251
249	IJ399820	2004-09-19 00:00:00	38039
249	NE404084	2004-09-04 00:00:00	56078
250	EQ12267	2005-05-17 00:00:00	20322
250	HD284647	2004-12-30 00:00:00	32624
250	HN114306	2003-07-18 00:00:00	25625
256	EP227123	2004-02-10 00:00:00	5759
256	HE84936	2004-10-22 00:00:00	59075
259	EU280955	2004-11-06 00:00:00	68943
259	GB361972	2003-12-07 00:00:00	31363
260	IO164641	2004-08-30 00:00:00	43332
260	NH776924	2004-04-24 00:00:00	31303
276	EM979878	2005-02-09 00:00:00	29852
276	KM841847	2003-11-13 00:00:00	41792
276	LE432182	2003-09-28 00:00:00	47192
276	OJ819725	2005-04-30 00:00:00	35160
278	BJ483870	2004-12-05 00:00:00	41697
278	GP636783	2003-03-02 00:00:00	56181
278	NI983021	2003-11-24 00:00:00	40078
282	IA793562	2003-08-03 00:00:00	28397
282	JT819493	2004-08-02 00:00:00	41297
282	OD327378	2005-01-03 00:00:00	37905
286	DR578578	2004-10-28 00:00:00	54252
286	KH910279	2004-09-05 00:00:00	48829
298	AJ574927	2004-03-13 00:00:00	50433
298	LF501133	2004-09-18 00:00:00	67281
299	AD304085	2003-10-24 00:00:00	45079
299	NR157385	2004-09-05 00:00:00	34145
311	DG336041	2005-02-15 00:00:00	49055
311	FA728475	2003-10-06 00:00:00	37502
311	NQ966143	2004-04-25 00:00:00	17813
314	LQ244073	2004-08-09 00:00:00	47760
314	MD809704	2004-03-03 00:00:00	18800
319	HL685576	2004-11-06 00:00:00	46873
319	OM548174	2003-12-07 00:00:00	38683
320	GJ597719	2005-01-18 00:00:00	11021
320	HO576374	2003-08-20 00:00:00	45738
320	MU817160	2003-11-24 00:00:00	52191
321	DJ15149	2003-11-03 00:00:00	95679
321	LA556321	2005-03-15 00:00:00	54204
323	AL493079	2005-05-23 00:00:00	39268
323	ES347491	2004-06-24 00:00:00	40035
323	HG738664	2003-07-05 00:00:00	2477
323	PQ803830	2004-12-24 00:00:00	43931
324	DQ409197	2004-12-13 00:00:00	13740
324	FP443161	2003-07-07 00:00:00	32376
324	HB150714	2003-11-23 00:00:00	42688
328	EN930356	2004-04-16 00:00:00	8722
328	NR631421	2004-05-30 00:00:00	27987
333	HL209210	2003-11-15 00:00:00	27099
333	JK479662	2003-10-17 00:00:00	10640
333	NF959653	2005-03-01 00:00:00	21730
334	CS435306	2005-01-27 00:00:00	51373
334	HH517378	2003-08-16 00:00:00	31569
334	LF737277	2004-05-22 00:00:00	31018
339	AP286625	2004-10-24 00:00:00	27445
339	DA98827	2003-11-28 00:00:00	40062
344	AF246722	2003-11-24 00:00:00	34311
344	NJ906924	2004-04-02 00:00:00	15331
347	DG700707	2004-01-18 00:00:00	23889
347	LG808674	2003-10-24 00:00:00	24159
350	BQ602907	2004-12-11 00:00:00	20137
350	CI471510	2003-05-25 00:00:00	52482
350	OB648482	2005-01-29 00:00:00	2317
353	CO351193	2005-01-10 00:00:00	48896
353	ED878227	2003-07-21 00:00:00	15146
353	GT878649	2003-05-21 00:00:00	18972
353	HJ618252	2005-06-09 00:00:00	52029
357	AG240323	2003-12-16 00:00:00	23295
357	NB291497	2004-07-01 00:00:00	41419
362	FP170292	2004-07-11 00:00:00	19548
362	OG208861	2004-09-21 00:00:00	15345
363	HL575273	2004-11-17 00:00:00	55571
363	IS232033	2003-01-16 00:00:00	12133
363	PN238558	2003-12-05 00:00:00	63981
379	CA762595	2005-02-12 00:00:00	31475
379	FR499138	2003-09-16 00:00:00	34992
379	GB890854	2004-08-02 00:00:00	15111
381	BC726082	2004-12-03 00:00:00	13463
381	CC475233	2003-04-19 00:00:00	1711
381	GB117430	2005-02-03 00:00:00	16628
381	MS154481	2003-08-22 00:00:00	1637
382	CC871084	2003-05-12 00:00:00	38629
382	CT821147	2004-08-01 00:00:00	6693
382	PH29054	2004-11-27 00:00:00	37353
385	BN347084	2003-12-02 00:00:00	22842
385	CP804873	2004-11-19 00:00:00	15929
385	EK785462	2003-03-09 00:00:00	55245
386	DO106109	2003-11-18 00:00:00	44670
386	HG438769	2004-07-18 00:00:00	56422
398	AJ478695	2005-02-14 00:00:00	38191
398	DO787644	2004-06-21 00:00:00	25929
398	KB54275	2004-11-29 00:00:00	44802
406	HJ217687	2004-01-28 00:00:00	51173
406	NA197101	2004-06-17 00:00:00	27931
412	GH197075	2004-07-25 00:00:00	35912
412	PJ434867	2004-04-14 00:00:00	36409
415	ER54537	2004-09-28 00:00:00	34994
424	KF480160	2004-12-07 00:00:00	27733
424	LM271923	2003-04-16 00:00:00	24777
424	OA595449	2003-10-31 00:00:00	25285
447	AO757239	2003-09-15 00:00:00	7600
447	ER615123	2003-06-25 00:00:00	20351
447	OU516561	2004-12-17 00:00:00	29343
448	EQ620556	2003-11-06 00:00:00	48711
448	FS299615	2005-04-18 00:00:00	31607
448	KR822727	2004-09-30 00:00:00	53942
450	EF485824	2004-06-21 00:00:00	64600
452	ED473873	2003-11-15 00:00:00	28551
452	FN640986	2003-11-20 00:00:00	14938
452	HG635467	2005-05-03 00:00:00	8775
455	HA777606	2003-12-05 00:00:00	42499
455	IR662429	2004-05-12 00:00:00	36973
456	GJ715659	2004-11-13 00:00:00	31446
456	MO743231	2004-04-30 00:00:00	1699
458	DD995006	2004-11-15 00:00:00	34547
458	NA377824	2004-02-06 00:00:00	24995
458	OO606861	2003-06-13 00:00:00	61073
462	ED203908	2005-04-15 00:00:00	37558
462	GC60330	2003-11-08 00:00:00	11862
462	PE176846	2004-11-27 00:00:00	49504
471	AB661578	2004-07-28 00:00:00	12335
471	CO645196	2003-12-10 00:00:00	37879
473	LL427009	2004-02-17 00:00:00	7279
473	PC688499	2003-10-27 00:00:00	21673
475	JP113227	2003-12-09 00:00:00	8235
475	PB951268	2004-02-13 00:00:00	37850
484	GK294076	2004-10-26 00:00:00	3221
484	JH546765	2003-11-29 00:00:00	51503
486	BL66528	2004-04-14 00:00:00	7287
486	HS86661	2004-11-23 00:00:00	48996
486	JB117768	2003-03-20 00:00:00	27399
487	AH612904	2003-09-28 00:00:00	34100
487	PT550181	2004-02-29 00:00:00	16118
489	OC773849	2003-12-04 00:00:00	27542
489	PO860906	2004-01-31 00:00:00	8477
495	BH167026	2003-12-26 00:00:00	63731
495	FN155234	2004-05-14 00:00:00	7129
496	EU531600	2005-06-25 00:00:00	34332
496	MB342426	2003-07-16 00:00:00	37754
496	MN89921	2004-12-31 00:00:00	58593
496	PL783960	2003-11-29 00:00:00	26421
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY products (productcode, productname, productline, productscale, productvendor, productdescription, quantityinstock, buyprice, msrp) FROM stdin;
S10_1678	1969 Harley Davidson Ultimate Chopper	Motorcycles	1:10	Min Lin Diecast	This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.	7933	49	96
S10_1949	1952 Alpine Renault 1300	Classic Cars	1:10	Classic Metal Creations	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	7305	99	214
S10_2016	1996 Moto Guzzi 1100i	Motorcycles	1:10	Highway 66 Mini Classics	Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	6625	69	119
S10_4698	2003 Harley-Davidson Eagle Drag Bike	Motorcycles	1:10	Red Start Diecast	Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine	5582	91	194
S10_4757	1972 Alfa Romeo GTA	Classic Cars	1:10	Motor City Art Classics	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3252	86	136
S10_4962	1962 LanciaA Delta 16V	Classic Cars	1:10	Second Gear Diecast	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6791	103	148
S12_1099	1968 Ford Mustang	Classic Cars	1:12	Autoart Studio Design	Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.	68	95	195
S12_1108	2001 Ferrari Enzo	Classic Cars	1:12	Second Gear Diecast	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	3619	96	208
S12_1666	1958 Setra Bus	Trucks and Buses	1:12	Welly Diecast Productions	Model features 30 windows, skylights & glare resistant glass, working steering system, original logos	1579	78	137
S12_2823	2002 Suzuki XREO	Motorcycles	1:12	Unimax Art Galleries	Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.	9997	66	151
S12_3148	1969 Corvair Monza	Classic Cars	1:18	Welly Diecast Productions	1:18 scale die-cast about 10 long doors open, hood opens, trunk opens and wheels roll	6906	89	151
S12_3380	1968 Dodge Charger	Classic Cars	1:12	Welly Diecast Productions	1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black	9123	75	117
S12_3891	1969 Ford Falcon	Classic Cars	1:12	Second Gear Diecast	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	1049	83	173
S12_3990	1970 Plymouth Hemi Cuda	Classic Cars	1:12	Studio M Art Models	Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.	5663	32	80
S12_4473	1957 Chevy Pickup	Trucks and Buses	1:12	Exoto Designs	1:12 scale die-cast about 20 long Hood opens, Rubber wheels	6125	56	119
S12_4675	1969 Dodge Charger	Classic Cars	1:12	Welly Diecast Productions	Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.	7323	59	115
S18_1097	1940 Ford Pickup Truck	Trucks and Buses	1:18	Studio M Art Models	This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box	2613	58	117
S18_1129	1993 Mazda RX-7	Classic Cars	1:18	Highway 66 Mini Classics	This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.	3975	84	142
S18_1342	1937 Lincoln Berline	Vintage Cars	1:18	Motor City Art Classics	Features opening engine cover, doors, trunk, and fuel filler cap. Color black	8693	61	103
S18_1367	1936 Mercedes-Benz 500K Special Roadster	Vintage Cars	1:18	Studio M Art Models	This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.	8635	24	54
S18_1589	1965 Aston Martin DB5	Classic Cars	1:18	Classic Metal Creations	Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.	9042	66	124
S18_1662	1980s Black Hawk Helicopter	Planes	1:18	Red Start Diecast	1:18 scale replica of actual Army's UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.	5330	77	158
S18_1749	1917 Grand Touring Sedan	Vintage Cars	1:18	Welly Diecast Productions	This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.	2724	87	170
S18_1889	1948 Porsche 356-A Roadster	Classic Cars	1:18	Gearbox Collectibles	This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	8826	54	77
S24_3949	Corsair F4U ( Bird Cage)	Planes	1:24	Second Gear Diecast	Has retractable wheels and comes with a stand. Official logos and insignias.	6812	29	68
S700_3962	The Queen Mary	Ships	1:700	Welly Diecast Productions	Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	5088	54	99
S18_1984	1995 Honda Civic	Classic Cars	1:18	Min Lin Diecast	This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.	9772	94	142
S18_2238	1998 Chrysler Plymouth Prowler	Classic Cars	1:18	Gearbox Collectibles	Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	4724	102	164
S18_2248	1911 Ford Town Car	Vintage Cars	1:18	Motor City Art Classics	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system	540	33	61
S18_2319	1964 Mercedec Tour Bus	Trucks and Buses	1:18	Unimax Art Galleries	Exact replica. 100+ parts. working steering system, original logos	8258	75	123
S18_2325	1932 Model A Ford J-Coupe	Vintage Cars	1:18	Autoart Studio Design	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine	9354	58	127
S18_2432	1926 Ford Fire Engine	Trucks and Buses	1:18	Carousel DieCast Legends	Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.	2018	25	61
S18_2581	P-51-D Mustang	Planes	1:72	Gearbox Collectibles	Has retractable wheels and comes with a stand	992	49	84
S18_2625	1936 Harley Davidson El Knucklehead	Motorcycles	1:18	Welly Diecast Productions	Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.	4357	24	61
S18_2795	1928 Mercedes-Benz SSK	Vintage Cars	1:18	Gearbox Collectibles	This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.	548	73	169
S18_2870	1999 Indy 500 Monte Carlo SS	Classic Cars	1:18	Red Start Diecast	Features include opening and closing doors. Color: Red	8164	57	132
S18_2949	1913 Ford Model T Speedster	Vintage Cars	1:18	Carousel DieCast Legends	This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.	4189	61	101
S18_2957	1934 Ford V8 Coupe	Vintage Cars	1:18	Min Lin Diecast	Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System	5649	34	62
S18_3029	1999 Yamaha Speed Boat	Ships	1:18	Min Lin Diecast	Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	4259	52	86
S18_3136	18th Century Vintage Horse Carriage	Vintage Cars	1:18	Red Start Diecast	Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.	5992	61	105
S18_3140	1903 Ford Model A	Vintage Cars	1:18	Unimax Art Galleries	Features opening trunk,  working steering system	3913	68	137
S18_3232	1992 Ferrari 360 Spider red	Classic Cars	1:18	Unimax Art Galleries	his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	8347	78	169
S18_3233	1985 Toyota Supra	Classic Cars	1:18	Highway 66 Mini Classics	This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box	7733	57	108
S18_3259	Collectable Wooden Train	Trains	1:18	Carousel DieCast Legends	Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.	6450	68	101
S18_3278	1969 Dodge Super Bee	Classic Cars	1:18	Min Lin Diecast	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	1917	49	80
S18_3320	1917 Maxwell Touring Car	Vintage Cars	1:18	Exoto Designs	Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System	7913	58	99
S18_3482	1976 Ford Gran Torino	Classic Cars	1:18	Gearbox Collectibles	Highly detailed 1976 Ford Gran Torino Starsky and Hutch diecast model. Very well constructed and painted in red and white patterns.	9127	73	147
S18_3685	1948 Porsche Type 356 Roadster	Classic Cars	1:18	Gearbox Collectibles	This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.	8990	62	141
S18_3782	1957 Vespa GS150	Motorcycles	1:18	Studio M Art Models	Features rotating wheels , working kick stand. Comes with stand.	7689	33	62
S18_3856	1941 Chevrolet Special Deluxe Cabriolet	Vintage Cars	1:18	Exoto Designs	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.	2378	65	106
S18_4027	1970 Triumph Spitfire	Classic Cars	1:18	Min Lin Diecast	Features include opening and closing doors. Color: White.	5545	92	144
S18_4409	1932 Alfa Romeo 8C2300 Spider Sport	Vintage Cars	1:18	Exoto Designs	This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.	6553	43	92
S18_4522	1904 Buick Runabout	Vintage Cars	1:18	Exoto Designs	Features opening trunk,  working steering system	8290	53	88
S18_4600	1940s Ford truck	Trucks and Buses	1:18	Motor City Art Classics	This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940's Pick-Up truck is painted in classic dark green color, and features rotating wheels.	3128	85	121
S18_4668	1939 Cadillac Limousine	Vintage Cars	1:18	Studio M Art Models	Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles	6645	23	50
S18_4721	1957 Corvette Convertible	Classic Cars	1:18	Classic Metal Creations	1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.	1249	70	149
S18_4933	1957 Ford Thunderbird	Classic Cars	1:18	Studio M Art Models	This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.	3209	34	71
S24_1046	1970 Chevy Chevelle SS 454	Classic Cars	1:24	Unimax Art Galleries	This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.	1005	49	73
S24_1444	1970 Dodge Coronet	Classic Cars	1:24	Highway 66 Mini Classics	1:24 scale die-cast about 18 long doors open, hood opens and rubber wheels	4074	32	58
S24_1578	1997 BMW R 1100 S	Motorcycles	1:24	Autoart Studio Design	Detailed scale replica with working suspension and constructed from over 70 parts	7003	61	113
S24_1628	1966 Shelby Cobra 427 S/C	Classic Cars	1:24	Carousel DieCast Legends	This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it's own display case.	8197	29	50
S24_1785	1928 British Royal Navy Airplane	Planes	1:24	Classic Metal Creations	Official logos and insignias	3627	67	109
S24_1937	1939 Chevrolet Deluxe Coupe	Vintage Cars	1:24	Motor City Art Classics	This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.	7332	23	33
S24_2000	1960 BSA Gold Star DBD34 1960	Motorcycles	1:24	Highway 66 Mini Classics	Detailed scale replica with working suspension and constructed from over 70 parts	15	37	76
S24_2011	18th century schooner	Ships	1:24	Carousel DieCast Legends	All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.	1898	82	123
S24_2022	1938 Cadillac V-16 Presidential Limousine	Vintage Cars	1:24	Classic Metal Creations	This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.	2847	21	45
S24_2300	1962 Volkswagen Microbus	Trucks and Buses	1:24	Autoart Studio Design	This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.	2327	61	128
S24_2360	1982 Ducati 900 Monster	Motorcycles	1:24	Highway 66 Mini Classics	Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand	6840	47	69
S24_2766	1949 Jaguar XK 120	Classic Cars	1:24	Classic Metal Creations	Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	2350	47	91
S24_2840	1958 Chevy Corvette Limited Edition	Classic Cars	1:24	Carousel DieCast Legends	The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.	2542	16	35
S24_2841	1900s Vintage Bi-Plane	Planes	1:24	Autoart Studio Design	Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.	5942	34	69
S24_2887	1952 Citroen-15CV	Classic Cars	1:24	Exoto Designs	Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.	1452	73	117
S24_2972	1982 Lamborghini Diablo	Classic Cars	1:24	Second Gear Diecast	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	7723	16	38
S24_3151	1912 Ford Model T Delivery Wagon	Vintage Cars	1:24	Min Lin Diecast	This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.	9173	47	89
S24_3191	1969 Chevrolet Camaro Z28	Classic Cars	1:24	Exoto Designs	1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.	4695	51	86
S24_3371	1971 Alpine Renault 1600s	Classic Cars	1:24	Welly Diecast Productions	This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	7995	39	61
S24_3420	1937 Horch 930V Limousine	Vintage Cars	1:24	Autoart Studio Design	Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system	2902	26	66
S24_3432	2002 Chevy Corvette	Classic Cars	1:24	Gearbox Collectibles	The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.	9446	62	107
S24_3816	1940 Ford Delivery Sedan	Vintage Cars	1:24	Carousel DieCast Legends	Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.	6621	49	84
S24_3856	1956 Porsche 356A Coupe	Classic Cars	1:18	Classic Metal Creations	Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.	6600	98	140
S24_3969	1936 Mercedes Benz 500k Roadster	Vintage Cars	1:24	Red Start Diecast	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.	2081	22	41
S24_4048	1992 Porsche Cayenne Turbo Silver	Classic Cars	1:24	Exoto Designs	This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.	6582	70	118
S24_4258	1936 Chrysler Airflow	Vintage Cars	1:24	Second Gear Diecast	Features opening trunk,  working steering system. Color dark green.	4710	57	97
S24_4278	1900s Vintage Tri-Plane	Planes	1:24	Unimax Art Galleries	Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.	2756	36	72
S24_4620	1961 Chevrolet Impala	Classic Cars	1:18	Classic Metal Creations	This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.	7869	32	81
S32_1268	1980's GM Manhattan Express	Trucks and Buses	1:32	Motor City Art Classics	This 1980's era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.	5099	54	96
S32_1374	1997 BMW F650 ST	Motorcycles	1:32	Exoto Designs	Features official die-struck logos and baked enamel finish. Comes with stand.	178	67	100
S32_2206	1982 Ducati 996 R	Motorcycles	1:32	Gearbox Collectibles	Features rotating wheels , working kick stand. Comes with stand.	9241	24	40
S32_2509	1954 Greyhound Scenicruiser	Trucks and Buses	1:32	Classic Metal Creations	Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos	2874	26	54
S32_3207	1950's Chicago Surface Lines Streetcar	Trains	1:32	Gearbox Collectibles	This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).	8601	27	62
S32_3522	1996 Peterbilt 379 Stake Bed with Outrigger	Trucks and Buses	1:32	Red Start Diecast	This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab	814	34	65
S32_4289	1928 Ford Phaeton Deluxe	Vintage Cars	1:32	Highway 66 Mini Classics	This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system	136	33	69
S32_4485	1974 Ducati 350 Mk3 Desmo	Motorcycles	1:32	Second Gear Diecast	This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand	3341	56	102
S50_1341	1930 Buick Marquette Phaeton	Vintage Cars	1:50	Studio M Art Models	Features opening trunk,  working steering system	7062	27	44
S50_1392	Diamond T620 Semi-Skirted Tanker	Trucks and Buses	1:50	Highway 66 Mini Classics	This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.	1016	68	116
S50_1514	1962 City of Detroit Streetcar	Trains	1:50	Classic Metal Creations	This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).	1645	37	59
S50_4713	2002 Yamaha YZR M1	Motorcycles	1:50	Autoart Studio Design	Features rotating wheels , working kick stand. Comes with stand.	600	34	81
S700_1138	The Schooner Bluenose	Ships	1:700	Autoart Studio Design	All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.	1897	34	67
S700_1691	American Airlines: B767-300	Planes	1:700	Min Lin Diecast	Exact replia with official logos and insignias and retractable wheels	5841	51	91
S700_1938	The Mayflower	Ships	1:700	Studio M Art Models	Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.\r\n\r\nThe Mayfower was already old in 1620, when the pilgrims charted her to bring their band of 103 to North America.	737	43	87
S700_2047	HMS Bounty	Ships	1:700	Unimax Art Galleries	Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.	3501	40	91
S700_2466	America West Airlines B757-200	Planes	1:700	Motor City Art Classics	Official logos and insignias. Working steering system. Rotating jet engines	9653	69	100
S700_2610	The USS Constitution Ship	Ships	1:700	Red Start Diecast	All wood with canvas sails. Measures 31 1/2 Length x 22 3/8 High x 8 1/4 Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.\r\n\r\nThis was one of six warships commissioned by George Washington and launched in 1797. The nickname Old Ironsides was given the ship when British cannonballs bounced off the 21-inch oak planking of the American frigate's hull. The Constitution has been restored and now resides in Boston Harbor.	7083	34	72
S700_2824	1982 Camaro Z28	Classic Cars	1:18	Carousel DieCast Legends	Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2 Long.	6934	47	101
S700_2834	ATA: B757-300	Planes	1:700	Highway 66 Mini Classics	Exact replia with official logos and insignias and retractable wheels	7106	59	119
S700_3167	F/A 18 Hornet 1/72	Planes	1:72	Motor City Art Classics	10 Wingspan with retractable landing gears.Comes with pilot	551	54	80
S700_3505	The Titanic	Ships	1:700	Carousel DieCast Legends	Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.	1956	51	100
S700_4002	American Airlines: MD-11S	Planes	1:700	Second Gear Diecast	Polished finish. Exact replia with official logos and insignias and retractable wheels	8820	36	74
S72_1253	Boeing X-32A JSF	Planes	1:72	Motor City Art Classics	10 Wingspan with retractable landing gears.Comes with pilot	4857	33	50
S72_3212	Pont Yacht	Ships	1:72	Unimax Art Galleries	Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged	414	33	55
\.


--
-- Data for Name: quadrant_actuals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quadrant_actuals (region, department, positiontitle, actual, budget, variance) FROM stdin;
Central	Sales	District Manager	682625.0000	617250.0000	-65375.0000
Central	Sales	Senior Sales Rep	497223.0000	484820.0000	-12403.0000
Central	Sales	Sales Rep	675975.0000	612500.0000	-63475.0000
Central	Sales	Account Executive	409975.0000	422500.0000	12525.0000
Central	Sales	Pre-Sales	649375.0000	593500.0000	-55875.0000
Central	Executive Management	CEO	549625.0000	522250.0000	-27375.0000
Central	Executive Management	SVP WW Operations	476000.0000	725887.0000	249887.0000
Central	Executive Management	SVP Strategic Development	383242.0000	403405.0000	20163.0000
Central	Executive Management	SVP Partnerships	367415.0000	392100.0000	24685.0000
Central	Finance	CFO	770272.0000	719855.0000	-50417.0000
Central	Finance	Administrative Assistant	827861.0000	760990.0000	-66871.0000
Central	Finance	IS	570759.0000	577346.0000	6587.0000
Central	Finance	Controller	570373.0000	577070.0000	6697.0000
Central	Finance	Payroll	367415.0000	432100.0000	64685.0000
Central	Human Resource	Administration	549625.0000	552250.0000	2625.0000
Central	Human Resource	SVP HR	574895.0000	570300.0000	-4595.0000
Central	Human Resource	HR Generalists	856190.0000	771225.0000	-84965.0000
Central	Human Resource	HR Training	397473.0000	443570.0000	46097.0000
Central	Human Resource	Sexual Harassment	530473.0000	538570.0000	8097.0000
Central	Human Resource	EOE	530207.0000	538380.0000	8173.0000
Central	Marketing & Communication	CMO	827861.0000	760990.0000	-66871.0000
Central	Marketing & Communication	Product Marketing Mgr	693531.0000	665040.0000	-28491.0000
Central	Marketing & Communication	Analyst Relations	383375.0000	443500.0000	60125.0000
Central	Marketing & Communication	Press Relations	497296.0000	524872.0000	27576.0000
Central	Marketing & Communication	Graphics	782375.0000	728500.0000	-53875.0000
Central	Marketing & Communication	Writer	405985.0000	459650.0000	53665.0000
Central	Product Development	CTO	405985.0000	459650.0000	53665.0000
Central	Product Development	VP Engineering	383242.0000	443405.0000	60163.0000
Central	Product Development	Senior Engineer	770272.0000	719855.0000	-50417.0000
Central	Product Development	Engineer	695925.0000	666750.0000	-29175.0000
Central	Product Development	QA Manager	374863.0000	437420.0000	62557.0000
Central	Product Development	QA Engineer	367415.0000	432100.0000	64685.0000
Central	Professional Services	SVP Services	4042220.0000	4180000.0000	137780.0000
Central	Professional Services	Services Mgr	4401586.0000	4680000.0000	278414.0000
Central	Professional Services	Senior Consultant	3994859.0000	3980000.0000	-14859.0000
Central	Professional Services	Staff Consultant	3824426.0000	4180000.0000	355574.0000
Central	Professional Services	Trainer	3804948.0000	3380000.0000	-424948.0000
Eastern	Sales	District Manager	700000.0000	700250.0000	250.0000
Eastern	Sales	Senior Sales Rep	421200.0000	433299.0000	12099.0000
Eastern	Sales	Sales Rep	690000.0000	690675.0000	675.0000
Eastern	Sales	Account Executive	290000.0000	307675.0000	17675.0000
Eastern	Sales	Pre-Sales	650000.0000	652375.0000	2375.0000
Eastern	Executive Management	CEO	500000.0000	488750.0000	-11250.0000
Eastern	Executive Management	SVP WW Operations	249800.0000	249184.0000	-616.0000
Eastern	Executive Management	SVP Strategic Development	226000.0000	226395.0000	395.0000
Eastern	Executive Management	SVP Partnerships	531780.0000	519179.0000	-12601.0000
Eastern	Finance	CFO	831800.0000	816449.0000	-15351.0000
Eastern	Finance	Administrative Assistant	918400.0000	899368.0000	-19032.0000
Eastern	Finance	IS	531780.0000	529179.0000	-2601.0000
Eastern	Finance	Controller	531200.0000	528624.0000	-2576.0000
Eastern	Finance	Payroll	226000.0000	236395.0000	10395.0000
Eastern	Human Resource	Administration	500000.0000	498750.0000	-1250.0000
Eastern	Human Resource	SVP HR	538000.0000	535135.0000	-2865.0000
Eastern	Human Resource	HR Generalists	961000.0000	940158.0000	-20842.0000
Eastern	Human Resource	HR Training	271200.0000	279674.0000	8474.0000
Eastern	Human Resource	Sexual Harassment	471200.0000	471174.0000	-26.0000
Eastern	Human Resource	EOE	470800.0000	470791.0000	-9.0000
Eastern	Marketing & Communication	CMO	918400.0000	894368.0000	-24032.0000
Eastern	Marketing & Communication	Product Marketing Mgr	716400.0000	700953.0000	-15447.0000
Eastern	Marketing & Communication	Analyst Relations	250000.0000	254375.0000	4375.0000
Eastern	Marketing & Communication	Press Relations	421310.0000	418404.0000	-2906.0000
Eastern	Marketing & Communication	Graphics	850000.0000	828875.0000	-21125.0000
Eastern	Marketing & Communication	Writer	284000.0000	286930.0000	2930.0000
Eastern	Product Development	CTO	284000.0000	286930.0000	2930.0000
Eastern	Product Development	VP Engineering	249800.0000	254184.0000	4384.0000
Eastern	Product Development	Senior Engineer	831800.0000	811449.0000	-20351.0000
Eastern	Product Development	Engineer	720000.0000	704400.0000	-15600.0000
Eastern	Product Development	QA Manager	237200.0000	242119.0000	4919.0000
Eastern	Product Development	QA Engineer	226000.0000	231395.0000	5395.0000
Eastern	Professional Services	SVP Services	3793000.0000	3900000.0000	107000.0000
Eastern	Professional Services	Services Mgr	4333400.0000	4500000.0000	166600.0000
Eastern	Professional Services	Senior Consultant	3721780.0000	3900000.0000	178220.0000
Eastern	Professional Services	Staff Consultant	3465490.0000	3500000.0000	34510.0000
Eastern	Professional Services	Trainer	3436200.0000	3300000.0000	-136200.0000
Southern	Sales	District Manager	700000.0000	690250.0000	-9750.0000
Southern	Sales	Senior Sales Rep	421200.0000	423299.0000	2099.0000
Southern	Sales	Sales Rep	690000.0000	680675.0000	-9325.0000
Southern	Sales	Account Executive	290000.0000	297675.0000	7675.0000
Southern	Sales	Pre-Sales	650000.0000	642375.0000	-7625.0000
Southern	Executive Management	CEO	500000.0000	498750.0000	-1250.0000
Southern	Executive Management	SVP WW Operations	249800.0000	259184.0000	9384.0000
Southern	Executive Management	SVP Strategic Development	226000.0000	236395.0000	10395.0000
Southern	Executive Management	SVP Partnerships	531780.0000	529179.0000	-2601.0000
Southern	Finance	CFO	831800.0000	816449.0000	-15351.0000
Southern	Finance	Administrative Assistant	918400.0000	899368.0000	-19032.0000
Southern	Finance	IS	531780.0000	529179.0000	-2601.0000
Southern	Finance	Controller	531200.0000	528624.0000	-2576.0000
Southern	Finance	Payroll	226000.0000	236395.0000	10395.0000
Southern	Human Resource	Administration	500000.0000	498750.0000	-1250.0000
Southern	Human Resource	SVP HR	538000.0000	535135.0000	-2865.0000
Southern	Human Resource	HR Generalists	961000.0000	940158.0000	-20842.0000
Southern	Human Resource	HR Training	271200.0000	279674.0000	8474.0000
Southern	Human Resource	Sexual Harassment	471200.0000	471174.0000	-26.0000
Southern	Human Resource	EOE	470800.0000	470791.0000	-9.0000
Southern	Marketing & Communication	CMO	918400.0000	897368.0000	-21032.0000
Southern	Marketing & Communication	Product Marketing Mgr	716400.0000	703953.0000	-12447.0000
Southern	Marketing & Communication	Analyst Relations	250000.0000	257375.0000	7375.0000
Southern	Marketing & Communication	Press Relations	421310.0000	421404.0000	94.0000
Southern	Marketing & Communication	Graphics	850000.0000	831875.0000	-18125.0000
Southern	Marketing & Communication	Writer	284000.0000	289930.0000	5930.0000
Southern	Product Development	CTO	284000.0000	289930.0000	5930.0000
Southern	Product Development	VP Engineering	249800.0000	257184.0000	7384.0000
Southern	Product Development	Senior Engineer	831800.0000	814449.0000	-17351.0000
Southern	Product Development	Engineer	720000.0000	707400.0000	-12600.0000
Southern	Product Development	QA Manager	237200.0000	245119.0000	7919.0000
Southern	Product Development	QA Engineer	226000.0000	234395.0000	8395.0000
Southern	Professional Services	SVP Services	3793000.0000	3818000.0000	25000.0000
Southern	Professional Services	Services Mgr	4333400.0000	4318000.0000	-15400.0000
Southern	Professional Services	Senior Consultant	3721780.0000	3718000.0000	-3780.0000
Southern	Professional Services	Staff Consultant	3465490.0000	3618000.0000	152510.0000
Southern	Professional Services	Trainer	3436200.0000	2918000.0000	-518200.0000
Western	Sales	District Manager	700000.0000	688250.0000	-11750.0000
Western	Sales	Senior Sales Rep	421200.0000	421299.0000	99.0000
Western	Sales	Sales Rep	690000.0000	678675.0000	-11325.0000
Western	Sales	Account Executive	290000.0000	295675.0000	5675.0000
Western	Sales	Pre-Sales	650000.0000	640375.0000	-9625.0000
Western	Executive Management	CEO	500000.0000	478750.0000	-21250.0000
Western	Executive Management	SVP WW Operations	249800.0000	239184.0000	-10616.0000
Western	Executive Management	SVP Strategic Development	226000.0000	216395.0000	-9605.0000
Western	Executive Management	SVP Partnerships	531780.0000	509179.0000	-22601.0000
Western	Finance	CFO	831800.0000	814449.0000	-17351.0000
Western	Finance	Administrative Assistant	918400.0000	897368.0000	-21032.0000
Western	Finance	IS	531780.0000	527179.0000	-4601.0000
Western	Finance	Controller	531200.0000	526624.0000	-4576.0000
Western	Finance	Payroll	226000.0000	234395.0000	8395.0000
Western	Human Resource	Administration	500000.0000	496750.0000	-3250.0000
Western	Human Resource	SVP HR	538000.0000	533135.0000	-4865.0000
Western	Human Resource	HR Generalists	961000.0000	938158.0000	-22842.0000
Western	Human Resource	HR Training	271200.0000	277674.0000	6474.0000
Western	Human Resource	Sexual Harassment	471200.0000	469174.0000	-2026.0000
Western	Human Resource	EOE	470800.0000	468791.0000	-2009.0000
Western	Marketing & Communication	CMO	918400.0000	897368.0000	-21032.0000
Western	Marketing & Communication	Product Marketing Mgr	716400.0000	703953.0000	-12447.0000
Western	Marketing & Communication	Analyst Relations	250000.0000	257375.0000	7375.0000
Western	Marketing & Communication	Press Relations	421310.0000	421404.0000	94.0000
Western	Marketing & Communication	Graphics	850000.0000	831875.0000	-18125.0000
Western	Marketing & Communication	Writer	284000.0000	289930.0000	5930.0000
Western	Product Development	CTO	284000.0000	289930.0000	5930.0000
Western	Product Development	VP Engineering	249800.0000	257184.0000	7384.0000
Western	Product Development	Senior Engineer	831800.0000	814449.0000	-17351.0000
Western	Product Development	Engineer	720000.0000	707400.0000	-12600.0000
Western	Product Development	QA Manager	237200.0000	245119.0000	7919.0000
Western	Product Development	QA Engineer	226000.0000	234395.0000	8395.0000
Western	Professional Services	SVP Services	3793000.0000	3818000.0000	25000.0000
Western	Professional Services	Services Mgr	4333400.0000	4418000.0000	84600.0000
Western	Professional Services	Senior Consultant	3721780.0000	3718000.0000	-3780.0000
Western	Professional Services	Staff Consultant	3465490.0000	3336206.0000	-129284.0000
Western	Professional Services	Trainer	3436200.0000	2918000.0000	-518200.0000
\.


--
-- Data for Name: time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "time" (time_id, month_id, qtr_id, year_id, month_name, month_desc, qtr_name, qtr_desc) FROM stdin;
2003-01-06	1	1	2003	Jan	January	QTR1	Quarter 1
2003-01-09	1	1	2003	Jan	January	QTR1	Quarter 1
2003-01-10	1	1	2003	Jan	January	QTR1	Quarter 1
2003-01-29	1	1	2003	Jan	January	QTR1	Quarter 1
2003-01-31	1	1	2003	Jan	January	QTR1	Quarter 1
2003-02-11	2	1	2003	Feb	February	QTR1	Quarter 1
2003-02-17	2	1	2003	Feb	February	QTR1	Quarter 1
2003-02-24	2	1	2003	Feb	February	QTR1	Quarter 1
2003-03-03	3	1	2003	Mar	March	QTR1	Quarter 1
2003-03-10	3	1	2003	Mar	March	QTR1	Quarter 1
2003-03-18	3	1	2003	Mar	March	QTR1	Quarter 1
2003-03-24	3	1	2003	Mar	March	QTR1	Quarter 1
2003-03-25	3	1	2003	Mar	March	QTR1	Quarter 1
2003-03-26	3	1	2003	Mar	March	QTR1	Quarter 1
2003-04-01	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-04	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-11	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-16	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-21	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-28	4	2	2003	Apr	April	QTR2	Quarter 2
2003-04-29	4	2	2003	Apr	April	QTR2	Quarter 2
2003-05-07	5	2	2003	May	May	QTR2	Quarter 2
2003-05-08	5	2	2003	May	May	QTR2	Quarter 2
2003-05-20	5	2	2003	May	May	QTR2	Quarter 2
2003-05-21	5	2	2003	May	May	QTR2	Quarter 2
2003-05-28	5	2	2003	May	May	QTR2	Quarter 2
2003-06-03	6	2	2003	Jun	June	QTR2	Quarter 2
2003-06-06	6	2	2003	Jun	June	QTR2	Quarter 2
2003-06-12	6	2	2003	Jun	June	QTR2	Quarter 2
2003-06-16	6	2	2003	Jun	June	QTR2	Quarter 2
2003-06-25	6	2	2003	Jun	June	QTR2	Quarter 2
2003-06-27	6	2	2003	Jun	June	QTR2	Quarter 2
2003-07-01	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-02	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-04	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-07	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-10	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-16	7	3	2003	Jul	July	QTR3	Quarter 3
2003-07-24	7	3	2003	Jul	July	QTR3	Quarter 3
2003-08-01	8	3	2003	Aug	August	QTR3	Quarter 3
2003-08-08	8	3	2003	Aug	August	QTR3	Quarter 3
2003-08-10	8	3	2003	Aug	August	QTR3	Quarter 3
2003-08-13	8	3	2003	Aug	August	QTR3	Quarter 3
2003-08-25	8	3	2003	Aug	August	QTR3	Quarter 3
2003-09-03	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-05	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-11	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-12	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-19	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-21	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-25	9	3	2003	Sep	September	QTR3	Quarter 3
2003-09-28	9	3	2003	Sep	September	QTR3	Quarter 3
2003-10-02	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-04	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-05	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-06	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-08	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-09	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-10	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-11	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-17	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-18	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-20	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-21	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-22	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-23	10	4	2003	Oct	October	QTR4	Quarter 4
2003-10-28	10	4	2003	Oct	October	QTR4	Quarter 4
2003-11-04	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-05	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-06	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-07	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-08	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-11	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-12	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-13	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-14	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-15	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-18	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-19	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-20	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-21	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-25	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-26	11	4	2003	Nov	November	QTR4	Quarter 4
2003-11-27	11	4	2003	Nov	November	QTR4	Quarter 4
2003-12-01	12	4	2003	Dec	December	QTR4	Quarter 4
2003-12-02	12	4	2003	Dec	December	QTR4	Quarter 4
2003-12-03	12	4	2003	Dec	December	QTR4	Quarter 4
2003-12-05	12	4	2003	Dec	December	QTR4	Quarter 4
2003-12-09	12	4	2003	Dec	December	QTR4	Quarter 4
2004-01-02	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-09	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-12	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-15	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-16	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-22	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-26	1	1	2004	Jan	January	QTR1	Quarter 1
2004-01-29	1	1	2004	Jan	January	QTR1	Quarter 1
2004-02-02	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-04	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-09	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-10	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-12	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-18	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-19	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-20	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-21	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-22	2	1	2004	Feb	February	QTR1	Quarter 1
2004-02-26	2	1	2004	Feb	February	QTR1	Quarter 1
2004-03-02	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-10	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-11	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-15	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-19	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-20	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-29	3	1	2004	Mar	March	QTR1	Quarter 1
2004-03-30	3	1	2004	Mar	March	QTR1	Quarter 1
2004-04-02	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-03	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-05	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-09	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-12	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-13	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-20	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-26	4	2	2004	Apr	April	QTR2	Quarter 2
2004-04-29	4	2	2004	Apr	April	QTR2	Quarter 2
2004-05-04	5	2	2004	May	May	QTR2	Quarter 2
2004-05-05	5	2	2004	May	May	QTR2	Quarter 2
2004-05-07	5	2	2004	May	May	QTR2	Quarter 2
2004-05-08	5	2	2004	May	May	QTR2	Quarter 2
2004-05-11	5	2	2004	May	May	QTR2	Quarter 2
2004-05-18	5	2	2004	May	May	QTR2	Quarter 2
2004-05-26	5	2	2004	May	May	QTR2	Quarter 2
2004-06-01	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-03	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-04	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-08	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-14	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-15	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-16	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-17	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-24	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-28	6	2	2004	Jun	June	QTR2	Quarter 2
2004-06-30	6	2	2004	Jun	June	QTR2	Quarter 2
2004-07-02	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-06	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-07	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-12	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-16	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-19	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-20	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-21	7	3	2004	Jul	July	QTR3	Quarter 3
2004-07-23	7	3	2004	Jul	July	QTR3	Quarter 3
2004-08-02	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-04	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-06	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-09	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-17	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-19	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-20	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-21	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-27	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-28	8	3	2004	Aug	August	QTR3	Quarter 3
2004-08-30	8	3	2004	Aug	August	QTR3	Quarter 3
2004-09-01	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-03	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-07	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-08	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-09	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-10	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-15	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-16	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-27	9	3	2004	Sep	September	QTR3	Quarter 3
2004-09-30	9	3	2004	Sep	September	QTR3	Quarter 3
2004-10-06	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-11	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-13	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-14	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-15	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-16	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-21	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-22	10	4	2004	Oct	October	QTR4	Quarter 4
2004-10-29	10	4	2004	Oct	October	QTR4	Quarter 4
2004-11-01	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-02	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-03	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-04	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-05	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-09	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-10	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-12	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-15	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-16	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-17	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-18	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-19	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-20	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-21	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-22	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-23	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-24	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-25	11	4	2004	Nov	November	QTR4	Quarter 4
2004-11-29	11	4	2004	Nov	November	QTR4	Quarter 4
2004-12-01	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-02	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-03	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-04	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-07	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-09	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-10	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-15	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-16	12	4	2004	Dec	December	QTR4	Quarter 4
2004-12-17	12	4	2004	Dec	December	QTR4	Quarter 4
2005-01-05	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-06	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-07	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-10	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-12	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-19	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-20	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-23	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-26	1	1	2005	Jan	January	QTR1	Quarter 1
2005-01-31	1	1	2005	Jan	January	QTR1	Quarter 1
2005-02-02	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-03	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-08	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-09	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-10	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-16	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-17	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-22	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-23	2	1	2005	Feb	February	QTR1	Quarter 1
2005-02-28	2	1	2005	Feb	February	QTR1	Quarter 1
2005-03-01	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-02	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-03	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-04	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-09	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-10	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-11	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-15	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-17	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-23	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-28	3	1	2005	Mar	March	QTR1	Quarter 1
2005-03-30	3	1	2005	Mar	March	QTR1	Quarter 1
2005-04-01	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-03	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-07	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-08	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-14	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-15	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-22	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-23	4	2	2005	Apr	April	QTR2	Quarter 2
2005-04-29	4	2	2005	Apr	April	QTR2	Quarter 2
2005-05-01	5	2	2005	May	May	QTR2	Quarter 2
2005-05-03	5	2	2005	May	May	QTR2	Quarter 2
2005-05-05	5	2	2005	May	May	QTR2	Quarter 2
2005-05-06	5	2	2005	May	May	QTR2	Quarter 2
2005-05-09	5	2	2005	May	May	QTR2	Quarter 2
2005-05-10	5	2	2005	May	May	QTR2	Quarter 2
2005-05-13	5	2	2005	May	May	QTR2	Quarter 2
2005-05-16	5	2	2005	May	May	QTR2	Quarter 2
2005-05-17	5	2	2005	May	May	QTR2	Quarter 2
2005-05-29	5	2	2005	May	May	QTR2	Quarter 2
2005-05-30	5	2	2005	May	May	QTR2	Quarter 2
2005-05-31	5	2	2005	May	May	QTR2	Quarter 2
\.


--
-- Data for Name: trial_balance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trial_balance ("Type", "Account_Num", "Category", "Category2", "Detail", "Amount") FROM stdin;
I	4100	Revenue	Direct Sales	Direct Sales	400000
I	4200	Revenue	Channel Sales	Channel Sales	150000
I	5010	Cost of goods	Cost of goods available for sale	Beginning inventory	-40000
I	5020	Cost of goods	Cost of goods available for sale	Net purchases	-325000
I	5040	Cost of goods	Ending inventory	Ending inventory	35000
E	5110	Expenses	Selling expenses	Sales salaries	-48000
E	5120	Expenses	Selling expenses	Nonrecurring item	-12000
E	5130	Expenses	Selling expenses	Other	-13000
E	5310	Expenses	General and administrative expenses	Office salaries	-27100
E	5320	Expenses	General and administrative expenses	Depreciation	-5500
E	5330	Expenses	General and administrative expenses	Amortization	-3200
E	5340	Expenses	General and administrative expenses	Bad debt	-4500
E	5350	Expenses	General and administrative expenses	Other	-24200
I	6110	Other revenues	Interest	Interest	5200
I	6120	Other revenues	Dividends	Dividends	7200
I	6130	Other revenues	Gain on sale of equipment	Gain on sale of equipment	8600
E	7110	Other expenses	Interest	Interest	-9400
E	7120	Other expenses	Writeoff - goodwill	Writeoff - goodwill	-5000
E	7130	Other expenses	Unusual item - loss on sale of long-term investment	Unusual item - loss on sale of long-term investment	-5100
E	7200	Income tax expense	Income tax expense	Income tax expense	-33600
I	9100	Extraordinary item - gain on disposal of business segment	Extraordinary item - gain on disposal of business segment	Extraordinary item - gain on disposal of business segment	24000
I	9200	Other Comprehensive Income	Other Comprehensive Income	Other Comprehensive Income	12000
\.


--
-- Name: customer_w_ter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer_w_ter
    ADD CONSTRAINT customer_w_ter_pkey PRIMARY KEY (customernumber);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customernumber);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeenumber);


--
-- Name: offices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY offices
    ADD CONSTRAINT offices_pkey PRIMARY KEY (officecode);


--
-- Name: orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (ordernumber, productcode);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ordernumber);


--
-- Name: payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (customernumber, checknumber);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productcode);


--
-- Name: of_prodcode; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX of_prodcode ON orderfact USING btree (productcode);


--
-- Name: sys_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY orderfact
    ADD CONSTRAINT sys_fk_1 FOREIGN KEY (productcode) REFERENCES products(productcode);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: customer_w_ter; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE customer_w_ter FROM PUBLIC;
REVOKE ALL ON TABLE customer_w_ter FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE customer_w_ter TO postgres;
GRANT SELECT ON TABLE customer_w_ter TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE customer_w_ter TO pentaho_admin;


--
-- Name: customers; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE customers FROM PUBLIC;
REVOKE ALL ON TABLE customers FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE customers TO postgres;
GRANT SELECT ON TABLE customers TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE customers TO pentaho_admin;


--
-- Name: department_managers; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE department_managers FROM PUBLIC;
REVOKE ALL ON TABLE department_managers FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE department_managers TO postgres;
GRANT SELECT ON TABLE department_managers TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE department_managers TO pentaho_admin;


--
-- Name: employees; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE employees FROM PUBLIC;
REVOKE ALL ON TABLE employees FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE employees TO postgres;
GRANT SELECT ON TABLE employees TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE employees TO pentaho_admin;


--
-- Name: offices; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE offices FROM PUBLIC;
REVOKE ALL ON TABLE offices FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE offices TO postgres;
GRANT SELECT ON TABLE offices TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE offices TO pentaho_admin;


--
-- Name: orderdetails; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE orderdetails FROM PUBLIC;
REVOKE ALL ON TABLE orderdetails FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orderdetails TO postgres;
GRANT SELECT ON TABLE orderdetails TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orderdetails TO pentaho_admin;


--
-- Name: orderfact; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE orderfact FROM PUBLIC;
REVOKE ALL ON TABLE orderfact FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orderfact TO postgres;
GRANT SELECT ON TABLE orderfact TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orderfact TO pentaho_admin;


--
-- Name: orders; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE orders FROM PUBLIC;
REVOKE ALL ON TABLE orders FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orders TO postgres;
GRANT SELECT ON TABLE orders TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE orders TO pentaho_admin;


--
-- Name: payments; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE payments FROM PUBLIC;
REVOKE ALL ON TABLE payments FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE payments TO postgres;
GRANT SELECT ON TABLE payments TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE payments TO pentaho_admin;


--
-- Name: products; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE products FROM PUBLIC;
REVOKE ALL ON TABLE products FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE products TO postgres;
GRANT SELECT ON TABLE products TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE products TO pentaho_admin;


--
-- Name: quadrant_actuals; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE quadrant_actuals FROM PUBLIC;
REVOKE ALL ON TABLE quadrant_actuals FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE quadrant_actuals TO postgres;
GRANT SELECT ON TABLE quadrant_actuals TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE quadrant_actuals TO pentaho_admin;


--
-- Name: time; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE "time" FROM PUBLIC;
REVOKE ALL ON TABLE "time" FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "time" TO postgres;
GRANT SELECT ON TABLE "time" TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE "time" TO pentaho_admin;


--
-- Name: trial_balance; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE trial_balance FROM PUBLIC;
REVOKE ALL ON TABLE trial_balance FROM postgres;
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE trial_balance TO postgres;
GRANT SELECT ON TABLE trial_balance TO pentaho_user;
-- GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLE trial_balance TO pentaho_admin;


--
-- PostgreSQL database dump complete
--

