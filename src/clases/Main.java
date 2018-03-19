package clases;
import java.sql.SQLException;

import modelos.ViajeModelo;
import vistas.Vistas;

public class Main {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		ViajeModelo vm = new ViajeModelo();
		System.out.println(vm.getCantidadViajes());
		Viaje viaje = new Viaje();
		vm.insertar(viaje);
		//Vistas.menuPrincipal();
		
	}

}
