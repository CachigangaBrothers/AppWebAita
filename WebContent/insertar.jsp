<%@ page import="clases.*" %>
<%@ page import="modelos.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% Conductor conductorIniciado = (Conductor) session.getAttribute("sesion");%>

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

</style>

<title>Insertar Viaje</title>

</head>
<body>

	<form 
		action="Action_Insertar.jsp"
		method="post">
		<div class="contenedorForm">
			<table>
				<th>
					<td colspan="4"><h1>Insertar Viaje (<%= conductorIniciado.getNombre() %>)</h1></td>
				</th>	
				<tr>
					<td>Lugar Carga</td>
					<td><input type="text" id="carga" name="carga"></td>
					<td><input type="text" id="descarga" name="descarga"></td>
					<td>Lugar Descarga</td>
				</tr>	
				<tr>
					<td>Kilometraje</td>
					<td><input type="number" id="kilometraje" name="kilometraje"></td>
					<td><input type="date" id="fecha" name="fecha"></td>
					<td>Fecha</td>
				</tr>
				<tr>	
					<td>L consumidos</td>
					<td><input type="number" id="lConsumidos" name="litrosConsumidos"></td>
					<td><input type="number" id="kmRecorridos" name="kmRecorridos"></td>
					<td>Km Recorridos</td>
				</tr>	
				<tr>
					<td>L Repostados</td>
					<td><input type="number" id="lRepostados" name="litrosRepostados"></td>
					<td><input type="number" id="consumo" name="consumo"></td>
					<td>Consumo</td>
				</tr>
				<tr>
					<td>Número Cmr</td>
					<td><input type="number" id="num_cmr" name="numCmr"></td>
					<td><input type="number" id="peso" name="peso"></td>
					<td>Peso</td>
				</tr>
				<tr>
					<td colspan="4"> <textarea rows="10" cols="50"></textarea> </td>
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