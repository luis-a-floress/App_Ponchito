/*

                Application Ponchito

Authors: 	ID: 153542	Luis Alberto Flores
            ID: 154422	Alejandro Lobato
            ID: 153424	Jose Antonio Marquez

Date: 	Dec/08/2017

*/



/*

                Connection Class

This class runs the Application.

*/


import java.sql.*;


public class ConnectionC {
    private Connection conn;


	private static String CONN_URL;
	private static String DB;
	private static String USER;
	private static String PASSWD;


    /*
     *          Constructor
     *
     * Initializes the needed things
     *
     */

    ConnectionC() {
        conn = null;
        CONN_URL = "jdbc:mysql://127.0.0.1/";
        DB = "ponchito";
        USER = "root";
        PASSWD = "";
    }


    /*
     *          Make Connection
     *
     * Makes the connection with the database
     *
     */

    void makeConn() {
        try {
            System.out.print("Loading MySQL Driver... ");
            Class.forName( "com.mysql.jdbc.Driver" ).newInstance();
            System.out.println("loaded");

            System.out.print("Connecting to the database... ");
            conn = DriverManager.getConnection( CONN_URL+DB, USER, PASSWD);
            System.out.println("connected");

        } catch (Exception e) {
            System.err.println("failed");
            e.printStackTrace(System.err);

        }

    }


    /*
     *          Close connection
     *
     * Closes he connection with the database
     */

    void close() {
        try {
            System.out.print("Closing connection with the database... ");
            conn.close();
            System.out.println("closed");

        } catch (Exception e) {
            System.err.println("failed");
            e.printStackTrace(System.err);
            
        }
    }

}
