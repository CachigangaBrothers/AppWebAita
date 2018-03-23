package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



import clases.Conector;
import clases.Viaje;
public class BusquedaModelo extends Conector{

	
	public ArrayList<Viaje> busquedaConsumo(String tipo, int consumo, String colOrden, String orden){
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		
		PreparedStatement pst;
		ResultSet rs = null;
		
		try {
			
			pst = conexion.prepareStatement("select * from viajes v inner join combustible c on v.id_combustible = c.id_combustible where consumo " + tipo + " ? order by " + colOrden + " " + orden + ";");
			pst.setInt(1, consumo);
			
			rs = pst.executeQuery();
			
			while (rs.next()){
				Viaje viaje = new Viaje();
				System.out.println(rs.getInt(1) + "- " + rs.getString(2) + " --> " + rs.getString(3) + "  [" + rs.getDate("fecha") + "]   " + "[Consumo --> " + rs.getInt("consumo") + "]");
			
				viaje.setIdViaje(rs.getInt(1));
				viaje.setCarga(rs.getString(2));
				viaje.setDescarga(rs.getString(3));
				viaje.setFecha(rs.getDate("fecha"));
				
				
				lista.add(viaje);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error en busquedaConsumo()");
		}
		return lista;	
	}
	


public ArrayList<Viaje> busquedaLugar (String lugar, String nombre, String orden, String colOrden){
	ArrayList<Viaje> lista = new ArrayList<Viaje>();
	
	PreparedStatement pst;
	ResultSet rs = null;
	
	try {
		
		pst = conexion.prepareStatement("select * from viajes v inner join combustible where " + lugar + " like ? group by id_viaje order by " + colOrden + " " + orden + ";");
		pst.setString(1, nombre);
		
		rs = pst.executeQuery();
		
		while (rs.next()){
			System.out.println(rs.getInt(1) + "- " + rs.getString(2) + " --> " + rs.getString(3) + "  [" + rs.getDate("fecha") + "]   " + "[Consumo --> " + rs.getInt("consumo") + "]");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.out.println("Error en busquedaConsumo()");
	}
	return null;	
}
	
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
		
		lista.add(viaje);
	}
	
	
	return lista;
	
}


}

