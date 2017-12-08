/*                                                          */
/*                                                          */
/*                Applicacion Ponchito                      */
/*                                                          */
/* Authors:         ID: 153542      Luis Alberto Flores     */
/*                  ID: 154422      Alejandro Lobato        */
/*                  ID: 153424      Jose Antonio Marquez    */
/*                                                          */
/* Date:            Dec/08/2017                             */
/*                                                          */
/*                                                          */


/* Crea la base de datos */

CREATE DATABASE ponchito;


/* Usa la base de datos ponchito */

USE ponchito;


/* Crea la tabla ciudad */

CREATE TABLE ciudad (nombre CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        PRIMARY KEY (nombre, pais));


/* Crea la tabla lugaravisitar */

CREATE TABLE lugaravisitar (nombre CHAR(12) NOT NULL,
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        direccion CHAR(20),
                        descripcion CHAR(40),
                        precio INTEGER(2) UNSIGNED,
                        PRIMARY KEY (nombre),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));


/* Crea la tabla circuito */

CREATE TABLE circuito (identificador CHAR(5) NOT NULL,
                        descripcion CHAR(20),
                        ciudadSalida CHAR(12) NOT NULL,
                        paisSalida CHAR(12) NOT NULL,
                        ciudadLlegada CHAR(12) NOT NULL,
                        paisLlegada CHAR(12) NOT NULL,
                        duracion INTEGER(1) UNSIGNED,
                        precio INTEGER(2) UNSIGNED,
                        PRIMARY KEY (identificador),
                        FOREIGN KEY (ciudadSalida, paisSalida)
                                REFERENCES ciudad (nombre, pais),
                        FOREIGN KEY (ciudadLlegada, paisLlegada)
                                REFERENCES ciudad (nombre, pais));


/* TRIGGER para la tabla circuito, define un valor predefinido a todos los */
/* circuitos */

/*CREATE TRIGGER predef_precio BEFORE INSERT ON circuito FOR EACH ROW SET NEW.precio = 200;*/


/* Crea la tabla fechaconsalidas */

CREATE TABLE fechaconsalidas (fecha DATE NOT NULL,
                        PRIMARY KEY (fecha));


/* Crea la tabla fechacircuito */

CREATE TABLE fechacircuito (identificador CHAR(5) NOT NULL,
                        fechaSalida DATE NOT NULL,
                        ndPersonas INTEGER(1) UNSIGNED,
                        PRIMARY KEY (identificador, fechaSalida),
                        FOREIGN KEY (identificador)
                                REFERENCES circuito (identificador),
                        FOREIGN KEY (fechaSalida)
                                REFERENCES fechaconsalidas (fecha));


/* Crea la tabla etapa */

CREATE TABLE etapa (identificador CHAR(5) NOT NULL,
                        orden INTEGER(1) UNSIGNED NOT NULL,
                        nombreLugar CHAR(12) NOT NULL,
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        duracion INTEGER(1) UNSIGNED,
                        PRIMARY KEY (identificador, nombreLugar),
                        FOREIGN KEY (identificador)
                                REFERENCES circuito (identificador),
                        FOREIGN KEY (nombreLugar)
                                REFERENCES lugaravisitar (nombre),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));


/* Crea la tabla hotel */

CREATE TABLE hotel (nombre CHAR(12) NOT NULL,
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        direccion CHAR(20) NOT NULL,
                        numCuartos INTEGER(2) UNSIGNED,
                        precioCuarto INTEGER(2) UNSIGNED,
                        precioDesayuno INTEGER(2) UNSIGNED,
                        PRIMARY KEY (direccion),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));


/* Crea la tabla cliente */

CREATE TABLE cliente (nombre CHAR(12) NOT NULL,
                        direccion CHAR(20),
                        tipoDePago CHAR(1),
                        tipo CHAR(12),
                        añoRegistro DATE,
                        password CHAR(12),
                        PRIMARY KEY (nombre));


