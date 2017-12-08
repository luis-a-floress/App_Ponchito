
public class InterfazPublica {

	public static void mostrarMenu(){
		System.out.println("Eliga una opcion del menu ");
		System.out.println("1.- Consultar viajes ");
		System.out.println("2.- Simular una reservacion ");
		System.out.println("3.- Salir ");
		System.out.print("Opcion: ");
	}

	public static void menu(int opcion) throws Exception{

		switch(opcion){
		case 1:
			System.out.println("Estas en consultar viajes");
			break;

		case 2:
			System.out.println("Estas en simular una reservacion");
			break;

		case 3:
			System.out.println("Adios");
			System.exit(0);
			break;
		}
	}
}
