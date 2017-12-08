import java.util.Scanner;

public class Folleto {

	public static void main(String args[]){

		Scanner input = new Scanner(System.in);

		int opcion;

		do {

			mostrarMenu();

			opcion = input.nextInt();
			if(menu(opcion)){
				return;
			}



		} while(opcion <= 5 && opcion >= 1);

	}

	public static void mostrarMenu(){

		System.out.println("\nEliga una opcion del menu:");

		System.out.println("\t1.- Consultar ciudades");

		System.out.println("\t2.- Consultar circuito");

		System.out.println("\t3.- Consultar lugares a visitar");

		System.out.println("\t4.- Consultar hoteles");

		System.out.println("\t5.- Salir");

		System.out.print("\nOpcion: ");

	}



	public static boolean menu(int opcion) {



		switch(opcion){

		case 1:

			System.out.println("Esta en consultar ciudades");

			break;



		case 2:

			System.out.println("Esta en consultar circuito");

			break;


		case 3:

			System.out.println("Esta en consultar lugares a visitar");

			break;

		case 4:

			System.out.println("Esta en consultar hoteles");

			break;

		case 5:

			System.out.println("\n\n\n!Nos vemos a la Proxima!\n\n\n");

			System.exit(0);

			break;

		}
		return false;
	}
}
