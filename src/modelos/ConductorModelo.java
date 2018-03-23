package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import clases.Conector;

public class ConductorModelo extends Conector {

	public String getNombre(int id) throws SQLException{
		PreparedStatement pst = super.conexion.prepareStatement("select nombre from conductor where id_conductor = ?");
		pst.setInt(1, id);
		ResultSet rs = pst.executeQuery();
		rs.next();
		
		return rs.getString("nombre");
	}
	
}
