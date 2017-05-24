<!DOCTYPE html>
<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<%@page import ="com.google.appengine.api.users.User"%>
<%@page import ="com.google.appengine.api.users.UserService"%>
<%@page import ="com.google.appengine.api.users.UserServiceFactory" %>
<% UserService us = UserServiceFactory.getUserService();%>
<% User user = us.getCurrentUser();	%>
<% String sesion=(String)(getServletContext().getAttribute("sesion")); %>
<% ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos")); %>
  <%if(alumnos!=null &&sesion.equals("administrador") && user!=null ) {%>
<html>
  <head>
  	<meta http-equip="Content-type" content="text/html;charset=UTF-8">
  	<link href="css/default.css" rel="stylesheet" type="text/css">
    <title>Alumnos de Medicina</title>
  </head>
  <body>
  <!-- Menu de navegacion -->
    <header id="main-header">
   <nav>
   <ul class="navbar">
   <li><a href="buscar.jsp">Buscar</a></li>
   <li><a href="registrar.jsp">Registrar</a></li>
   <li><a href="editar.jsp">Editar</a></li>
   <li><a href="alumnosMed.jsp">Ver</a></li> 
   <li><a href="salir">Salir</a></li> 
  <%if(alumnos !=null){ %>
  	<li><a href="vaciarServlet">Vaciar</a></li>
  <%}%>
  </ul>
     </nav>
	 </header>
	 
	<div id="fondoFormulario2"></div>
    <div id="form3"> 
	<table border="1">
 <%if(alumnos!=null){ %>
  	<tr><td>Correo</td><td>Tipo</td><td>Contador</td><td>ACCESO</td></tr>
	<%for(AlumnosMed a : alumnos){ %>  
	<tr>
	<td><%=a.getCorreo()%></td><td><%=a.getTipo() %></td><td><%=a.getContador() %></td><td><%=a.getAcceso() %></td>
	</tr>
 <%}}else{%>
 	<tr><td>No hay alumnos de medicina por mostrar</td></tr>
  <%}%>
  </table>
  </div>
  
  
  
     <footer id="main-footer">
        <p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio
				Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>
    </footer>
  </body>
</html>
 <%}else{ %>
   <html>
   <head>
   <tittle>registrar</tittle>
   </head>
   <body>
   <h1>USTED N O ES ADMINISTRADOR PARA VER ESTE SITIO o no se a logueado</h1>
   <a href="login2">volver</a>
   </body>
   </html>
   <%} %>