/* Crea la tabla simulacion */

CREATE TABLE simulacion (nombreUsuario CHAR(12) NOT NULL,
                        fechaSalida DATE NOT NULL,
                        noPersonas INTEGER(1) UNSIGNED,
                        ciudadDestino CHAR(12) NOT NULL,
                        paisDestino CHAR(12) NOT NULL,
                        codSimulacion CHAR(22) NOT NULL,
                        PRIMARY KEY (nombreUsuario),
                        FOREIGN KEY (ciudadDestino, paisDestino)
                                REFERENCES ciudad (nombre, pais),
                        FOREIGN KEY (fechaSalida)
                                REFERENCES fechaconsalidas (fecha),
                        FOREIGN KEY (nombreUsuario)
                                REFERENCES cliente (nombre));


/* Crea la tabla reservaciones */

CREATE TABLE reservaciones (nombreUsuario CHAR(12) NOT NULL,
                        fechaSalida DATE NOT NULL,
                        noPersonas INTEGER(1) UNSIGNED,
                        ciudadDestino CHAR(12) NOT NULL,
                        paisDestino CHAR(12) NOT NULL,
                        validada TINYINT(1) UNSIGNED,
                        formaDePago CHAR(1),
                        claveR INTEGER(5),
                        PRIMARY KEY (nombreUsuario),
                        FOREIGN KEY (ciudadDestino, paisDestino)
                                REFERENCES ciudad (nombre, pais),
                        FOREIGN KEY (fechaSalida)
                                REFERENCES fechaconsalidas(fecha),
                        FOREIGN KEY (nombreUsuario)
                                REFERENCES cliente(nombre));



CREATE TABLE circuitoselec(nombreUsuario CHAR(12) NOT NULL,
                        identificador CHAR(5) NOT NULL,
                        PRIMARY KEY (nombreUsuario, identificador),
                        FOREIGN KEY nombreUsuario
                                REFERENCES simulacion (nombreUsuario),
                        FOREIGN KEY identificador
                                REFERENCES circuito (identificador));

CREATE TABLE ciudadselec(nombreUsuario CHAR(12) NOT NULL,
                        nombre CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        PRIMARY KEY (nombreUsuario, nombre, pais),
                        FOREIGN KEY (nombreUsuario)
                                REFERENCES simulacion (nombreUsuario),
                        FOREIGN KEY (nombre, pais)
                                REFERENCES ciudad (nombre, pais));

CREATE TABLE lugarselec( nombreUsuario CHAR(12) NOT NULL,
                         nombre CHAR(12) NOT NULL,
                         PRIMARY KEY (nombreUsuario, nombre)
                         FOREIGN KEY nombreUsuario
                                 REFERENCES simulacion (nombreUsuario),
                         FOREIGN KEY nombre
                                 REFERENCES lugaravisitar (nombre));

CREATE TABLE hotelselec(nombreUsuario CHAR(12) NOT NULL,
                        direccion CHAR(20) NOT NULL,
                        FOREIGN KEY nombreUsuario
                            REFERENCES simulacion(nombreUsuario),
                        FOREIGN KEY direccion
                            REFERENCES hotel(direccion));


/* Inserta los datos para la tabla ciudad */
/*                          nombre,       pais */

INSERT INTO ciudad VALUES ("Puebla",     "Mexico");
INSERT INTO ciudad VALUES ("Veracruz",   "Mexico");
INSERT INTO ciudad VALUES ("Monterrey",  "Mexico");
INSERT INTO ciudad VALUES ("Atlixco",    "Mexico");
INSERT INTO ciudad VALUES ("DF",         "Mexico");
INSERT INTO ciudad VALUES ("Tuxtla",     "Mexico");
INSERT INTO ciudad VALUES ("Tonala",     "Mexico");
INSERT INTO ciudad VALUES ("Orizaba",    "Mexico");
INSERT INTO ciudad VALUES ("Merida",     "Mexico");
INSERT INTO ciudad VALUES ("Yucatan",    "Mexico");
INSERT INTO ciudad VALUES ("Cancun",     "Mexico");
INSERT INTO ciudad VALUES ("Tepoztlan",  "Mexico");
INSERT INTO ciudad VALUES ("Cuernavaca", "Mexico");
INSERT INTO ciudad VALUES ("Tlaxcala",   "Mexico");


