package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
}

