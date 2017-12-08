import java.util.Scanner;

public class Folleto {

    public Folleto() {
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
        System.out.println("Consulta nuestro folleto\n\n");
    }

    public void run() {

		Scanner input = new Scanner(System.in);
		int opcion;
		do {
			mostrarMenu();
			opcion = input.nextInt();
            if(menu(opcion)) return;

		} while(opcion <= 6 && opcion >= 1);
	}

	private void mostrarMenu(){

		System.out.println("\nEliga una opcion del menu:");

		System.out.println("\t1.- Consultar ciudades");

		System.out.println("\t2.- Consultar circuitos");

		System.out.println("\t3.- Consultar lugares a visitar");

		System.out.println("\t4.- Consultar hoteles");

        System.out.println("\t5.- Regresar");

		System.out.println("\t6.- Salir");

		System.out.print("\nOpcion: ");

	}



	private boolean menu(int opcion) {

		switch(opcion){

    		case 1:
    			//System.out.println("Esta en consultar ciudades");
                (new Query()).consultarCiudades();
    			break;

    		case 2:
    			//System.out.println("Esta en consultar circuito");
                (new Query()).consultarCircuitos();
    			break;

    		case 3:
    			//System.out.println("Esta en consultar lugares a visitar");
                (new Query()).consultarLugares();
    			break;

    		case 4:
    			//System.out.println("Esta en consultar hoteles");
                (new Query()).consultarHoteles();
    			break;

    		case 5:
                return true;
            case 6:
    			System.out.println("\n\n\n!Nos vemos a la Proxima!\n\n\n");
    			System.exit(0);
    			break;

		}
		return false;
	}
}