/* Inserta los datos para la tabla lugaravisitar */
/*                                 nombre,         ciudad,       pais,     direccion,              descripcion,         precio */

INSERT INTO lugaravisitar VALUES ("Lugar Pue 1",  "Puebla",     "Mexico", "dir Lugar Pue 1",      "desc Lugar Pue 1",      169);
INSERT INTO lugaravisitar VALUES ("Lugar Pue 2",  "Puebla",     "Mexico", "dir Lugar Pue 2",      "desc Lugar Pue 2",       92);

INSERT INTO lugaravisitar VALUES ("Lugar Ver 1",  "Veracruz",   "Mexico", "dir Lugar Ver 1",      "desc Lugar Ver 1",      424);
INSERT INTO lugaravisitar VALUES ("Lugar Ver 2",  "Veracruz",   "Mexico", "dir Lugar Ver 2",      "desc Lugar Ver 2",      361);
INSERT INTO lugaravisitar VALUES ("Lugar Ver 3",  "Veracruz",   "Mexico", "dir Lugar Ver 3",      "desc Lugar Ver 3",      250);

INSERT INTO lugaravisitar VALUES ("Lugar Mon 1",  "Monterrey",  "Mexico", "dir Lugar Mon 1",      "desc Lugar Mon 1",       90);

INSERT INTO lugaravisitar VALUES ("Lugar Atl 1",  "Atlixco",    "Mexico", "dir Lugar Atl 1",      "desc Lugar Atl 1",      293);

INSERT INTO lugaravisitar VALUES ("Lugar DF 1",   "DF",         "Mexico", "dir Lugar DF 1",       "desc Lugar DF 1",       119);
INSERT INTO lugaravisitar VALUES ("Lugar DF 2",   "DF",         "Mexico", "dir Lugar DF 2",       "desc Lugar DF 2",         0);

INSERT INTO lugaravisitar VALUES ("Lugar Tux 1",  "Tuxtla",     "Mexico", "dir Lugar Tux 1",      "desc Lugar Tux 1",        0);
INSERT INTO lugaravisitar VALUES ("Lugar Tux 2",  "Tuxtla",     "Mexico", "dir Lugar Tux 2",      "desc Lugar Tux 2",       47);

INSERT INTO lugaravisitar VALUES ("Lugar Ton 1",  "Tonala",     "Mexico", "dir Lugar Ton 1",      "desc Lugar Ton 1",      244);
INSERT INTO lugaravisitar VALUES ("Lugar Ton 2",  "Tonala",     "Mexico", "dir Lugar Ton 2",      "desc Lugar Ton 2",      488);
INSERT INTO lugaravisitar VALUES ("Lugar Ton 3",  "Tonala",     "Mexico", "dir Lugar Ton 3",      "desc Lugar Ton 3",      425);
INSERT INTO lugaravisitar VALUES ("Lugar Ton 4",  "Tonala",     "Mexico", "dir Lugar Ton 4",      "desc Lugar Ton 4",       66);

INSERT INTO lugaravisitar VALUES ("Lugar Ori 1",  "Orizaba",    "Mexico", "dir Lugar Ori 2",      "desc Lugar Ori 2",       15);
INSERT INTO lugaravisitar VALUES ("Lugar Ori 2",  "Orizaba",    "Mexico", "dir Lugar Ori 3",      "desc Lugar Ori 3",        0);

