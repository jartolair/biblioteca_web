<%@page import="modelo.Libro"%>
<%@page import="modelo.LibroModelo"%>
<%@page import="modelo.Prestamo"%>
<%@page import="modelo.PrestamoModelo"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
<div id="userDiv">
	<%
	Object u=session.getAttribute("usuario");
	Usuario usuario=null;
	if (u!=null){
		 usuario=(Usuario) u;
		out.print(usuario.getDni());
		%><br><a href="../logout.jsp">Cerrar sesion</a><%
	
	%>
	</div>
	
	<center>
	<%
	LibroModelo libroModelo=new LibroModelo();
	String paraLibro=request.getParameter("idLibro");

	if (paraLibro!=null){
		
		int id=Integer.parseInt(paraLibro);
		Libro libro=libroModelo.select(id);
		String opcion=request.getParameter("opcion");
		if (opcion==null){
			%>
				<h2>¿Quieres el libro "<%=libro.getTitulo()%>"" de "<%=libro.getAutor()%>"?</h2>
				
				<form action="#" method="post">
			  		<input type="submit" class="btn btn-primary" value="Si estoy seguro" name="opcion">
			  		<input type="submit" class="btn btn-outline-secondary" value="No" name="opcion">
			  	</form>
		  	
		 	<%
		}else if(opcion.equals("Si estoy seguro")){
			PrestamoModelo prestamoModelo=new PrestamoModelo();
			
			Prestamo prestamo=prestamoModelo.crearPrestamo(libro, usuario);
			prestamoModelo.insertar(prestamo);
			%>
			<h3>Fecha de entrega: <%=prestamo.getFechaLimite()%></h3>
			<a href="libros_listar.jsp"><button class="btn btn-outline-secondary">Volver a la lista</button></a>
			<%
			
		}else{
			response.sendRedirect("libros_listar.jsp"); 
		}
	}else{
		response.sendRedirect("libros_listar.jsp"); 
	}
  %>
  
  </center>
</body>
</html>

<%
}else{
		response.sendRedirect("../login.jsp");
	}
	
	%>