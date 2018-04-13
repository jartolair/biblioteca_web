<%@page import="modelo.UsuarioModelo"%>
<%@page import="modelo.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String dni=request.getParameter("dni");
	String password=request.getParameter("password");
	
	UsuarioModelo usuarioModelo=new UsuarioModelo();
	Usuario usuario=usuarioModelo.selectDniPassword(dni,password);
	if(usuario==null){
		response.sendRedirect("login.jsp");
	}else{
		session.setAttribute("usuario", usuario);
		response.sendRedirect("biblioteca.jsp");
	}
%>
</body>
</html>