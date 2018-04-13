<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@include file="detectarSesionIniciada.jsp" %>
<%@ page import="modelos.*" %>
<%@ page import="clases.*" %>
<% ViajeModelo viajeModelo = new ViajeModelo(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<% 
	
	int id = Integer.parseInt (request.getParameter("id")); 
	viajeModelo.delete(id);
	
	response.sendRedirect("listar.jsp");
	%>

</body>
</html>