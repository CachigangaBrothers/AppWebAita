package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clases.Conductor;
import clases.Conector;

public class ConductorModelo extends Conector {
	
	public Conductor select (int id) throws SQLException{
		Conductor conductor = new Conductor();
		PreparedStatement pst = super.conexion.prepareStatement("select * from conductor where id_conductor=?;");
		pst.setInt(1, id);	
		
		ResultSet rs = pst.executeQuery();
		
		rs.next();
		
		conductor.setId_conductor(rs.getInt("id_conductor"));
		conductor.setNombre(rs.getString("nombre"));
		
		return conductor;
	}
	
}
