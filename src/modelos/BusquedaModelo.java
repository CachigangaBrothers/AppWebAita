package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



import clases.Conector;
import clases.Viaje;
public class BusquedaModelo extends Conector{

	
public ArrayList<Viaje> consultaOrdenViaje (String str) throws SQLException{
	ArrayList<Viaje> lista = new ArrayList<Viaje>();
	
	Statement st = super.conexion.createStatement();
	ResultSet rs = st.executeQuery(str);
	
	while (rs.next()){
		Viaje viaje = new Viaje();
		
		viaje.setCarga(rs.getString("carga"));
		viaje.setDescarga(rs.getString("descarga"));
		viaje.setFecha(rs.getDate("fecha"));
		viaje.setIdViaje(rs.getInt("id_viaje"));
		viaje.setIdConductor(rs.getInt("id_conductor"));
		
		lista.add(viaje);
	}
	
	
	return lista;
	
}


}

