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
			menu(opcion);
		} while(opcion <= 3 && opcion >= 1);
	}

 	public void mostrarMenu(){
 		System.out.println("\nEliga una opcion del menu:");
 		System.out.println("\t1.- Consultar viajes");
 		System.out.println("\t2.- Simular una reservacion");
 		System.out.println("\t3.- Salir");
 		System.out.print("\nOpcion: ");
 	}

 	public void menu(int opcion) {

 		switch(opcion){
 		case 1:
 			System.out.println("Estas en consultar viajes");
 			break;

 		case 2:
 			System.out.println("Estas en simular una reservacion");
 			break;

 		case 3:
 			System.out.println("\n\n\n!Nos vemos a la Proxima!\n\n\n");
 			System.exit(0);
 			break;
 		}
 	}
 }