INSERT INTO lugaravisitar VALUES ("Lugar Mer 1",  "Merida",     "Mexico", "dir Lugar Mer 1",      "desc Lugar Mer 1",      142);
INSERT INTO lugaravisitar VALUES ("Lugar Mer 2",  "Merida",     "Mexico", "dir Lugar Mer 2",      "desc Lugar Mer 2",      261);
INSERT INTO lugaravisitar VALUES ("Lugar Mer 3",  "Merida",     "Mexico", "dir Lugar Mer 3",      "desc Lugar Mer 3",       26);

INSERT INTO lugaravisitar VALUES ("Lugar Yuc 1",  "Yucatan",    "Mexico", "dir Lugar Yuc 1",      "desc Lugar Yuc 1",       18);

INSERT INTO lugaravisitar VALUES ("Lugar Can 1",  "Cancun",     "Mexico", "dir Lugar Can 1",      "desc Lugar Can 1",        0);
INSERT INTO lugaravisitar VALUES ("Lugar Can 2",  "Cancun",     "Mexico", "dir Lugar Can 2",      "desc Lugar Can 2",      133);
INSERT INTO lugaravisitar VALUES ("Lugar Can 3",  "Cancun",     "Mexico", "dir Lugar Can 3",      "desc Lugar Can 3",      190);
INSERT INTO lugaravisitar VALUES ("Lugar Can 4",  "Cancun",     "Mexico", "dir Lugar Can 4",      "desc Lugar Can 4",      480);
INSERT INTO lugaravisitar VALUES ("Lugar Can 5",  "Cancun",     "Mexico", "dir Lugar Can 5",      "desc Lugar Can 5",       35);
INSERT INTO lugaravisitar VALUES ("Lugar Can 6",  "Cancun",     "Mexico", "dir Lugar Can 6",      "desc Lugar Can 6",      323);

INSERT INTO lugaravisitar VALUES ("Lugar Tep 1",  "Tepoztlan",  "Mexico", "dir Lugar Tep 1",      "desc Lugar Tep 1",       77);

INSERT INTO lugaravisitar VALUES ("Lugar Cue 1",  "Cuernavaca", "Mexico", "dir Lugar Cue 1",      "desc Lugar Cue 1",      116);

INSERT INTO lugaravisitar VALUES ("Lugar Tla 1",  "Tlaxcala",   "Mexico", "dir Lugar Tla 1",      "desc Lugar Tla 1",      0);


/* Inserta los datos para la tabla circuito */
/*                     identificador, descripción,  ciudadSalida, paisSalida, ciudadLlegada, paisLlegada, duracion, precio */

INSERT INTO circuito VALUES("C0001", "desc C0001", "Puebla",     "Mexico",   "Orizaba",     "Mexico",         16,   1915);
INSERT INTO circuito VALUES("C0002", "desc C0002", "Tlaxcala",   "Mexico",   "DF",          "Mexico",          3,   1966);
INSERT INTO circuito VALUES("C0003", "desc C0003", "Veracruz",   "Mexico",   "Cancun",      "Mexico",          8,   2521);
INSERT INTO circuito VALUES("C0004", "desc C0004", "Cuernavaca", "Mexico",   "Merida",      "Mexico",         11,   1835);
INSERT INTO circuito VALUES("C0005", "desc C0005", "Puebla",     "Mexico",   "Cancun",      "Mexico",          4,   1690);
INSERT INTO circuito VALUES("C0006", "desc C0006", "DF",         "Mexico",   "Veracruz",    "Mexico",         14,   2244);
INSERT INTO circuito VALUES("C0007", "desc C0007", "DF",         "Mexico",   "Cancun",      "Mexico",          6,   1389);
INSERT INTO circuito VALUES("C0008", "desc C0008", "DF",         "Mexico",   "Tlaxcala",    "Mexico",         10,   2490);
INSERT INTO circuito VALUES("C0009", "desc C0009", "Puebla",     "Mexico",   "Tepoztlan",   "Mexico",          4,   2156);
INSERT INTO circuito VALUES("C0010", "desc C0010", "Monterrey",  "Mexico",   "Atlixco",     "Mexico",         16,   2135);


