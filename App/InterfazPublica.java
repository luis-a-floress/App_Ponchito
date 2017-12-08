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
 *				Interfaz Publico Class
 *
 * Esta clase .
 *
 */


import java.util.Scanner;


public class InterfazPublica {

    public InterfazPublica() {

        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("¡Haz tu simulacion!\n\n\n");

    }

	public void run() {

		Scanner input = new Scanner(System.in);
		int opcion;
		do {
			mostrarMenu();
			opcion = input.nextInt();
            if(menu(opcion)) return;

		} while(opcion <= 4 && opcion >= 1);
	}

 	private void mostrarMenu() {

        System.out.println("\nEliga una opcion del menu:");

 		System.out.println("\t1.- Consultar folleto");

 		System.out.println("\t2.- Simular una reservacion");

 		System.out.println("\t3.- Regresar");

 		System.out.println("\t4.- Salir");

 		System.out.print("\nOpcion: ");

 	}

 	private boolean menu(int opcion) {

 		switch(opcion) {
 		case 1:
 			//System.out.println("Estas en consultar viajes");
            (new Folleto()).run();
 			break;

 		case 2:
 			//System.out.println("Estas en simular una reservacion");
            (new Simulacion()).run();
 			break;

        case 3:
 			return true;

 		case 4:
 			System.out.println("\n\n\n!Nos vemos a la Proxima!\n\n\n");
 			System.exit(0);
 			break;

 		}

 		return false;

 	}

 }
