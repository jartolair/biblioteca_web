<%@page import="modelo.PrestamoModelo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Prestamo"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblioteca</title>
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
	.entregado{
		background-color:green;
	}
	.noentregado{
		background-color:red;
	}
	
</style>
</head>
<body>
<div id="userDiv">
	<%
	Object u=session.getAttribute("usuario");
	if (u!=null){
		Usuario usuario=(Usuario) u;
		out.print(usuario.getDni());
		%><br><a href="../logout.jsp">Cerrar sesion</a><%
	}else{
		response.sendRedirect("../login.jsp");
	}
	%>
	</div>
<h1>Prestamos</h1>
<table  class="table table-striped">
	<thead>
	<tr>
		<th scope="col">Libro</th>
		<th scope="col">Usuario</th>
		<th scope="col">Fecha de prestamo</th>
		<th scope="col">Fecha limite</th>
		<th scope="col">Estado</th>
	</tr>
	</thead>
	<tbody>
	<%
	PrestamoModelo prestamoModelo=new PrestamoModelo();
	ArrayList<Prestamo> prestamos=prestamoModelo.selectAll();
	
	Iterator<Prestamo> i= prestamos.iterator();
	while(i.hasNext()){
		Prestamo prestamo=i.next();
		out.print("<tr>");
		out.print("<td>"+prestamo.getLibro().getTitulo()+"-"+prestamo.getLibro().getAutor()+"</td>");
		out.print("<td>"+prestamo.getUsuario().getDni()+"</td>");
		out.print("<td>"+prestamo.getFechaPrestamo()+"</td>");
		out.print("<td>"+prestamo.getFechaLimite()+"</td>");
		if(prestamo.isEntregado()){
			out.print("<td class='entregado'>Entregado</td>");
		}else{
			out.print("<td class='noentregado'>Sin entregar</td>");
		}
		out.print("</tr>");
	}
	
	
	
	%>
</tbody>
</table>
<a href="prestamos.jsp">Atras</a>
</body>
</html>