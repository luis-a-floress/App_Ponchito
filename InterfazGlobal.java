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

 *				Interfaz Global Class

 *

 * Esta clase .

 *

 */



/*import java.io.*;



public class InterfazGlobal {



    BufferedReader in = null;



    public InterfazGlobal() {

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

}*/



import java.util.Scanner;





public class InterfazGlobal {



	private InterfazAgencia interfazAge;

	private InterfazCliente interfazClien;

	private InterfazPublica interfazPub;



    public InterfazGlobal() {

        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

        System.out.println("¡Bienvenido a Agencia de Viajes PONCHITO!\n\n\n");

    }



	public void run() {

		Scanner input = new Scanner(System.in);

		int opcion;

		do {

			mostrarMenu();

			opcion = input.nextInt();

			menu(opcion);

		} while(opcion <= 4 && opcion >= 1);

	}



	private void mostrarMenu(){

		System.out.println("Eliga una opcion del menu:\n");

		System.out.println("\t1.- Acceso Ponchito Clientes");

		System.out.println("\t2.- Acceso Ponchito Empleados");

		System.out.println("\t3.- Acceso sin cuenta");

		System.out.println("\t4.- Salir");

		System.out.print("\nOpcion: ");

	}







	private void menu(int opcion) {



		Scanner input = new Scanner(System.in);



		switch(opcion) {

    		case 1:

                (new InterfazCliente()).run();

    			/*if(cuenta() == true){

    				int opcionCliente;

    				do {

    					interfazClien.mostrarMenu();

    					opcionCliente = input.nextInt();

    					interfazClien.menu(opcionCliente);

    				} while(opcionCliente <= 2 && opcionCliente >= 1);

    			}*/

    			break;



    		case 2:

                (new InterfazAgencia()).run();

    			/*if(cuenta() == true) {

    				int opcionEmpleados;

    				do {

    					interfazAge.mostrarMenu();

    					opcionEmpleados = input.nextInt();

    					interfazAge.menu(opcionEmpleados);

    				} while(opcionEmpleados <= 6 && opcionEmpleados >= 1);

    			}*/

    			break;



    		case 3:

                (new InterfazPublica()).run();

    			/*int opcionNC;

    			do {

    				interfazPub.mostrarMenu();

    				opcionNC = input.nextInt();

    				interfazPub.menu(opcionNC);

    			} while(opcionNC <= 3 && opcionNC >= 1);*/

    			break;



    		case 4:

    			System.out.println("\n\n\n!Nos vemos a la Proxima!\n\n\n");

    			System.exit(0);

    			break;

		}

	}

}