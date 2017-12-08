import java.util.Scanner;


public class InterfazGlobal {

	static InterfazAgencia interfazAge;
	static InterfazCliente interfazClien;
	static InterfazPublica interfazPub;

	public static void main(String[] args) throws Exception{
		Scanner input = new Scanner(System.in);
		int opcion;	
		do{
			mostrarMenu();
			opcion = input.nextInt();
			menu(opcion);
		}while(opcion <= 4 && opcion >= 1);
	}

	private static void mostrarMenu(){
		System.out.println("Eliga una opcion del menu ");
		System.out.println("1.- Acceso Ponchito clientes ");
		System.out.println("2.- Acceso Ponchito empleados ");
		System.out.println("3.- Acceso sin cuenta ");
		System.out.println("4.- Salir ");
		System.out.print("Opcion: ");
	}

	private static boolean cuenta(){
		Scanner input = new Scanner(System.in);
		boolean cuenta;
		String usuario;
		System.out.print("Introduzca su usuario no mayor a 12 letras: ");
		usuario = input.nextLine();
		System.out.print("Introduzca su contrasena no mayor a 12 letras: ");
		String contra;
		contra = input.nextLine();
		if(contra.length() <= 12 && usuario.length() <= 12){
			cuenta = true;
		}
		else{
			cuenta = false;
		}

		return cuenta;
	}

	private static void menu(int opcion) throws Exception{

		Scanner input = new Scanner(System.in);

		switch(opcion){
		case 1:
			if(cuenta() == true){
				int opcionCliente;	
				do{
					interfazClien.mostrarMenu();
					opcionCliente = input.nextInt();
					interfazClien.menu(opcionCliente);
				}while(opcionCliente <= 2 && opcionCliente >= 1);
			}
			break;

		case 2:
			if(cuenta() == true){
				int opcionEmpleados;	
				do{
					interfazAge.mostrarMenu();
					opcionEmpleados = input.nextInt();
					interfazAge.menu(opcionEmpleados);
				}while(opcionEmpleados <= 6 && opcionEmpleados >= 1);
			}
			break;

		case 3:
			int opcionNC;	
			do{
				interfazPub.mostrarMenu();
				opcionNC = input.nextInt();
				interfazPub.menu(opcionNC);
			}while(opcionNC <= 3 && opcionNC >= 1);
			break;

		case 4:
			System.out.println("Adios");
			System.exit(0);
			break;
		}
	}
}
