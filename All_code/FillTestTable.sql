create table tbl_Region
(
    Region_ID number (3) not null,
    State_Province_Code varchar2(5) not null,
    Country_Region_Code char(2),
    Name nvarchar2(50) not null,
    CreatedON date default sysdate not null
);

insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (1,'AB ','CA','Alberta');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (2,'AK ','US','Alaska');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (3,'AL ','US','Alabama');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (4,'AR ','US','Arkansas');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (5,'AS ','AS','American Samoa');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (6,'AZ ','US','Arizona');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (7,'BC ','CA','British Columbia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (8,'BY ','DE','Bayern');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (9,'CA ','US','California');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (10,'CO ','US','Colorado');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (11,'CT ','US','Connecticut');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (12,'DC ','US','District of Columbia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (13,'DE ','US','Delaware');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (14,'ENG','GB','England');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (15,'FL ','US','Florida');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (16,'FM ','FM','Micronesia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (17,'GA ','US','Georgia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (18,'GU ','US','Guam');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (19,'HE ','DE','Hessen');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (20,'HH ','DE','Hamburg');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (21,'HI ','US','Hawaii');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (22,'IA ','US','Iowa');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (23,'ID ','US','Idaho');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (24,'IL ','US','Illinois');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (25,'IN ','US','Indiana');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (26,'KS ','US','Kansas');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (27,'KY ','US','Kentucky');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (28,'LA ','US','Louisiana');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (29,'LB ','CA','Labrador');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (30,'MA ','US','Massachusetts');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (31,'MB ','CA','Manitoba');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (32,'MD ','US','Maryland');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (33,'ME ','US','Maine');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (34,'MH ','MH','Marshall Islands');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (35,'MI ','US','Michigan');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (36,'MN ','US','Minnesota');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (37,'MO ','US','Missouri');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (38,'MP ','MP','Northern Mariana Islands');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (39,'MS ','US','Mississippi');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (40,'MT ','US','Montana');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (41,'NB ','CA','Brunswick');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (42,'NC ','US','North Carolina');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (43,'ND ','US','North Dakota');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (44,'NE ','US','Nebraska');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (45,'NF ','CA','Newfoundland');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (46,'NH ','US','New Hampshire');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (47,'NJ ','US','New Jersey');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (48,'NM ','US','New Mexico');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (49,'NS ','CA','Nova Scotia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (50,'NSW','AU','New South Wales');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (51,'NT ','CA','Northwest Territories');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (52,'NV ','US','Nevada');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (53,'NW ','DE','Nordrhein-Westfalen');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (54,'NY ','US','New York');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (55,'OH ','US','Ohio');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (56,'OK ','US','Oklahoma');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (57,'ON ','CA','Ontario');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (58,'OR ','US','Oregon');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (59,'PA ','US','Pennsylvania');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (60,'PE ','CA','Prince Edward Island');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (61,'PR ','US','Puerto Rico');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (62,'PW ','PW','Palau');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (63,'QC ','CA','Quebec');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (64,'QLD','AU','Queensland');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (65,'RI ','US','Rhode Island');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (66,'SA ','AU','South Australia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (67,'SC ','US','South Carolina');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (68,'SD ','US','South Dakota');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (69,'SK ','CA','Saskatchewan');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (70,'SL ','DE','Saarland');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (71,'TAS','AU','Tasmania');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (72,'TN ','US','Tennessee');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (73,'TX ','US','Texas');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (74,'UT ','US','Utah');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (75,'VA ','US','Virginia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (76,'VI ','VI','Virgin Islands');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (77,'VIC','AU','Victoria');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (78,'VT ','US','Vermont');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (79,'WA ','US','Washington');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (80,'WI ','US','Wisconsin');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (81,'WV ','US','West Virginia');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (82,'WY ','US','Wyoming');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (83,'YT ','CA','Yukon Territory');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (84,'FR ','FR','France');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (85,'BB ','DE','Brandenburg');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (86,'SN ','DE','Saxony');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (87,'1','FR','Ain');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (88,'2','FR','Aisne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (89,'3','FR','Allier');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (90,'4','FR','Alpes-de-Haute Provence');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (91,'5','FR','Alpes (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (92,'6','FR','Alpes-Maritimes');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (93,'7','FR','Ardèche');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (94,'8','FR','Ardennes');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (95,'9','FR','Ariège');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (96,'10','FR','Aube');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (97,'11','FR','Aude');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (98,'12','FR','Aveyron');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (99,'13','FR','Bouches du Rhône');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (100,'14','FR','Calvados');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (101,'15','FR','Cantal');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (102,'16','FR','Charente');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (103,'17','FR','Charente-Maritime');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (104,'18','FR','Cher');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (105,'19','FR','Corrèze');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (106,'20','FR','Corse');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (107,'21','FR','Côte dOr');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (108,'22','FR','Côtes-dArmor');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (109,'23','FR','Creuse');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (110,'24','FR','Dordogne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (111,'25','FR','Toubs');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (112,'26','FR','Drôme');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (113,'27','FR','Eure');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (114,'28','FR','Eure et Loir');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (115,'29','FR','Finistère');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (116,'30','FR','Gard');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (117,'31','FR','Garonne (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (118,'32','FR','Gers');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (119,'33','FR','Gironde');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (120,'34','FR','Hérault');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (121,'35','FR','Ille et Vilaine');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (122,'36','FR','Indre');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (123,'37','FR','Indre et Loire');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (124,'38','FR','Isère');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (125,'39','FR','Jura');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (126,'40','FR','Landes');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (127,'41','FR','Loir et Cher');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (128,'42','FR','Loire');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (129,'43','FR','Loire (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (130,'44','FR','Loire Atlantique');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (131,'45','FR','Loiret');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (132,'46','FR','Lot');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (133,'47','FR','Lot et Garonne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (134,'48','FR','Lozère');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (135,'49','FR','Maine et Loire');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (136,'50','FR','Manche');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (137,'51','FR','Marne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (138,'52','FR','Marne (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (139,'53','FR','Mayenne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (140,'54','FR','Meurthe et Moselle');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (141,'55','FR','Meuse');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (142,'56','FR','Morbihan');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (143,'57','FR','Moselle');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (144,'58','FR','Nièvre');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (145,'59','FR','Nord');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (146,'60','FR','Oise');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (147,'61','FR','Orne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (148,'62','FR','Pas de Calais');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (149,'63','FR','Puy de Dôme');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (150,'64','FR','Pyrénées Atlantiques');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (151,'65','FR','Pyrénées (Hautes)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (152,'66','FR','Pyrénées Orientales');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (153,'67','FR','Rhin (Bas)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (154,'68','FR','Rhin (Haut)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (155,'69','FR','Rhône');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (156,'70','FR','Saône (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (157,'71','FR','Saône et Loire');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (158,'72','FR','Sarthe');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (159,'73','FR','Savoie');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (160,'74','FR','Savoie Haute');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (161,'75','FR','Seine (Paris)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (162,'76','FR','Seine Maritime');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (163,'77','FR','Seine et Marne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (164,'78','FR','Yveline');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (165,'79','FR','Sèvres (Deux)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (166,'80','FR','Somme');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (167,'81','FR','Tarne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (168,'82','FR','Tarne et Garonne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (169,'83','FR','Var');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (170,'84','FR','Vaucluse');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (171,'85','FR','La Vendée');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (172,'86','FR','Vienne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (173,'87','FR','Vienne (Haute)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (174,'88','FR','Vosges');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (175,'89','FR','Yonne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (176,'90','FR','Belford (Territoire de)');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (177,'91','FR','Essonne');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (178,'92','FR','Hauts de Seine');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (179,'93','FR','Seine Saint Denis');  Commit;
insert into tbl_region (region_id, State_Province_Code, Country_Region_Code, Name) values (180,'94','FR','Val de Marne');  Commit;



create table tbl_Customer
(
    Customer_ID number(38,0) CONSTRAINT pk_Customer_id primary key not null,
    External_ID varchar2(32) default SYS_GUID() not null,
    Customer_xml xmltype null,
    Status number(1) check (Status in (0,1)),
    User_name varchar2(50) default user not null,
    Date_From date default sysdate not null,
    Date_To date default TO_DATE('31.12.9999 23:59:59', 'dd/mm/yyyy hh24:mi:ss')
);
create table tbl_Customer_Address
(
    Customer_Address_ID number(38,0) CONSTRAINT pk_CustomerAddress_id primary key not null,
    Customer_ID number(30) not null,
    Region_ID number(3) null,
    Street nvarchar2(50) null,
    City nvarchar2(50) null,
    Postal_Code nvarchar2(50) null,
    CreatedON date default sysdate not null,
    
    CONSTRAINT fk_CustomerAddress_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES tbl_Customer(Customer_ID)
);
create table tbl_Customer_Details
(
    Customer_Detail_ID number(38,0)  CONSTRAINT pk_CustomerDetails_id primary key not null,
    Customer_ID number(30) not null,
    Person_Type char(2) null,
    First_Name nvarchar2(50) null,
    Last_Name nvarchar2(50) null,
    CreatedON date default sysdate not null,
    
    CONSTRAINT fk_CustomerDetails_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES tbl_Customer(Customer_ID)
);

CREATE SEQUENCE Customer_id_seq 
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Customer_Detail_ID_seq 
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE Customer_Address_id_seq 
START WITH 1
INCREMENT BY 1;

create or replace TRIGGER tbl_Cust_On_Insert
  BEFORE INSERT ON tbl_Customer
  FOR EACH ROW
BEGIN
  SELECT Customer_id_seq.nextval
  INTO :new.Customer_ID
  FROM dual;
END;

create or replace TRIGGER tbl_CustDet_On_Insert
  BEFORE INSERT ON tbl_Customer_Details
  FOR EACH ROW
BEGIN
  SELECT Customer_Detail_ID_seq.nextval
  INTO :new.Customer_Detail_ID
  FROM dual;
END;

create or replace TRIGGER tbl_CustAddr_On_Insert
  BEFORE INSERT ON tbl_Customer_Address
  FOR EACH ROW
BEGIN
  SELECT Customer_Address_id_seq.nextval
  INTO :new.Customer_Address_ID
  FROM dual;
END;

create or replace TRIGGER tbl_Customer_audit
before update or delete on tbl_Customer
for each row
enable 

declare 
date_time DATE;
user_n varchar2(50);

begin

select 
    TO_DATE(sysdate , 'dd/mm/yyyy hh24:mi:ss'),
    user
into 
    date_time,
    user_n
from 
    dual;

if updating 
then 
    insert into tbl_Customer
        ( 
            External_ID, 
            Customer_xml, 
            Date_From, 
            Date_To,
            Status,
            User_name
        )
    values 
        (
            :old.External_ID, 
            :old.Customer_xml, 
            :old.Date_From, 
            date_time,
            1,
            user_n
        );
elsif deleting 
then 
    insert into tbl_Customer
        ( 
            External_ID, 
            Customer_xml, 
            Date_From, 
            Date_To,
            Status,
            User_name
        )
    values 
        (
            :old.External_ID, 
            :old.Customer_xml, 
            :old.Date_From, 
            date_time,
            0,
            user_n
        );
    
end if;
    
end;

