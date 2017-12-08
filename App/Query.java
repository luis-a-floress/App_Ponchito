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
 *				Query Publico Class
 *
 * Esta clase .
 *
 */


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;


public class Query {

    private Statement stmt = null;
    private Connection conn = null;

    public Query() {
        try {
            conn = (new Connect()).getConn();
            stmt = conn.createStatement();
        } catch (SQLException ex) {
            ex.printStackTrace(System.err);
            conn = null;
            stmt = null;

        }
    }

    public void run() {
        try {
            querySelect();
            /*queryI();
            System.out.println("");
            querySelect();
            conn.rollback();
            System.out.println("");
            querySelect();*/
            close();

        } catch(SQLException ex) {
            ex.printStackTrace(System.err);
        }
    }

    public boolean validarUsuario(String usuario, String contra, String tipo) {
        boolean validuser = true;
        try {
            String statement = "SELECT nombre FROM cliente WHERE nombre LIKE '"
                            + usuario + "' AND password LIKE '" + contra + "'"
                            + "AND tipo LIKE '" + tipo + "';";
            ResultSet rset = stmt.executeQuery( statement );
            if (!rset.isBeforeFirst()) validuser = false;
            rset.close();
            close();
        } catch (SQLException ex) {
            validuser = false;
        }
        return validuser;
    }

    public void consultarReservaciones(String usuario) {
        try {
            String statement = "SELECT * FROM reservaciones WHERE nombreUsuario LIKE '" + usuario + "';";

    		ResultSet rset = stmt.executeQuery(statement);
            System.out.println("\n\nSus Reservaciones son:");
            dumpResultSet(rset);
            rset.close();
            close();
        } catch (SQLException ex) {
            System.out.println("\nHubo un problema al obtener las reservaciones.\n");
        }

    }

    public void consultarCiudades() {
        try {
            String statement = "SELECT * FROM ciudad;";

    		ResultSet rset = stmt.executeQuery(statement);
            System.out.println("\n\nLas ciudades son:");
            dumpResultSet(rset);
            rset.close();
            close();
        } catch (SQLException ex) {
            System.out.println("\nHubo un problema al obtener las ciudades.\n");
        }
    }
    public void consultarCircuitos() {
        try {
            String statement = "SELECT * FROM circuito;";

    		ResultSet rset = stmt.executeQuery(statement);
            System.out.println("\n\nLos circuitos son:");
            dumpResultSet(rset);
            rset.close();
            close();
        } catch (SQLException ex) {
            System.out.println("\nHubo un problema al obtener los circuitos.\n");
        }

    }
    public void consultarLugares() {
        try {
            String statement = "SELECT * FROM lugaravisitar;";

    		ResultSet rset = stmt.executeQuery(statement);
            System.out.println("\n\nLos lugares a visitar son:");
            dumpResultSet(rset);
            rset.close();
            close();
        } catch (SQLException ex) {
            System.out.println("\nHubo un problema al obtener los lugares.\n");
        }

    }
    public void consultarHoteles() {
        try {
            String statement = "SELECT * FROM hotel;";

    		ResultSet rset = stmt.executeQuery(statement);
            System.out.println("\n\nLos hoteles son:");
            dumpResultSet(rset);
            rset.close();
            close();
        } catch (SQLException ex) {
            System.out.println("\nHubo un problema al obtener lor hoteles.\n");
        }

    }


	public void querySelect() throws SQLException {

        String statement = "SELECT * FROM reservaciones WHERE nombreUsuario LIKE 'toñ';";

		ResultSet rset = stmt.executeQuery( statement );
		System.out.println( "Results:" );
		dumpResultSet( rset );
        if (!rset.isBeforeFirst() ) {
            System.out.println("No data");
        }
        System.out.println();
		rset.close();
        close();
	}

    private void queryI() throws SQLException {

        String statement = "INSERT INTO ciudad VALUES ('Koln', 'Alemania');";

        stmt.executeUpdate( statement );

    }

    public void commit() throws SQLException {
        conn.commit();
    }

    public void rollback() throws SQLException {
        conn.rollback();
    }


    public void close() throws SQLException {
        conn.close();
        stmt.close();
    }

    private void dumpResultSet( ResultSet rset ) throws SQLException {

		ResultSetMetaData rsetmd = rset.getMetaData();
		int i = rsetmd.getColumnCount();

		while( rset.next() ) {

			for( int j = 1; j <= i; j++ ) {
				System.out.print( rset.getString(j) + "   \t" );
			}
			System.out.println();
		}
	}
}
