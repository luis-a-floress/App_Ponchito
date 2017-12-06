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



/*
 *              Connect Class
 *
 * Esta clase conecta con la base de datos.
 *
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connect {
    private Connection conn;

    private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String CONN_URL = "jdbc:mysql://127.0.0.1/";
	private static final String DB = "ponchito";
	private static final String USER = "root";
	private static final String PASSWD = "";


    /*
     *          Constructor
     *
     * Hace la conexion con la base de datos.
     *
     */

    public Connect() {
        try {
            // Carga el Driver de MySQL
            System.out.print("Cargando MySQL Driver... ");
            Class.forName(DRIVER);
            System.out.println("cargado");

            // Realiza la conexion con la base de datos
            System.out.print("Conectando con la base de datos... ");
            conn = DriverManager.getConnection(CONN_URL+DB, USER, PASSWD);
            System.out.println("conectado");

            // Hace que los commits no sean automaticos, esto nos permitira
            // manejar las transacciones con nuestro programa
            conn.setAutoCommit(false);


        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("fallo");
            conn = null;    // Hace la conexion nula si esta llega a fallar
            e.printStackTrace(System.err);

        }

    }


    /*
     *          Get Connection
     *
     * Regresa la conexion actual con la base de datos.
     *
     */

    public Connection getConn() {   return conn;    }


    /*
     *          Close connection
     *
     * Cierra la conexion con la base de datos
     *
     */

    public void close() {
        try {
            // Cierra la conexion
            System.out.print("Cerrando la conexion con la base de datos... ");
            conn.close();
            System.out.println("cerrada");

        } catch (SQLException e) {
            // Si llega a fallar al cerrar se notifica
            System.err.println("fallo");
            e.printStackTrace(System.err);

        }
    }

}
