<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroModelo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<center>
<%
	String libroPara=request.getParameter("idLibro");
	String opcion=request.getParameter("opcion");
	//mira si el id ha sido introducido
	if(libroPara!=null){
		LibroModelo libroModelo=new LibroModelo();
		int libroId=Integer.parseInt(libroPara);
		Libro libro=libroModelo.select(libroId);
		
		//mira si el libro existe
		if (libro!=null){
			//pide confirmacion
			if (opcion==null){
			%>
				  <h4>
				  	Estas seguro de que quieres eliminar el libro
				  </h4>
				  <h2> <%=libro.getTitulo() %>  --  <%=libro.getAutor() %></h2>
				  <div>
				  	<form action="#" method="post">
				  	
				  		<input type="submit" class="btn btn-outline-danger" value="Si estoy seguro" name="opcion">
				  		<input type="submit" class="btn btn-outline-secondary" value="No" name="opcion">
				  	</form>
				  </div>
			
			<%
			}else if (opcion.equalsIgnoreCase("Si estoy seguro")){
				libroModelo.delete(libroId);
				%>
					<h3>Libro eliminado</h3>		  	
				  	<a href="libros_listar.jsp">Ir atras</a>
			<%
			}else{
				%>
					<h3>Operacion cancelada</h3>		  	
				  	<a href="libros_listar.jsp">Ir atras</a>
			<%
			}
		}else{
				%>
					<h3>Error 404: Ese libro no existe</h3>
				  	
				  	<a href="libros_listar.jsp">Ir atras</a>
			<%
		}
		
	}else{
		response.sendRedirect("libros_listar.jsp");
	}
%>
</center>
</body>
</html>