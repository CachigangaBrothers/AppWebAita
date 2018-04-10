package modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.websocket.Session;

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
	
	public Conductor select (String usuario, String contrasena) throws SQLException{
		
			PreparedStatement pst = super.conexion.prepareStatement("select * from conductor where usuario=? and contraseña=?;");
				pst.setString(1, usuario);
				pst.setString(2, contrasena);
			ResultSet rs = pst.executeQuery();
			rs.next();
			Conductor conductor = new Conductor();
				
				conductor.setId_conductor(rs.getInt("id_conductor"));
				conductor.setNombre(rs.getString("nombre"));
				conductor.setUsuario(rs.getString("usuario"));
				conductor.setContrasena(rs.getString("contraseña"));
				
			
		return conductor;
	}
	
}
