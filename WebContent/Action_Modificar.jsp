<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="clases.*" %>
   <%@ page import="modelos.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insertando viaje</title>
</head>
<body>

<%
	ViajeModelo viajeModelo = new ViajeModelo();
	CmrModelo cmrModelo = new CmrModelo();
	CombustibleModelo combustibleModelo = new CombustibleModelo();
	Conductor conductorIniciado = (Conductor)session.getAttribute("sesion");
	
	Viaje viaje = new Viaje();
	Cmr cmr = new Cmr();
	Combustible combustible = new Combustible();
	
	//CREAR OBJETO VIAJE CON LOS NUEVOS DATOS
	viaje.setCarga(request.getParameter("carga"));
	viaje.setDescarga(request.getParameter("descarga"));
	
	viaje.setKilometraje(Integer.parseInt(request.getParameter("kilometraje")));
	viaje.setFecha(Utilidad.parseDate (request.getParameter("fecha")));
	
	viaje.setNota(request.getParameter("nota"));
	viaje.setIdConductor(conductorIniciado.getId_conductor());
	
	//CREAR OBJETO CMR CON LOS NUEVOS DATOS
	cmr.setNumCmr(Integer.parseInt(request.getParameter("numCmr")));
	cmr.setPeso(Integer.parseInt(request.getParameter("peso")));
	
	
	//CREAR OBJETO COMBUSTIBLE CON LOS NUEVOS DATOS
	combustible.setlConsumidos(Integer.parseInt(request.getParameter("litrosConsumidos")));
	combustible.setKmRecorridos(Integer.parseInt(request.getParameter("kmRecorridos")));
	combustible.setlRepostados(Integer.parseInt(request.getParameter("litrosRepostados")));
	
	combustible.setConsumo(Integer.parseInt(request.getParameter("consumo")));

	
	int id = Integer.parseInt(request.getParameter("id"));
	
	//ACTUALIZAR LA BASE DE DATOS CON LOS NUEVOS DATOS
	cmrModelo.update(cmr, id);
	combustibleModelo.update(combustible, id);
	viajeModelo.update(viaje, id);
	
	response.sendRedirect("listar.jsp");
	
%>

</body>
</html>