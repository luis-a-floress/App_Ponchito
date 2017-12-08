
public class InterfazAgencia {


	public static void mostrarMenu(){
		System.out.println("Eliga una opcion del menu ");
		System.out.println("1.- Consultar el folleto ");
		System.out.println("2.- Reservaciones de clientes ");
		System.out.println("3.- Crear clientes ");
		System.out.println("4.- Realizar reservaciones ");
		System.out.println("5.- Validar ");
		System.out.println("6.- Salir ");
		System.out.print("Opcion: ");
	}

	public static void menu(int opcion) throws Exception{

		switch(opcion){
		case 1:
			System.out.println("Esta en consultar folleto");
			break;

		case 2:
			System.out.println("Esta en reservaciones de clientes");
			break;

		case 3:
			System.out.println("Esta en crear clientes");
			break;
			
		case 4:
			System.out.println("Esta en realizar reservaciones");
			break;
			
		case 5:
			System.out.println("Esta en validar");
			break;
			
		case 6:
			System.out.println("Adios");
			System.exit(0);
			break;
		}
	}
}
