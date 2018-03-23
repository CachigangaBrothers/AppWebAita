<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="modelos.*" %>
    <%@ page import="clases.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<style type="text/css">
		td{
		width: 50%;
		}
		td.dato{
			text-align: center;
		}
		body{
		text-align: center;
		}
		table{
		margin-left: 35%;
		}
	</style>
<title>Detalles</title>
</head>
<body>

<% 
	ViajeModelo viajeModelo = new ViajeModelo();
	CmrModelo cmrModelo = new CmrModelo();
	CombustibleModelo combustibleModelo = new CombustibleModelo();
	
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("ID Seleccionado --> " + id);
	Viaje viaje = viajeModelo.select(id);
	Cmr cmr = cmrModelo.select(id);
	Combustible combustible = combustibleModelo.select(id);
	

	%>
	
	<div>
		<table border="1px">
			<tr><th colspan="2"><h1>INFORMACIÓN DEL VIAJE</h1></th></tr>
			<tr>
				<td>Lugar de Carga</td>
				<td class="dato"><% out.println(viaje.getCarga()); %></td>
			</tr>
			<tr>
				<td>Lugar de Descarga</td>
				<td class="dato"><% out.println(viaje.getDescarga()); %></td>
			</tr>
			<tr>
				<td>Kilometraje</td>
				<td class="dato"><% out.println(viaje.getKilometraje()); %></td>
			</tr>
			<tr>
				<td>Fecha</td>
				<td class="dato"><% out.println(viaje.getFecha()); %></td>
			</tr>
			<tr>
				<td>Conductor</td>
				<td class="dato"><% out.println(viaje.getIdConductor()); %></td>
			</tr>
			<tr>
				<td>Número CMR</td>
				<td class="dato"><% out.println(cmr.getNumCmr()); %></td>
			</tr>
			<tr>
				<td>Peso</td>
				<td class="dato"><% out.println(cmr.getPeso()); %></td>
			</tr>
			<tr>
				<td>Litros Consumidos</td>
				<td class="dato"><% out.println(combustible.getlConsumidos()); %></td>
			</tr>
			<tr>
				<td>Km Recorridos</td>
				<td class="dato"><% out.println(combustible.getKmRecorridos()); %></td>
			</tr>
			<tr>
				<td>Litros Repostados</td>
				<td class="dato"><% out.println(combustible.getlRepostados()); %></td>
			</tr>
			<tr>
				<td>Consumo</td>
				<td class="dato"><% out.println(combustible.getConsumo()); %></td>
			</tr>
		</table>
		
		
	</div>

</body>
</html>