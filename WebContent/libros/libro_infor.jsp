<%@page import="modelo.LibroModelo"%>
<%@page import="modelo.Libro"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
LibroModelo libroModelo=new LibroModelo();
String paraLibro=request.getParameter("idLibro");

if (paraLibro!=null){
	
	int id=Integer.parseInt(paraLibro);
	Libro libro=libroModelo.select(id);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Libros</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<h1>INFORMACION DE LIBRO</h1>
	<div class="row">
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
		<div class="col-xs-10 col-sm-10 col-md-6 col-lg-6">
			<table>
				<tr>
					<th>Titulo</th>
					<td><%out.print(libro.getTitulo());%></td>
				</tr>
				<tr>
					<th>Autor</th>
					<td><%out.print(libro.getAutor()); %></td>
				</tr>
			</table>
			<p><%=libro.getSinopsis()%>
			</p>
		</div>
	
		<div class="col-xs-10 col-sm-10 col-md-4 col-lg-4">
			<img src="<%out.print(libro.getImagen()); %>" width=300px/><br>
		</div>
	</div>
	<%
}else{
	out.print("<p style='color:red;'>Error: No se ha seleccionado ningun libro</p>");
}
	%>
<a href="libros_listar.jsp" class="btn btn-outline-secondary">Atras</a>
</body>
</html>