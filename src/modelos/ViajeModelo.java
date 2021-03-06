package modelos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import clases.Cmr;
import clases.Conductor;
import clases.Conector;
import clases.Utilidad;
import clases.Viaje;

public class ViajeModelo extends Conector{

	CombustibleModelo combustibleModelo = new CombustibleModelo();
	CmrModelo cmrModelo = new CmrModelo();
	
	public Viaje select(int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("select * from viajes where id_Viaje=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Viaje viaje = new Viaje();
		viaje.setCarga(rs.getString("carga"));
		viaje.setDescarga(rs.getString("descarga"));
		viaje.setFecha(Utilidad.parseDate(rs.getString("fecha")));
		viaje.setIdCmr(rs.getInt("id_Cmr"));
		viaje.setIdCombustible(rs.getInt("id_Combustible"));
		viaje.setIdViaje(rs.getInt("id_Viaje"));
		viaje.setKilometraje(rs.getInt("kilometraje"));
		viaje.setIdConductor(rs.getInt("id_conductor"));
		viaje.setNota(rs.getString("nota"));
		
		return viaje;
	}

	//INSERTAR REGISTRO EN VIAJES
	public void insertar (Viaje viaje){
		PreparedStatement pst;
		try {		
			
			pst = conexion.prepareStatement("INSERT INTO viajes(carga, descarga, kilometraje, id_combustible, id_cmr, fecha, id_conductor, nota) VALUES (?,?,?,?,?,?,?,?)");
			pst.setString(1, viaje.getCarga());
			pst.setString(2, viaje.getDescarga());
			pst.setInt   (3, viaje.getKilometraje());
			pst.setInt   (4, combustibleModelo.getId());
			pst.setInt   (5, cmrModelo.getId());
			pst.setDate  (6, viaje.getFecha());
			pst.setInt	 (7, viaje.getIdConductor());
			pst.setString(8, viaje.getNota());
			
			pst.execute();
			System.out.println("VIAJE INSERTADO CON �XITO");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//LISTAR TODOS LOS VIAJES DE LA BASE DE DATOS SIN NING�N FILTRO
	public static void listarViajes(ArrayList<Viaje> viajes){
		
		for (int i = 0; i < viajes.size(); i++){
			Viaje viaje = viajes.get(i);
			System.out.println(viaje.getIdViaje() + "- " + viaje.getCarga() + "  -  " + viaje.getDescarga() + " \t [ " + viaje.getFecha() + " ]");
		}
			
		}

	
	
	public ArrayList<Viaje> getViajes(){
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		try {
			PreparedStatement pst = conexion.prepareStatement("select * from viajes");
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()){
				Viaje viaje = new Viaje();
				
				viaje.setIdViaje(rs.getInt("id_viaje"));
				viaje.setCarga(rs.getString("carga"));
				viaje.setDescarga(rs.getString("descarga"));
				viaje.setKilometraje(rs.getInt("kilometraje"));
				viaje.setIdCombustible(rs.getInt("id_combustible"));
				viaje.setIdCmr(rs.getInt("id_cmr"));
				viaje.setFecha(rs.getDate("fecha"));
				viaje.setIdConductor(rs.getInt("id_conductor"));
				viaje.setNota(rs.getString("nota"));

				lista.add(viaje);
			}
			System.out.println("SE HAN MOSTRADO TODOS LOS VIAJES.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Error en listarViajes()");
		}
		return lista;
	}
	public ArrayList<Viaje> getViajes(Conductor conductor){
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		try {
			PreparedStatement pst = conexion.prepareStatement("select * from viajes where id_conductor=?");
			pst.setInt(1, conductor.getId_conductor());
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()){
				Viaje viaje = new Viaje();
				
				viaje.setIdViaje(rs.getInt("id_viaje"));
				viaje.setCarga(rs.getString("carga"));
				viaje.setDescarga(rs.getString("descarga"));
				viaje.setKilometraje(rs.getInt("kilometraje"));
				viaje.setIdCombustible(rs.getInt("id_combustible"));
				viaje.setIdCmr(rs.getInt("id_cmr"));
				viaje.setFecha(rs.getDate("fecha"));
				viaje.setIdConductor(rs.getInt("id_conductor"));
				viaje.setNota(rs.getString("nota"));

				lista.add(viaje);
			}
			System.out.println("SE HAN MOSTRADO TODOS LOS VIAJES.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("Error en listarViajes(Conductor)");
		}
		return lista;
	}
	
	
	public void delete (int id){
		try {
			CmrModelo cmrModelo = new CmrModelo();
			CombustibleModelo combustibleModelo = new CombustibleModelo();
			PreparedStatement pst = conexion.prepareStatement("DELETE FROM viajes WHERE id_viaje = ?");
			pst.setInt(1, id);
			pst.execute();
			
			cmrModelo.delete(id);
			combustibleModelo.delete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("No se ha podido eliminar el registro en 'viajes'");

		}
	
	}
	
	//DEVUELVE LA CANTIDAD DE VIAJES QUE TIENE LA BASE DE DATOS
	public int getCantidadViajes () throws SQLException{
		
		PreparedStatement pst = super.conexion.prepareStatement("select count(id_viaje) as viajes from viajes");
		ResultSet rs = pst.executeQuery();
		rs.next();
		System.out.println(rs.getInt("viajes"));
		return rs.getInt("viajes");
		
	}
	
	public void update (Viaje viaje, int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("UPDATE viajes SET carga=?, descarga=?, kilometraje=?, fecha=?, id_conductor=?, nota=? WHERE id_viaje=?");
		
		pst.setString(1, viaje.getCarga());
		pst.setString(2, viaje.getDescarga());
		pst.setInt(3, viaje.getKilometraje());
		pst.setDate(4, viaje.getFecha());
		pst.setInt(5, viaje.getIdConductor());
		pst.setString(6, viaje.getNota());
		pst.setInt(7, id);
		
		
		pst.execute();

		
	}
		
	
	
}


	
