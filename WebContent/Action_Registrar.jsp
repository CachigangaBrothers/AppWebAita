<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="modelos.*" %>
<%@ page import="clases.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrando usuario</title>

	<%
		ConductorModelo conductorModelo = new ConductorModelo();
		Conductor conductor = new Conductor();
	
			conductor.setNombre(request.getParameter("nombre"));
			conductor.setUsuario(request.getParameter("usuario"));
			conductor.setContrasena(request.getParameter("contrasena"));
			
		conductorModelo.insert(conductor);
		
		response.sendRedirect("Login.jsp");
	%>

</head>
<body>

</body>
</html>