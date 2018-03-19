package modelos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clases.Cmr;
import clases.Conector;
import clases.Utilidad;
import clases.Viaje;

public class CmrModelo extends Conector{

	
	
	public CmrModelo() {
		super();
		// TODO Auto-generated constructor stub
	}


	//INSERTAR REGISTRO EN CMR
	public void insertar(Cmr cmr){
		PreparedStatement pst;
		try {
			pst = conexion.prepareStatement("INSERT INTO cmr(num_cmr, peso) VALUES (?, ?)");
		
		
		pst.setInt   (1, cmr.getNumCmr());
		pst.setInt (2, cmr.getPeso());
		
		pst.execute  ();
		System.out.println("CMR INSERTADO CON ÉXITO");
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//CONSEGUIR ÜLTIMO ID_CMR
	public int getId(){
		PreparedStatement pst;
		ResultSet rs;
		try {
			pst = conexion.prepareStatement("select max(id_cmr)  from cmr;");
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
			PreparedStatement pst = conexion.prepareStatement("DELETE FROM cmr WHERE id_cmr = ?");
			pst.setInt(1, id);
			pst.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("No se ha podido eliminar el registro en 'cmr'");

		}
	
	}
	
	
	public Cmr select(int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("select * from cmr where id_cmr=?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Cmr cmr = new Cmr();
		cmr.setNumCmr(rs.getInt("num_cmr"));
		cmr.setPeso(rs.getInt("peso"));
		
		return cmr;
	}
	
	public void update (Cmr cmr, int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("UPDATE cmr SET num_cmr=?, peso=? WHERE id_cmr=?");
		
		pst.setInt(1, cmr.getNumCmr());
		pst.setInt(2, cmr.getPeso());
		pst.setInt(3, id);
		
		pst.execute();
	}
	
}
