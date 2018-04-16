<% //conductorIniciado --> el objeto de la clase conductor con el que se ha iniciado sesión %>


<%@ page import = "modelos.ViajeModelo" %>
<%@ page import = "modelos.CombustibleModelo" %>
<%@ page import = "modelos.BusquedaModelo" %>
<%@ page import = "modelos.ConductorModelo" %>
<%@ page import = "clases.*" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="detectarSesionIniciada.jsp" %>
  
<% 
String conductor = request.getParameter("idConductor");
int idConductor;
if (conductor != null){
	idConductor = Integer.parseInt(conductor);
} else
	idConductor = 1;

%>
<a href="Action_CerrarSesion.jsp"><sub id="cerrarSesion">Cerrar Sesión</sub></a>
   
  
   
    
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
		padding: 5px;
	}
	.minicono {
		width: auto;
		height: 16px;
		padding: 5px;
	}
	.minicono:hover {
		box-shadow: 0px 0px 20px 2px grey;
		border-radius: 3px;
	}
	.centrado{
		margin: auto;
	}
	#cerrarSesion{
		display: inline;
	}
	#sinBordeDerecho{
		border-right: 0px solid black;
	}
</style>

</head>
<body>

<% 

	
	BusquedaModelo bm = new BusquedaModelo();
	ViajeModelo viajeModelo = new ViajeModelo();
	ConductorModelo conductorModelo = new ConductorModelo();
	ArrayList<Viaje> viajes = new ArrayList<Viaje>();
	
	//BUSCAR VIAJES DEL PROPIO CONDUCTOR o DE TODOS
	if ((boolean)session.getAttribute("misViajes").equals("true")){
		 viajes = viajeModelo.getViajes(conductorIniciado);
	} else {
		viajes = viajeModelo.getViajes();
	}
	
	
	
	
		if ((request.getParameter("orderby") != null) && (request.getParameter("orden")) != null){
		viajes = bm.consultaOrdenViaje("select * from viajes order by " + request.getParameter("orderby") + " " + request.getParameter("orden") + ";");
			}
	
	int cantidadDeDatos = 5; //cantidad de columnas que tendrá la tabla %> 
	<h1>Bienvenido, <%= conductorIniciado.getNombre() %> </h1>
	<h2>Tus Viajes: </h2>
	<table class='viajes' id="tablaViajes">
	<tr>
		<!--  <td>
			<img src="images/clave.png">
			<table class="centrado">
				<tr>
					<td><a href="?orderby=id_viaje&orden=desc"><img src="images/asc.png" class="minicono"></td>
					<td><a href="?orderby=id_viaje&orden=asc"><img src="images/desc.png" class="minicono"></td>
				</tr>
			</table>-->
		</td>
		<td>
			<a href="?id=1"><img src="images/carga.png" class="icono"></a>
			<table class="centrado">
				<tr>
					<td><a href="?orderby=carga&orden=desc"><img src="images/asc.png" class="minicono"></td>
					<td><a href="?orderby=carga&orden=asc"><img src="images/desc.png" class="minicono"></td>
				</tr>
			</table>
		</td>
			<td>
			<a href="?orderby=descarga&orden=asc"><img src="images/descarga.png" class="icono"></a>
			<table class="centrado">
				<tr>
					<td><a href="?orderby=descarga&orden=desc"><img src="images/asc.png" class="minicono"></a></td>
					<td><a href="?orderby=descarga&orden=asc"><img src="images/desc.png" class="minicono"></a></td>
				</tr>
			</table>
			</td>
		<td>
			<a href="?id=5"><img src="images/fecha.png" class="icono"></a>
			<table class="centrado">
				<tr>
					<td><a href="?orderby=fecha&orden=desc"><img src="images/asc.png" class="minicono"></a></td>
					<td><a href="?orderby=fecha&orden=asc"><img src="images/desc.png" class="minicono"></a></td>
				</tr>
				
			</table>
		</td>
		<td>
		  
			<%  if ((boolean)session.getAttribute("misViajes").equals("true")){%>
		 		 <button>Todos Los Viajes</button>
			<% } else { %>
				<button>Mis Viajes</button>
	<% } %>
			
		</td>
		<% if (conductorIniciado.getId_conductor() != 0){
			out.print("<td><a href='insertar.jsp'><img src='images/plus.png' id='insertar' class='icono'></a></td>");
		} %>
		<td>	<input type="text" id="buscar" name="buscar"> 
			<br>
			<a href='Buscar.jsp'><img src="images/lupa.png" id="buscar" class="icono"></a>
		</td>
	</tr>
	
	<%
	for (int i = 0; i < viajes.size(); i++){
		Viaje viaje = viajes.get(i); 
		%>
		<tr>	
			<!--   <td><p class="dato"><%= viaje.getIdViaje() %></p></td> -->
			<td><p class="dato"><%= viaje.getCarga()%></p></td>
			<td><p class="dato"><%= viaje.getDescarga()%></p></td>
			<td><p class="dato"><%= viaje.getFecha()%></p></td>
			
			<td>
				<% if ((conductorIniciado.getId_conductor() == viaje.getIdConductor()) || conductorIniciado.getId_conductor() == 0){
					%>
					
						<p class='dato'>
							<a href='DetallesViaje.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/ojo.png" class="icono"></a>
							<a href='Eliminar.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/papelera.png" class="icono"></a>
							<a href='Modificar.jsp?id=<%= viaje.getIdViaje()%>'><img src="images/lapiz.png" class="icono"></a>
						</p>
					
					
				<%  }  %>
			</td>
		</tr>
		<%
	}
	%>
	
	<tr>
		<td><img src="images/camion.png"><br><%= viajeModelo.getCantidadViajes() %></td>
	</tr>
	</table>

</body>
</html>