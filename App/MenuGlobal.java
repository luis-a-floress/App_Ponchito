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
 *				Menu Global Class
 *
 * Esta clase .
 *
 */

import java.io.*;

public class MenuGlobal {

    BufferedReader in = null;

    public MenuGlobal() {
        in = new BufferedReader( new InputStreamReader(System.in) );

    }

    public void displayMenu() {
        System.out.println("¡Bienvenido a Agencia de Viajes PONCHITO!");
        System.out.println("\n\t¿Primera vez que nos visita? (y/n)");
        String ans = "";
        try {
            ans = in.readLine();
        } catch(IOException ex) {
            System.err.println(ex);
        }
        if(ans.equals("y")) {
            System.out.print("Cargando interfaz publica... ");
            System.out.println("cargada");
        } else {
            System.out.print("Cargando interfaz cliente... ");
            System.out.println("cargada");
        }
    }
}
