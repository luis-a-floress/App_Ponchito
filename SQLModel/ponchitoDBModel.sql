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


/* Crea la tabla ciudad*/

CREATE TABLE ciudad (nombre CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        PRIMARY KEY (nombre, pais));


/* Crea la tabla lugaravisitar*/

CREATE TABLE lugaravisitar (nombre CHAR(12) NOT NULL,
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        direccion CHAR(20),
                        descripcion CHAR(40),
                        precio INTEGER(2),
                        PRIMARY KEY (nombre),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));



/* Crea la tabla circuito*/

CREATE TABLE circuito (identificador CHAR(5) NOT NULL,
                        descripción CHAR(20),
                        ciudadSalida CHAR(12) NOT NULL,
                        paisSalida CHAR(12) NOT NULL,
                        ciudadLlegada CHAR(12) NOT NULL,
                        paisLlegada CHAR(12) NOT NULL,
                        duracion INTEGER(2),
                        precio INTEGER(2),
                        PRIMARY KEY (identificador),
                        FOREIGN KEY (ciudadSalida, paisSalida)
                                REFERENCES ciudad (nombre, pais),
                        FOREIGN KEY (ciudadLlegada, paisLlegada)
                                REFERENCES ciudad (nombre, pais));



/* Crea la tabla fechaconsalidas */

CREATE TABLE fechaconsalidas (fecha DATE NOT NULL,
                        PRIMARY KEY (fecha));


/* Crea la tabla fechacircuito*/

CREATE TABLE fechacircuito (identificador CHAR(5) NOT NULL,
                        fechaSalida DATE NOT NULL,
                        ndPersonas INTEGER(2),
                        PRIMARY KEY (identificador, fechaSalida),
                        FOREIGN KEY (identificador)
                                REFERENCES circuito (identificador),
                        FOREIGN KEY (fechaSalida)
                                REFERENCES fechaconsalidas (fecha));


/* Crea la tabla etapa*/

CREATE TABLE etapa (identificador CHAR(5) NOT NULL,
                        orden INTEGER(1),
                        nombreLugar CHAR(12) NOT NULL,
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        duración INTEGER(2),
                        PRIMARY KEY (identificador, nombreLugar),
                        FOREIGN KEY (identificador)
                                REFERENCES circuito (identificador),
                        FOREIGN KEY (nombreLugar)
                                REFERENCES lugaravisitar (nombre),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));


/* Crea la tabla hotel*/

CREATE TABLE hotel (nombre CHAR(12),
                        ciudad CHAR(12) NOT NULL,
                        pais CHAR(12) NOT NULL,
                        direccion CHAR(20) NOT NULL,
                        numCuartos INTEGER(2),
                        precioCuarto INTEGER(2),
                        precioDesayuno INTEGER(2),
                        PRIMARY KEY (direccion),
                        FOREIGN KEY (ciudad, pais)
                                REFERENCES ciudad (nombre, pais));


/* Crea la tabla _______*/


/* Inserta los datos desde un archivo para la tabla ciudad */


/* Inserta los datos desde un archivo para la tabla lugaravisitar */


/* Inserta los datos desde un archivo para la tabla circuito */


/* Inserta los datos desde un archivo para la tabla fechacircuito */


/* Inserta los datos desde un archivo para la tabla etapa */


/* Inserta los datos desde un archivo para la tabla hotel */


/* Inserta los datos desde un archivo para la tabla table _______ */
