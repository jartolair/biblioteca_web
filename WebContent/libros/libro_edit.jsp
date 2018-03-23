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
<h1>Editar libro</h1>
    <%
    if (request.getParameter("idLibro")==null){
    	%>
		<h1>Editar libro</h1>
		<p style='color:red;'>Error 404: libro no encontrado</p>
		<a href="libros_listar.jsp">Volver a la lista</a>
		<%
    }else{
	int idLibro=Integer.parseInt(request.getParameter("idLibro"));
    LibroModelo libroModelo=new LibroModelo();
    Libro libro=libroModelo.select(idLibro);

if (libro!=null){
	String boton=request.getParameter("boton");
	if (boton==null||request.getParameter("titulo")==""||request.getParameter("titulo")==""){
		if (request.getParameter("titulo")==""||request.getParameter("titulo")==""){
			%><p style='color:red;'>*Te falta meter algun parametro*</p><%	
		}
%>
	
	<form action="#" method="post">
		<input type="hidden" name="idLibro" value="<%=libro.getId()%>">
		<table>
			<tr>
				<td>Titulo:</td>
				<td><input type="text" name="titulo" value="<%=libro.getTitulo()%>" >
			</tr>
			<tr>
				<td>Autor:</td>
				<td><input type="text" name="autor" value="<%=libro.getAutor()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Guardar" name="boton">
				<a href="libros_listar.jsp">Cancelar</a>
				</td>
			</tr>
		</table>
	</form>
	<%
	}else{
		libro.setTitulo(request.getParameter("titulo"));
		libro.setAutor(request.getParameter("autor"));
		libroModelo.update(libro);
		%>
			<h3>libro editado</h3>
			<a href="libros_listar.jsp">Volver a la lista</a>
		<%
	}

}else{
	%>
		<p style='color:red;'>Error 404: libro no encontrado</p>
		<a href="libros_listar.jsp">Volver a la lista</a>
	<%
}
    }
%>

</body>
</html>