/* Inserta los datos para la tabla fechaconsalidas */
/*                                      fecha */

INSERT INTO fechaconsalidas VALUES ("2017-12-12");
INSERT INTO fechaconsalidas VALUES ("2017-12-13");
INSERT INTO fechaconsalidas VALUES ("2017-12-14");
INSERT INTO fechaconsalidas VALUES ("2017-12-15");
INSERT INTO fechaconsalidas VALUES ("2017-12-16");
INSERT INTO fechaconsalidas VALUES ("2017-12-17");


/* Inserta los datos para la tabla fechacircuito */
/*                         identificador,  fechaSalida,  ndPersonas */

INSERT INTO fechacircuito VALUES("C0001", "2017-12-12",         10);
INSERT INTO fechacircuito VALUES("C0001", "2017-12-16",         10);

INSERT INTO fechacircuito VALUES("C0002", "2017-12-13",         15);
INSERT INTO fechacircuito VALUES("C0002", "2017-12-17",         40);

INSERT INTO fechacircuito VALUES("C0003", "2017-12-12",         30);
INSERT INTO fechacircuito VALUES("C0003", "2017-12-14",         10);

INSERT INTO fechacircuito VALUES("C0004", "2017-12-13",         15);
INSERT INTO fechacircuito VALUES("C0004", "2017-12-15",         10);

INSERT INTO fechacircuito VALUES("C0005", "2017-12-14",         50);
INSERT INTO fechacircuito VALUES("C0005", "2017-12-16",         40);

INSERT INTO fechacircuito VALUES("C0006", "2017-12-15",         40);
INSERT INTO fechacircuito VALUES("C0006", "2017-12-17",         15);

INSERT INTO fechacircuito VALUES("C0007", "2017-12-13",          8);
INSERT INTO fechacircuito VALUES("C0007", "2017-12-16",         30);

INSERT INTO fechacircuito VALUES("C0008", "2017-12-12",         20);
INSERT INTO fechacircuito VALUES("C0008", "2017-12-17",         20);

INSERT INTO fechacircuito VALUES("C0009", "2017-12-13",         20);
INSERT INTO fechacircuito VALUES("C0009", "2017-12-14",         15);

INSERT INTO fechacircuito VALUES("C0010", "2017-12-14",         20);
INSERT INTO fechacircuito VALUES("C0010", "2017-12-15",         20);


/* Inserta los datos para la tabla etapa */
/*                 identificador, orden,   nombreLugar,     ciudad,       pais,    duracion */

INSERT INTO etapa VALUES("C0001",     1,  "Lugar Pue 1",   "Puebla",     "Mexico", 178);
INSERT INTO etapa VALUES("C0001",     2,  "Lugar Ori 1",   "Orizaba",    "Mexico",  43);

INSERT INTO etapa VALUES("C0002",     1,  "Lugar Ver 1",   "Veracruz",   "Mexico", 155);
INSERT INTO etapa VALUES("C0002",     2,  "Lugar Ver 2",   "Veracruz",   "Mexico", 172);
INSERT INTO etapa VALUES("C0002",     3,  "Lugar Ver 3",   "Veracruz",   "Mexico",  86);

INSERT INTO etapa VALUES("C0003",     1,  "Lugar Mer 3",   "Merida",     "Mexico", 133);
INSERT INTO etapa VALUES("C0003",     2,  "Lugar Yuc 1",   "Yucatan",    "Mexico", 159);
INSERT INTO etapa VALUES("C0003",     3,  "Lugar Can 5",   "Cancun",     "Mexico", 134);

