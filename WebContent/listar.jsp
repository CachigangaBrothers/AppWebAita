<%@ page import = "modelos.ViajeModelo" %>
<%@ page import = "modelos.CombustibleModelo" %>
<%@ page import = "modelos.BusquedaModelo" %>
<%@ page import = "clases.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
  
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar</title>


<style type="text/css">
	tr:nth-child(odd){
	background-color: lightgreen;
	}
	tr:nth-child(even){
	background-color: lightblue;
	}
	
	p.dato{
		padding: 5px 20px;
	}
	
	table.viajes{
		text-align: center;  
		margin-left: 0px;  /* 35% */
	}
	
	.icono:hover {
		box-shadow: 0px 0px 20px 2px black;
		border-radius: 3px;
		
		
	}
	.icono {
		width: auto;
		height: 32px;
	}
	
</style>

</head>
<body>
<% 
	
	BusquedaModelo bm = new BusquedaModelo();
	ViajeModelo viajeModelo = new ViajeModelo();
	ArrayList<Viaje> viajes = viajeModelo.getViajes();
	int cantidadDeDatos = 5; %> 

	<table class='viajes' id="tablaViajes">
	<tr>
		<td>id</td>
		<td>Carga</td>
		<td>Descarga</td>
		<td>Fecha</td>
		<td>Accion</td>
		<td><a href='insertar.jsp'><img src="images/plus.png" id="insertar" class="icono"></a></td>
		<td><a href='Buscar.jsp'><img src="images/lupa.png" id="buscar" class="icono"></a></td>
	</tr>
	
	<%
	for (int i = 0; i < viajes.size(); i++){
		Viaje viaje = viajes.get(i); 
		%>
		<tr>	
			<td><p class="dato"><%= viaje.getIdViaje() %></p></td>
			<td><p class="dato"><%= viaje.getCarga()%></p></td>
			<td><p class="dato"><%= viaje.getDescarga()%></p></td>
			<td><p class="dato"><%= viaje.getFecha()%></p></td>
			<td>
				<p class='dato'>
					<a href='DetallesViaje.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/ojo.png" class="icono"></a>
					<a href='Eliminar.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/papelera.png" class="icono"></a>
					<a href='Modificar.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/lapiz.png" class="icono"></a>
				</p>
			</td>
		</tr>
		<%
	}
	%>
	
	<tr>
		<td><h3>TOTAL</h3></td><td><%= viajeModelo.getCantidadViajes() %></td>
	</tr>
	</table>

</body>
</html>