<%@page import="comparador.ComparatorTituloAsc"%>
<%@page import="modelo.PrestamoModelo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Biblioteca</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
	.disponible{
		background-color: green;
	}
	.no_disponible{
		background-color:red;
	}
</style>
</head>
<body>
<h1>Libros</h1>
<table class="table table-striped">
  <thead>
    <tr>
	      <th scope="col"><a href='?order="TituloAsc"'>Titulo</a></th>
	      <th scope="col"><a href='#?order=EscritoAsc'>Escritor</a></th>
 
		<th scope="col">Estado</th>    
      <th scope="col">Opciones</th>

    </tr> 
  </thead>
  <tbody>
	
	<%
	LibroModelo libroModelo=new LibroModelo();
	ArrayList<Libro> libros=libroModelo.selectAll();
	PrestamoModelo prestamoModelo=new PrestamoModelo();

	Iterator<Libro> i=libros.iterator();
	while (i.hasNext()){
		Libro libro=i.next();
		out.print("<tr>");
		out.print("<td>"+libro.getTitulo()+"</td>");
		out.print("<td>"+libro.getAutor()+"</td>");
		if (prestamoModelo.estaDisponible(libro)){
			out.print("<td class='disponible'>Disponible</td>");
		}else{
			out.print("<td class='no_disponible'>No disponible</td>");
		}
		out.print("<td>");
			if(request.getParameter("admin")!=null){
				out.print("<a href='libro_infor.jsp?idLibro="+libro.getId()+"'>Ver</a> / ");
				out.print("<a href='libro_del.jsp?idLibro="+libro.getId()+"'>Borrar</a> / ");
				out.print("<a href='libro_edit.jsp?idLibro="+libro.getId()+"'>Editar</a>");
			}else{
				out.print("<a href='libro_infor.jsp?idLibro="+libro.getId()+"'>Ver</a> ");
				if (prestamoModelo.estaDisponible(libro)){
					out.print("/ <a href='libro_infor.jsp?idLibro="+libro.getId()+"'>Realizar prestamo</a>  ");
				}
				
			}
		out.print("</td>");
		out.print("</tr>");
	}
	
	%>
    
  </tbody>
</table>
<%
if(request.getParameter("admin")!=null){
	out.print("<a href='libros_listar.jsp'>Vista usuario</a> / ");
	out.print("<a href='crear_libro.jsp'>Añadir libro</a>");
}else{
	out.print("<a href='libros_listar.jsp?admin=1'>Vista administrador</a>");
}
%>
<br/>
<a href="libros.html">Atras</a>

</body>
</html>