INSERT INTO etapa VALUES("C0004",     1,  "Lugar Tux 1",   "Tuxtla",     "Mexico",  31);
INSERT INTO etapa VALUES("C0004",     2,  "Lugar Ton 3",   "Tonala",     "Mexico",  74);

INSERT INTO etapa VALUES("C0005",     1,  "Lugar Can 2",   "Cancun",     "Mexico", 134);
INSERT INTO etapa VALUES("C0005",     2,  "Lugar Can 4",   "Cancun",     "Mexico", 128);
INSERT INTO etapa VALUES("C0005",     3,  "Lugar Mer 2",   "Merida",     "Mexico", 114);
INSERT INTO etapa VALUES("C0005",     4,  "Lugar Mer 3",   "Merida",     "Mexico", 172);
INSERT INTO etapa VALUES("C0005",     5,  "Lugar Yuc 1",   "Yucatan",    "Mexico",  55);

INSERT INTO etapa VALUES("C0006",     1,  "Lugar Cue 1",   "Cuernavaca", "Mexico",  49);
INSERT INTO etapa VALUES("C0006",     2,  "Lugar Tep 1",   "Tepoztlan",  "Mexico", 157);
INSERT INTO etapa VALUES("C0006",     3,  "Lugar Atl 1",   "Atlixco",    "Mexico",  30);

INSERT INTO etapa VALUES("C0007",     1,  "Lugar Tep 1",   "Tepoztlan",  "Mexico", 165);
INSERT INTO etapa VALUES("C0007",     2,  "Lugar Pue 1",   "Puebla",     "Mexico",  35);

INSERT INTO etapa VALUES("C0008",     1,  "Lugar Tla 1",   "Tlaxcala",   "Mexico", 176);
INSERT INTO etapa VALUES("C0008",     2,  "Lugar Pue 2",   "Puebla",     "Mexico", 175);
INSERT INTO etapa VALUES("C0008",     3,  "Lugar Pue 1",   "Puebla",     "Mexico", 150);

INSERT INTO etapa VALUES("C0009",     1,  "Lugar Can 1",   "Cancun",     "Mexico",  88);
INSERT INTO etapa VALUES("C0009",     2,  "Lugar Can 2",   "Cancun",     "Mexico",  82);
INSERT INTO etapa VALUES("C0009",     3,  "Lugar Can 3",   "Cancun",     "Mexico", 102);
INSERT INTO etapa VALUES("C0009",     4,  "Lugar Can 6",   "Cancun",     "Mexico",  62);

INSERT INTO etapa VALUES("C0010",     1,  "Lugar Ori 1",   "Orizaba",    "Mexico", 100);
INSERT INTO etapa VALUES("C0010",     2,  "Lugar DF 1",    "DF",         "Mexico",  95);


/* Inserta los datos para la tabla hotel */
/*                        nombre,        ciudad,       pais,     direccion, numCuartos, precioCuarto, precioDesayuno */

INSERT INTO hotel VALUES("Hotel Pue 1", "Puebla",     "Mexico", "dir Hotel Pue 1",  50,  540,  50);
INSERT INTO hotel VALUES("Hotel Pue 2", "Puebla",     "Mexico", "dir Hotel Pue 2",  65,  980,  80);
INSERT INTO hotel VALUES("Hotel Pue 3", "Puebla",     "Mexico", "dir Hotel Pue 3",  28,  670,  60);

INSERT INTO hotel VALUES("Hotel Ver 1", "Veracruz",   "Mexico", "dir Hotel Ver 1",  70,  400,  35);

INSERT INTO hotel VALUES("Hotel Mon 1", "Monterrey",  "Mexico", "dir Hotel Mon 1",  88,  500,  50);
INSERT INTO hotel VALUES("Hotel Mon 1", "Monterrey",  "Mexico", "dir Hotel Mon 2", 171,  690,  69);

INSERT INTO hotel VALUES("Hotel Atl 1", "Atlixco",    "Mexico", "dir Hotel Atl 1",  61,  510,  50);

