package clases;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import modelos.ViajeModelo;

public class Utilidad {

	
	public static void refrescarConsola(){
		for (int i = 0; i < 30; i++){
			System.out.println("");
		}
	}
	
	//SI SE LE PASA UN STRING CON FORMATO YYYY-MM-DD DEVUELVE UNA FECHA SQL
		public static java.sql.Date parseDate (String fecha){
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.sql.Date sqlDate = null;
			java.util.Date utilDate;
			try {
			utilDate = sdf.parse(fecha);
			sqlDate = new java.sql.Date (utilDate.getTime());
			
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				System.err.println("Error al parsear Fecha");
			}
			return sqlDate;
		}
		
		
	
}
