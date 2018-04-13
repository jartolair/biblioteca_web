<%@page import="modelo.UsuarioModelo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblioteca</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/style.css" type="text/css">
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
	<h1>Usuarios</h1>
	<table  class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Nombre</th>
				<th scope="col">Apellido</th>
				<th scope="col">Edad</th>
				<th scope="col">DNI</th>
				<th scope="col">Fecha de nacimiento</th>
			</tr>
		</thead>
		<tbody>
			<%
				UsuarioModelo usuarioModelo = new UsuarioModelo();
				ArrayList<Usuario> usuarios = usuarioModelo.selectAll();
	
				Iterator<Usuario> i = usuarios.iterator();
				while (i.hasNext()) {
					Usuario usuario = i.next();
					out.print("<tr>");
					out.print("<td>" + usuario.getNombre() + "</td>");
					out.print("<td>" + usuario.getApellido() + "</td>");
					out.print("<td>" + usuario.getEdad() + "</td>");
					out.print("<td>" + usuario.getDni() + "</td>");
					out.print("<td>" + usuario.getFecha_nac() + "</td>");
					out.print("</tr>");
				}
			%>
	</tbody>
	</table>
	<a href="usuarios.jsp">Atras</a>
</body>
</html>