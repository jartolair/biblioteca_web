<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
		 
<%@page import="com.sun.org.apache.xalan.internal.xsltc.trax.SmartTransformerFactoryImpl"%>
<%@page import="modelo.LibroModelo"%>
<%@page import="modelo.Libro"%>
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
	<h1>Creador de libros</h1>
    <%
    String titulo=request.getParameter("titulo");
    String autor=request.getParameter("autor");
    
    if(titulo==null||autor==null||titulo==""||autor==""){
    	if (titulo==""||autor==""){
    		out.print("<p style='color:red;'>*Te falta algun parametro*</p>");
    	}
    %>
			<form action="#" method="post">
				<table>
					<tr>
						<td>Titulo</td>
						<td>
							<input type="text" name="titulo">
						</td>
					</tr>
					<tr>
						<td>Autor</td>
						<td>
							<input type="text" name="autor">
						</td>
					</tr>
					<tr>
						<td>Imagen</td>
						<td>
							<input type="file" name="file">
						</td>
					</tr>
					<tr>
						<td colspan=2>
							<input type="submit" value="Crear" name="opcion">
							<a href="libros_listar.jsp"><input type="button" value="Cancelar"></a>
						</td>
					</tr>
				</table>
			</form>

	<%
	}else{
		//crear libro
		Libro libro=new Libro();
		libro.setTitulo(titulo);
		libro.setAutor(autor);
		
		//img
		/*
	     //FileItemFactory es una interfaz para crear FileItem
		        FileItemFactory file_factory = new DiskFileItemFactory();
		 
		        //ServletFileUpload esta clase convierte los input file a FileItem
		        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
		        //sacando los FileItem del ServletFileUpload en una lista 
		        List items = servlet_up.parseRequest(request);
		 
		        for(int i=0;i<items.size();i++){
		            //FileItem representa un archivo en memoria que puede ser pasado al disco duro
		            FileItem item = (FileItem) items.get(i);
		            //item.isFormField() false=input file; true=text field
		            if (! item.isFormField()){
		                //cual sera la ruta al archivo en el servidor
		                File archivo_server = new File("./imagenes/"+item.getName());
		                //y lo escribimos en el servido
		                item.write(archivo_server);
		                libro.setImagen(item.getName());
		                
		            }
		        }
		
		*/
		//guardar
		LibroModelo libroModelo=new LibroModelo();
		libroModelo.insert(libro);
		
		//html code
		out.print("<p>El libro se ha guardado correctamente</p><a href='libros_listar.jsp'>Ir a la lista</a>");
		
	}
    %>
</body>
</html>
