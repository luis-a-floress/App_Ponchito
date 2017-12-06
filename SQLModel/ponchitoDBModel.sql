/*
 *
 *                Applicacion Ponchito
 *
 * Authors:         ID: 153542      Luis Alberto Flores
 *                  ID: 154422      Alejandro Lobato
 *                  ID: 153424      Jose Antonio Marquez
 *
 * Date:            Dec/08/2017
 *
 */


/* Crea la base de datos */

CREATE DATABASE ponchito;


/* Crea la tabla ciudad*/


/* Crea la tabla lugaravisitar*/


/* Crea la tabla circuito*/


/* Crea la tabla fechacircuito*/


/* Crea la tabla etapa*/


/* Crea la tabla hotel*/


/* Crea la tabla _______*/


/* Carga los datos desde un archivo para la tabla ciudad */

LOAD DATA LOCAL INFILE '~/../Data/ciudad.txt' INTO TABLE ciudad LINES TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla lugaravisitar */

LOAD DATA LOCAL INFILE '~/../Data/lugaravisitar.txt' INTO TABLE lugaravisitar LINES TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla circuito */

LOAD DATA LOCAL INFILE '~/../Data/circuito.txt' INTO TABLE circuito LINES TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla fechacircuito */

LOAD DATA LOCAL INFILE '~/../Data/fechacircuito.txt' INTO TABLE fechacircuito LINES TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla etapa */

LOAD DATA LOCAL INFILE '~/../Data/etapa.txt' INTO TABLE ciudad etapa TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla hotel */

LOAD DATA LOCAL INFILE '~/../Data/hotel.txt' INTO TABLE hotel LINES TERMINATED BY '\n';


/* Carga los datos desde un archivo para la tabla table _______ */

LOAD DATA LOCAL INFILE '~/../Data/_______.txt' INTO TABLE ______ LINES TERMINATED BY '\n';