INSERT INTO hotel VALUES("Hotel DF 1",  "DF",         "Mexico", "dir Hotel DF 1",  177,  470,  40);
INSERT INTO hotel VALUES("Hotel DF 2",  "DF",         "Mexico", "dir Hotel DF 2",  159,  760,  70);
INSERT INTO hotel VALUES("Hotel DF 3",  "DF",         "Mexico", "dir Hotel DF 3",   90, 1090, 100);
INSERT INTO hotel VALUES("Hotel DF 4",  "DF",         "Mexico", "dir Hotel DF 4",   28,  680,  68);

INSERT INTO hotel VALUES("Hotel Tux 1", "Tuxtla",     "Mexico", "dir Hotel Tux 1",  82,  840,  84);

INSERT INTO hotel VALUES("Hotel Ton 1", "Tonala",     "Mexico", "dir Hotel Ton 1",  85,  925,  92);

INSERT INTO hotel VALUES("Hotel Ori 1", "Orizaba",    "Mexico", "dir Hotel Ori 1",  58,  850,  85);
INSERT INTO hotel VALUES("Hotel Ori 2", "Orizaba",    "Mexico", "dir Hotel Ori 2",  24,  550,  55);

INSERT INTO hotel VALUES("Hotel Mer 1", "Merida",     "Mexico", "dir Hotel Mer 1", 139, 1010, 100);
INSERT INTO hotel VALUES("Hotel Mer 2", "Merida",     "Mexico", "dir Hotel Mer 2",  86,  380,  38);
INSERT INTO hotel VALUES("Hotel Mer 3", "Merida",     "Mexico", "dir Hotel Mer 3", 103,  645,  64);

INSERT INTO hotel VALUES("Hotel Yuc 1", "Yucatan",    "Mexico", "dir Hotel Yuc 1", 173,  420,  42);
INSERT INTO hotel VALUES("Hotel Yuc 2", "Yucatan",    "Mexico", "dir Hotel Yuc 2", 150,  300,  30);

INSERT INTO hotel VALUES("Hotel Can 1", "Cancun",     "Mexico", "dir Hotel Can 1", 173, 1060, 100);
INSERT INTO hotel VALUES("Hotel Can 2", "Cancun",     "Mexico", "dir Hotel Can 2", 121, 1150, 100);
INSERT INTO hotel VALUES("Hotel Can 3", "Cancun",     "Mexico", "dir Hotel Can 3", 183,  970,  97);
INSERT INTO hotel VALUES("Hotel Can 4", "Cancun",     "Mexico", "dir Hotel Can 4", 198, 1110, 100);
INSERT INTO hotel VALUES("Hotel Can 5", "Cancun",     "Mexico", "dir Hotel Can 5",  72, 1000, 150);
INSERT INTO hotel VALUES("Hotel Can 6", "Cancun",     "Mexico", "dir Hotel Can 6", 181,  800,  80);

INSERT INTO hotel VALUES("Hotel Tep 1", "Tepoztlan",  "Mexico", "dir Hotel Tep 1",  33,  500,  50);

INSERT INTO hotel VALUES("Hotel Cue 1", "Cuernavaca", "Mexico", "dir Hotel Cue 1",  60,  540,  54);
INSERT INTO hotel VALUES("Hotel Cue 2", "Cuernavaca", "Mexico", "dir Hotel Cue 2",  40,  930,  93);

INSERT INTO hotel VALUES("Hotel Tla 1", "Tlaxcala",   "Mexico", "dir Hotel Tla 1",  15,  680,  68);


/* Inserta los datos para la tabla table _______ */

INSERT INTO cliente VALUES ('toño','dir toño','T', 'individual', '2017-12-05','1');

INSERT INTO reservaciones VALUES ('toño','2017-12-15',5,'Atlixco','Mexico',1,'T',190);
