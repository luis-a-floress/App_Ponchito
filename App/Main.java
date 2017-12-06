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
 *				Main Class
 *
 * Esta clase corre la Aplication.
 *
 */



public class Main {
	public static void main(String[] args) {
		Connect conn = new Connect();
		System.out.println("Conn Succ");
		
		conn.close();
		System.out.println("Conn Terminated");

	}
}
