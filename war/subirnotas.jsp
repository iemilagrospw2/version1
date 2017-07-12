<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language='java' contentType='text/html;charset=UTF-8'
	pageEncoding="UTF-8"%>
<%@ page import="pw2.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.google.appengine.api.users.User"%>
<%@page import="com.google.appengine.api.users.UserService"%>
<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%
	UserService us = UserServiceFactory.getUserService();
%>
<%
	User user = us.getCurrentUser();
%>
<%
	String sesion = (String) (getServletContext().getAttribute("sesion"));
%>
<%
	ArrayList<AlumnosMed> alumnos = (ArrayList<AlumnosMed>) (getServletContext().getAttribute("alumnos"));
	ArrayList<Alumno> estudiantes = (ArrayList<Alumno>) (getServletContext().getAttribute("estudiante"));
%>
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->
<%
	if (alumnos != null  && user != null) {
%>
<html>
<head>
<meta http-equip="Content-type" content="text/html;charset=UTF-8">
<link href="estilo.css" rel="stylesheet">
<title>Subir Notas</title>
</head>
<body>
	<!-- Menu de navegacion -->


	<header id="main-header"> <a id="logo-header" href=""> <span
		class="site-name">Milagros</span> <span class="site-desc">dedicándonos
			a la educación</span>
	</a> <nav>
	<ul>
		<li><a href="inicio.jsp">Mi cuenta</a></li>
		<li><a href="<%=us.createLogoutURL("/cerrarsesion")%>">Salir</a></li>
	</ul>
	</nav> </header>

	<aside>
	<div align="center">
		<img id="imagen1" src="milagros.png">
	</div>
	<%if(sesion.equals("profesor")){ %>
	<ul>
		<li><a href="#">
				<div class="barra"></div>
				<p class="menu">Subir Notas</p>
		</a></li>
	</ul>
	</aside>
	
	<div id="datos">
		<h5>Registro de notas</h5>
		<form method="get" action="subirnotas">
			<table border="1">
				<%
					if (estudiantes != null) {
				%>
				<select name="correo">
					<%
						for (Alumno al : estudiantes) {
					%>
					<%="<option value=" + al.getCorreo() + ">" + al.getCorreo() + "</option>"%>
					<%
						}
					%>
				</select>

				<tr>
					<td>Nota1</td>
					<td><input type="text" name="n1" value=""></td>
				</tr>
				<tr>
					<td>Nota2</td>
					<td><input type="text" name="n2" value=""></td>
				</tr>
				<tr>
					<td>Nota3</td>
					<td><input type="text" name="n3" value=""></td>
				</tr>


				<tr>
					<td></td>
					<td></td>
					<td><input type="submit" value="REGISTRAR"></td>
				</tr>

			</table>
			<%}}%>
			<br>
			<h5>Vista de notas</h5>
			<table>
				<tr>
					<td>ALUMNO</td>
					<td>NOTA 1</td>
					<td>NOTA2</td>
					<td>NOTA 3</td>
				</tr>
				<%
					for (Alumno al : estudiantes) {
				%>
				<tr>
					<td><%=al.getCorreo()%></td>
					<td><input type="text" name="n1<%=al.getCorreo()%>"
						value="<%=al.getNota1()%>"></td>
					<td><input type="text" name="n2<%=al.getCorreo()%>"
						value="<%=al.getNota2()%>"></td>
					<td><input type="text" name="n3<%=al.getCorreo()%>"
						value="<%=al.getNota3()%>"></td>
				</tr>
				<%
					}
				%>

				<%
					} else {
				%>
				<tr>
					<td>No hay alumnos por mostrar</td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
	</div>


	<div id="fondoFormulario2"></div>


	<footer id="main-footer">
	
	</footer>



</body>
</html>