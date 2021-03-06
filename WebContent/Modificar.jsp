<%@ page import="clases.*" %>
<%@ page import="modelos.*" %>
<%@include file="detectarSesionIniciada.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	

<style type="text/css">
	

	div{
		background-color: darkgrey;
		color: white;
		border-radius: 30px;
		
	}
	div.contenedorForm{
		max-width: 600px;
		margin-left: 35%;
	}
	div#botones{
		background-color: grey;
		color: white;
		border-radius: 100px 100px 35px 35px;
	}
	
	table{
		text-align: center;
	}
	tr, td{
		border: 0px solid black;
		height: 100px;
		width: 500px;
	}
	tr#notas{
		height: 20px;
		
	}
	input#id{
		visibility: hidden;
	}

</style>

<title>Modificar Viaje</title>

</head>
<body>
<% 

ViajeModelo viajeModelo = new ViajeModelo();
CmrModelo cmrModelo = new CmrModelo();
CombustibleModelo combustibleModelo = new CombustibleModelo();

Viaje viaje = new Viaje();
Cmr cmr = new Cmr();
Combustible combustible = new Combustible();

int id = Integer.parseInt(request.getParameter("id"));

viaje = viajeModelo.select(id);
cmr = cmrModelo.select(id);
combustible = combustibleModelo.select(id);



%>
	<form 
		action="Action_Modificar.jsp"
		method="post">
		<div class="contenedorForm">
			<table>
				<th>
					<td colspan="4"><h1>Modificar Viaje <input type="text" name="id" value="<%= id %>" id="id"></h1></td>
				</th>	
				<tr>
					<td>Lugar Carga</td>
					<td><input type="text" id="carga" name="carga" value="<%= viaje.getCarga() %>"></td>
					<td><input type="text" id="descarga" name="descarga" value="<%= viaje.getDescarga() %>"></td>
					<td>Lugar Descarga</td>
				</tr>	
				<tr>
					<td>Kilometraje</td>
					<td><input type="number" id="kilometraje" name="kilometraje" value="<%= viaje.getKilometraje() %>"></td>
					<td><input type="date" id="fecha" name="fecha" value="<%= viaje.getFecha() %>"></td>
					<td>Fecha</td>
				</tr>
				<tr>	
					<td>L consumidos</td>
					<td><input type="number" id="lConsumidos" name="litrosConsumidos" value="<%= combustible.getlConsumidos() %>"></td>
					<td><input type="number" id="kmRecorridos" name="kmRecorridos" value="<%= combustible.getKmRecorridos() %>"></td>
					<td>Km Recorridos</td>
				</tr>	
				<tr>
					<td>L Repostados</td>
					<td><input type="number" id="lRepostados" name="litrosRepostados" value="<%= combustible.getlRepostados() %>"></td>
					<td><input type="number" id="consumo" name="consumo" value="<%= combustible.getConsumo() %>"></td>
					<td>Consumo</td>
				</tr>
				<tr>
					<td>N�mero Cmr</td>
					<td><input type="number" id="num_cmr" name="numCmr" value="<%= cmr.getNumCmr() %>"></td>
					<td><input type="number" id="peso" name="peso" value="<%= cmr.getPeso() %>"></td>
					<td>Peso</td>
				</tr>
				<tr>
					<td colspan="4"> <textarea rows="10" cols="50" name="nota"><%= viaje.getNota() %></textarea> </td>
				</tr>
				</table>
				<div id="botones">
				<table>
				<tr>
					<td colspan="2"> <input type="submit"></td>
					<td colspan="2"> <input type="reset"></button></td>
				</tr>
				
				
			</table>
		</div>
		
	</form>
		

</body>
</html>