
public class InterfazCliente {

	public static void mostrarMenu(){
		System.out.println("Eliga una opcion del menu ");
		System.out.println("1.- Consultar reservaciones ");
		System.out.println("2.- Salir ");
		System.out.print("Opcion: ");
	}

	public static void menu(int opcion) throws Exception{

		switch(opcion){
		case 1:
			System.out.println("Esta en consultar reservaciones");
			break;

		case 2:
			System.out.println("Adios");
			System.exit(0);
			break;
		}
	}
}
