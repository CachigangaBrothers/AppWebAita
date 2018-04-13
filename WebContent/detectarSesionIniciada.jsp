<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "clases.Conductor" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	//DETECTAR SI ESTÁ CON LA SESIÓN INICIADA
	Conductor conductorIniciado = new Conductor();
	if(session.getAttribute("sesion") != null){
		conductorIniciado = (Conductor)session.getAttribute("sesion");
	} else{
		response.sendRedirect("Login.jsp");
		return;
		//Thread.sleep(100);
	}
  			
  %>
</body>
</html>