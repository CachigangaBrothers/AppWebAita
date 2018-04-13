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

	Viaje viaje = new Viaje();
	Cmr cmr = new Cmr();
	Combustible combustible = new Combustible();
	Conductor conductorIniciado = (Conductor)session.getAttribute("sesion");
	
	viaje.setCarga(request.getParameter("carga"));
	viaje.setDescarga(request.getParameter("descarga"));
	
	viaje.setKilometraje(Integer.parseInt(request.getParameter("kilometraje")));
	viaje.setFecha(Utilidad.parseDate (request.getParameter("fecha")));
	
	viaje.setIdConductor(conductorIniciado.getId_conductor());
	viaje.setNota(request.getParameter("nota"));
	
	
	
	cmr.setNumCmr(Integer.parseInt(request.getParameter("numCmr")));
	cmr.setPeso(Integer.parseInt(request.getParameter("peso")));
	
	combustible.setlConsumidos(Integer.parseInt(request.getParameter("litrosConsumidos")));
	combustible.setKmRecorridos(Integer.parseInt(request.getParameter("kmRecorridos")));
	combustible.setlRepostados(Integer.parseInt(request.getParameter("litrosRepostados")));

	String consumo_str = request.getParameter("consumo");
	int consumo_int = Integer.parseInt(consumo_str);
	combustible.setConsumo(consumo_int);

	
	cmrModelo.insertar(cmr);
	combustibleModelo.insertar(combustible);
	
	viaje.setIdCmr(cmrModelo.getId());
	viaje.setIdCombustible(combustibleModelo.getId());
	
	viajeModelo.insertar(viaje);
	
	response.sendRedirect("listar.jsp");
	
%>

</body>
</html>