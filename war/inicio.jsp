<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*"%>
<%@page import ="com.google.appengine.api.users.User"%>
<%@page import ="com.google.appengine.api.users.UserService"%>
<%@page import ="com.google.appengine.api.users.UserServiceFactory" %>
<% UserService us = UserServiceFactory.getUserService();%>
<% String sesion=(String)(getServletContext().getAttribute("sesion")); %>
<% ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos")); %>
	<% User user = us.getCurrentUser();	%>
	<% if (alumnos!=null &&user!=null){ %>
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
  <head>
  	<meta http-equip="Content-type" content="text/html;charset=UTF-8">
  	<link href="css/default.css" rel="stylesheet" type="text/css">
    <title>INICIO</title>
  </head>
  <body>
  <!-- Menu de navegacion -->
  <header id="main-header">
   <nav>
   <ul id="navbar">
   <%if(sesion.equals("administrador")) {%>
   <li><a href="buscar.jsp">Buscar</a></li>
   <li><a href="registrar.jsp">Registrar</a></li>
   <li><a href="editar.jsp">Editar</a></li>
   <li><a href="alumnosMed.jsp">Ver</a></li> 
   <li><a href="salir">Salir</a></li> 
   </ul>
	</nav>
	 </header>
	<div id="fondoFormulario2"></div>
    <div id="form4">
       		<h1 align="center">Bienvenido al registro de matriculas de alumnos </h1></br>
			<h1 align="center">Use el menu de arriba a la derecha</h1>
			<IMG SRC="admin.png" WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
	</form>
	</div>   
   <footer id="main-footer">
        <p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio
				Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>
    </footer>
  </body>
</html>
   <%} else if(sesion.equals("estudiante")) {%>
	<li><a href="salir">Salir</a></li> 
	</ul>
	</nav>
	 </header>
	<div id="fondoFormulario2"></div>
    <div id="form4">
       		<h1 align="center">Bienvenido alumno </h1></br>
       		<IMG SRC="alumno.jpg"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
	</form>
	</div>   
   <footer id="main-footer">
        <p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio
				Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>
    </footer>
  </body>
</html>
<%} else if(sesion.equals("profesor")) {%>
	<li><a href="salir">Salir</a></li> 
	</ul>
	</nav>
	 </header>
	<div id="fondoFormulario2"></div>
    <div id="form4">
       		<h1 align="center">Bienvenido docente </h1></br>
       		<IMG SRC="maestro.png"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
	</form>
	</div>   
   <footer id="main-footer">
        <p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio
				Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>
    </footer>
  </body>
</html>
<%} else if(sesion.equals("padre/apoderado")) {%>
	<li><a href="salir">Salir</a></li> 
	</ul>
	</nav>
	 </header>
	<div id="fondoFormulario2"></div>
    <div id="form4">
       		<h1 align="center">Bienvenido Sr/a. Padre de familia o Apoderado</h1></br>
       		<IMG SRC="padre.jpg"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
	</form>
	</div>   
   <footer id="main-footer">
        <p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio
				Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>
    </footer>
  </body>
</html>

<%}%>
<%}else{%>
	<html>
	<head>
	<title>inicio</title>
	</head>
	<body>
		NO TIENES PERMISO PARA VER ESTA PAGINA
		<a href="login2">volver</a>
	</body>
	</html>
<%}%>