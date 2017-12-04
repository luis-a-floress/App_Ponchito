/*
 *
 *                Application Ponchito
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
 * This class runs connects with the database.
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
     * Makes the connection with the database
     *
     */

    public Connect() {
        try {
            System.out.print("Loading MySQL Driver... ");
            Class.forName(DRIVER);
            System.out.println("loaded");

            System.out.print("Connecting to the database... ");
            conn = DriverManager.getConnection(CONN_URL+DB, USER, PASSWD);
            conn.setAutoCommit(false);
            System.out.println("connected");

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("failed");
            conn = null;
            e.printStackTrace(System.err);

        }

    }


    /*
     *          Get Connection
     *
     * Returns the actual connection with the database
     *
     */

    public Connection getConn() {   return conn;    }


    /*
     *          Close connection
     *
     * Closes he connection with the database
     *
     */

    public void close() {
        try {
            System.out.print("Closing connection with the database... ");
            conn.close();
            System.out.println("closed");

        } catch (SQLException e) {
            System.err.println("failed");
            e.printStackTrace(System.err);

        }
    }

}
