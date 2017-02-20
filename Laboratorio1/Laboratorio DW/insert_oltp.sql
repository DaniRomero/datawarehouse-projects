INSERT INTO marca ( id_marca , nombre_marca ) VALUES (100,'Ut Aliquam LLC');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (110,'Pede Ultrices Company');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (120,'Aliquam Ornare Libero Industries');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (130,'Id Consulting');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (140,'Metus Vitae LLP');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (150,'Mattis LLC');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (160,'Aliquet Industries');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (170,'In PC');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (180,'Donec Incorporated');
INSERT INTO marca ( id_marca , nombre_marca ) VALUES (190,'Orci Ut Incorporated');

INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (500,'Eget Tincidunt Dui Consulting');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (510,'Ligula Aenean Company');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (520,'Dapibus Gravida Associates');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (530,'Magna Associates');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (540,'Lorem Ipsum Industries');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (550,'Elementum Inc.');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (560,'Cursus A Enim Foundation');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (570,'Mauris Rhoncus LLP');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (580,'Vivamus LLP');
INSERT INTO categoria ( id_categoria , nombre_categoria ) VALUES (590,'Sed Neque Corp.');

INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (500,'Mus Corp.',500);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (510,'Aliquet Phasellus PC',510);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (520,'Non Company',520);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (530,'Varius Orci In Limited',530);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (540,'Lacus Etiam Bibendum Associates',540);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (550,'Justo Ltd',550);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (560,'Velit Ltd',560);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (570,'Cursus Et Magna Foundation',570);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (580,'Lorem Institute',580);
INSERT INTO subcategoria ( id_sub , nombre_subca , id_categoria ) VALUES (590,'Sed Pede Corporation',590);

INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (100,'Fringilla Purus Mauris Associates',100,75681,12,500);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (101,'Nec Limited',110,26351,13,510);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (102,'Mauris LLC',120,32999,13,520);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (103,'Eget Metus Company',130,4440,11,530);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (104,'Fringilla Porttitor Vulputate Corporation',140,29838,13,540);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (105,'Imperdiet Corp.',150,43274,12,550);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (106,'Risus Quis Diam Incorporated',160,67382,13,560);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (107,'Nunc Ullamcorper Eu Inc.',170,14389,12,570);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (108,'Ante Institute',180,24248,11,580);
INSERT INTO producto ( id_producto , nombre_producto , id_marca , pvp , iva , id_sub ) VALUES (109,'Interdum Curabitur Industries',190,48399,12,590);

INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (1,'Malonne','US');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (11,'Senftenberg','VE');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (21,'Gaasbeek','MX');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (31,'Idaho Falls','MX');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (41,'Peine','AR');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (51,'Newton Stewart','AR');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (61,'Bathgate','AR');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (71,'Windsor','AR');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (81,'Ararat','US');
INSERT INTO estado ( id_estado , nombre_estado , siglas ) VALUES (91,'Maidenhead','VE');

INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (100,'Solomon Islands','CS',1);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (101,'Jordan','FL',11);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (102,'Mali','FL',21);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (103,'Thailand','FL',31);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (104,'Kiribati','CS',41);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (105,'Panama','DF',51);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (106,'Ukraine','DF',61);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (107,'Solomon Islands','BA',71);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (108,'Slovakia','BA',81);
INSERT INTO ciudad ( id_ciudad , nombre_ciudad , siglas , id_estado ) VALUES (109,'Western Sahara','CS',91);

INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (100,'Tempor PC','E8E 8I3','04 79 63 82 80','(569) 197-3828',1863,100);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (101,'Suspendisse Inc.','Q1C 6Q4','05 30 21 51 95','(718) 189-1817',1307,101);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (102,'Lobortis Incorporated','S9J 3F2','01 19 56 56 64','(797) 318-4603',1924,102);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (103,'Quam Vel Inc.','C0G 8B9','07 31 74 95 37','(711) 404-8918',1801,103);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (104,'Nulla Tincidunt LLP','V7F 3Z5','05 33 50 60 04','(536) 202-5667',1883,104);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (105,'Magna Incorporated','I4I 1R5','09 44 64 90 65','(590) 980-6410',1019,105);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (106,'Mauris Blandit Company','U9O 8H1','04 64 33 14 52','(687) 628-6707',1805,106);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (107,'Per Conubia Associates','G0A 1Q3','02 43 22 28 24','(695) 576-8237',1132,107);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (108,'Sit Amet Foundation','Y3W 3W8','03 55 88 51 35','(101) 442-5401',1282,107);
INSERT INTO tienda ( id_tienda , nombre_tienda , rif , telf , fax , cantidad_productos , id_ciudad ) VALUES (109,'Integer Tincidunt Ltd','W3I 5B6','04 67 37 81 03','(682) 643-2520',1158,109);


INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (100,'Dolor Industries','E2I 0I5','08 92 59 10 16',100);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (101,'Tristique Senectus Et Inc.','Q3Y 9E0','05 25 68 63 86',101);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (102,'Molestie Orci Tincidunt Institute','L0Q 1B0','02 52 21 73 76',102);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (103,'Fames Ac Turpis Incorporated','R6L 6O1','07 89 92 87 91',103);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (104,'A Company','F9Z 8P6','09 09 26 68 17',104);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (105,'Ut LLC','I3U 4S3','02 79 09 44 50',105);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (106,'Ullamcorper Magna Sed Industries','M0J 4K5','02 27 74 41 65',106);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (107,'Metus Sit Amet LLP','F8T 5Z5','05 19 86 34 51',107);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (108,'Magna Praesent Limited','X7P 3U5','06 54 60 09 06',108);
INSERT INTO proveedor (id_prov,nombre,rif,telf,id_ciudad) VALUES (109,'Natoque Penatibus PC','O2H 2D0','01 67 24 38 15',109);

INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (100,'Posuere Cubilia Curae; Incorporated','C0V 8T3',9,2325,100);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (101,'Aliquet Industries','T1G 8J1',7,4347,101);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (102,'Facilisis Ltd','F9X 1U4',9,2291,102);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (103,'Tristique Senectus Et Company','G4K 0S7',5,711,103);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (104,'Nunc LLP','H6W 5M7',10,4644,104);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (105,'A Tortor Nunc Corporation','J4S 3G3',3,3700,105);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (106,'Commodo LLP','T7M 6P5',9,4840,106);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (107,'Sit Amet Corporation','K1Z 6R6',4,4162,107);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (108,'Dolor Consulting','V8Y 2U8',5,2561,108);
INSERT INTO almacen (id_almacen,nombre_almacen,rif,dimensiones,capacidad_producto,id_ciudad) VALUES (109,'In Scelerisque Industries','K2G 8M4',2,4094,109);

INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/09/2008',100,100,843,2091,53,46);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/11/2007',101,101,2116,1870,16,12);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/08/2007',102,102,1745,4953,28,13);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('16/01/2005',103,103,2758,3442,2,16);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/07/2007',104,104,1765,1381,7,14);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('15/07/2007',105,105,3186,3161,86,55);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('15/02/2003',106,106,3212,3045,5,95);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/05/2004',107,107,4944,980,59,6);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('15/10/2004',108,108,3762,1837,55,81);
INSERT INTO tiene (fecha,id_tienda,id_producto,cant_vend,cant_existente,NOPA,NMRD) VALUES ('18/09/2001',109,109,496,4134,17,100);


INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('18/04/2006',100,100,3915,4813,10,75);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('15/10/2007',101,101,3135,4381,12,32);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('16/01/2008',102,102,783,917,69,31);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('15/10/2005',103,103,557,1044,52,58);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('18/08/2007',104,104,4169,1673,86,37);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('15/03/2006',105,105,221,2962,96,12);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('15/03/2056',106,106,221,2962,96,12);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('15/12/2005',107,107,1441,3318,71,54);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES ('18/09/2005',108,108,2590,1339,80,43);
INSERT INTO almacena (fecha,id_almacen,id_producto,cant_despacho,cant_existente,NOPAL,NMRS) VALUES  ('18/03/2003',109,109,3957,3111,68,95);

INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/12/2007','15/06/2003',100,100,100,39);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('15/01/2005','15/09/2000',101,101,101,44);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/05/2007','18/03/2008',102,102,102,23);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/11/2003','18/12/2005',103,103,103,37);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/08/2011','18/12/2001',104,104,104,80);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/08/2012','18/08/2002',105,105,105,95);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('15/04/2007','15/09/2007',106,106,106,15);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/07/2014','15/04/2015',107,107,107,70);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('18/06/2010','18/10/2015',108,108,108,30);
INSERT INTO abastece (fecha_rec,fecha_desc,id_almacen,id_tienda,id_producto,cant) VALUES ('15/02/2010','18/07/2016',109,109,109,2);

INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('18/11/2004','15/02/2017',100,100,100,27,4412,8684,12528);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('15/05/2010','18/02/2017',101,101,101,71,2916,6183,7460);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('18/07/2016','20/07/2019',102,102,102,70,3845,7919,11998);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('18/12/2028','18/07/2010',103,103,103,86,3950,5179,11324);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('16/01/2013','18/04/2028',104,104,104,59,2360,9218,11010);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('18/11/2021','20/08/2001',105,105,105,14,4634,8903,10016);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('18/02/2021','18/02/2026',106,106,106,4,3701,8345,14787);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('15/06/2017','18/05/2014',107,107,107,45,3085,8257,10563);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('15/02/2024','20/05/2019',108,108,108,19,888,8246,7129);
INSERT INTO provee (fecha_rec,fecha_env,id_prov,id_almacen,id_producto,cant,costo_prod,costo_env,costo_total) VALUES ('15/01/2024','18/10/2028',109,109,109,75,2518,9519,10150);


