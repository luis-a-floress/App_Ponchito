/*

				Application Ponchito

Authors: 	ID: 153542	Luis Alberto Flores
			ID: 154422	Alejandro Lobato
			ID: 153424	Jose Antonio Marquez

Date: 	Dec/08/2017

*/



/*

				Main Class

This class runs the Application.

*/



public class Main {
	public static void main(String[] args) {
		ConnectionC conn = new ConnectionC();
		conn.makeConn();
		System.out.println("Conn Succ");
		conn.close();
		System.out.println("Conn Terminated");

	}
}
