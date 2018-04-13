<%@page import="comparador.ComparatorTituloAsc"%>
<%@page import="modelo.PrestamoModelo"%>
<%@page import="modelo.Prestamo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Libro"%>
<%@page import="modelo.Usuario"%>
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
	.lo_tiene{
		background-color:grey;
	}
	.color_verde{
		color: green;
	}
	.color_amarillo{
		color: #FFC600;
	}
	.color_naranja{
		color: #FF4C00;
	}
	.color_rojo{
		color:red;
	}
</style>
</head>
<body>
<h1>Libros</h1>
	<div id="userDiv">
	<%
	Usuario usuario=null;
	Object u=session.getAttribute("usuario");
	if (u!=null){
		usuario=(Usuario) u;
		out.print(usuario.getDni());
		%><br><a href="../logout.jsp">Cerrar sesion</a><%
	}else{
		%><a href="../login.jsp">Iniciar sesion</a><%
	}
	%>
	</div>
<table class="table table-striped">
  <thead>
    <tr>
	      <th scope="col"><a href='?order="TituloAsc"'>Titulo</a></th>
	      <th scope="col"><a href='#?order=EscritoAsc'>Escritor</a></th>
 
		<th scope="col">Estado</th>    
      <th scope="col">Fecha limite</th>
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
			}else if(usuario!=null && prestamoModelo.loTieneEsteUsuario(libro,usuario)){
				out.print("<td class='lo_tiene'>Ya lo tienes</td>");
			}else{
				out.print("<td class='no_disponible'>No disponible</td>");
			}
			
			if(usuario!=null && prestamoModelo.loTieneEsteUsuario(libro,usuario)){
				Prestamo prestamo=prestamoModelo.selectPorLibroUsuarioEntrega(libro, usuario, false);
				int diasRestantes=prestamo.diasRestantes();
				out.print("<td>");
				out.print(prestamo.getFechaLimite());
				if(diasRestantes>7*2){
					out.print("<b class=color_verde>");
				}else if(diasRestantes>7*1){
					out.print("<b class='color_amarillo'>");
				}else if(diasRestantes>0){
					out.print("<b class='color_naranja'>");
				}else{
					out.print("<b class='color_rojo'>");
				}
				out.print("(te quedan "+diasRestantes+" dias)</b></td>");
			}else{
				out.print("<td></td>");
			}
			
			out.print("<td>");
			out.print("<a href='libro_infor.jsp?idLibro="+libro.getId()+"'>Ver</a> ");
				if(usuario==null||!usuario.getRol().equals("admin")){
					if (prestamoModelo.estaDisponible(libro)){
						out.print("/ <a href='realizar_prestamo.jsp?idLibro="+libro.getId()+"'>Realizar prestamo</a>  ");
					}
					
				}else{
					out.print("/ <a href='libro_del.jsp?idLibro="+libro.getId()+"'>Borrar</a> / ");
					out.print("<a href='libro_edit.jsp?idLibro="+libro.getId()+"'>Editar</a>");
					
				}
			out.print("</td>");
			
		out.print("</tr>");
	}
	
	%>
    
  </tbody>
</table>
<%
if(usuario!=null && usuario.getRol().equals("admin")){
	out.print("<a href='libros_listar.jsp'>Vista usuario</a> / ");
	out.print("<a href='crear_libro.jsp'>Añadir libro</a>");
}
%>
<br/>
<a href="libros.jsp">Atras</a>

</body>
</html>