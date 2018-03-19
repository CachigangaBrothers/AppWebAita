package modelos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clases.Cmr;
import clases.Combustible;
import clases.Conector;
import clases.Utilidad;
import clases.Viaje;

public class CombustibleModelo extends Conector{

	
	//INSERTAR REGISTRO EN COMBUSTIBLE
	public void insertar(Combustible combustible){
		PreparedStatement pst;
		try {
			
			pst = conexion.prepareStatement("INSERT INTO combustible(l_consumidos, km_recorridos, l_repostados, consumo) VALUES (?,?,?,?)");
			
			pst.setInt (1, combustible.getlConsumidos());
			pst.setInt (2, combustible.getKmRecorridos());
			pst.setInt (3, combustible.getlRepostados());
			pst.setInt (4, combustible.getConsumo());
			
			pst.execute();
			System.out.println("COMBUSTIBLE INSERTADO CON ÉXITO");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//CONSEGUIR ÜLTIMO ID_COMBUSTIBLE
	public int getId(){
		PreparedStatement pst;
		ResultSet rs;
		try {
			pst = conexion.prepareStatement("select max(id_combustible)  from combustible;");
				
		rs = pst.executeQuery();
		rs.next();
		return rs.getInt(1);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public void delete (int id){
		try {
			PreparedStatement pst = conexion.prepareStatement("DELETE FROM combustible WHERE id_combustible = ?");
			pst.setInt(1, id);
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("No se ha podido eliminar el registro en 'combustible'");
		}
	
	}
	
	
	public Combustible select(int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("select * from combustible where id_combustible=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Combustible combustible = new Combustible();
		combustible.setlConsumidos(rs.getInt("l_consumidos"));
		combustible.setKmRecorridos(rs.getInt("km_recorridos"));
		combustible.setlRepostados(rs.getInt("l_repostados"));
		combustible.setConsumo(rs.getInt("consumo"));
		combustible.setIdCombustible(getId());
		combustible.setIdCombustible(rs.getInt("id_combustible"));
		
		return combustible;
	}
	
	public void update (Combustible combustible, int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("UPDATE combustible SET l_consumidos=?, km_recorridos=?, l_repostados=?, consumo=? WHERE id_combustible=?");
		
		pst.setInt(1, combustible.getlConsumidos());
		pst.setInt(2, combustible.getKmRecorridos());
		pst.setInt(3, combustible.getlRepostados());
		pst.setInt(4, combustible.getConsumo());
		pst.setInt(5, id);
		
		pst.execute();
	}
}
