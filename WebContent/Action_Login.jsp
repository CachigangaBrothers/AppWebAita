<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "modelos.ConductorModelo" %>
<%@ page import = "clases.Conductor" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
if (request.getParameter("usuario") != null && request.getParameter("contrasena") != null){
	ConductorModelo conductorModelo = new ConductorModelo();
	String usuario = request.getParameter("usuario");
	String contrase�a = request.getParameter("contrasena");
	Conductor conductor = conductorModelo.select(usuario, contrase�a);
		session.setAttribute("sesion", conductor);
		response.sendRedirect("listar.jsp");
}else{
	response.sendRedirect("Login.jsp");
}
%>
</body>
</html>