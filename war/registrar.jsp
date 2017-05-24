<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*"%>
<%@page import ="com.google.appengine.api.users.User"%>
<%@page import ="com.google.appengine.api.users.UserService"%>
<%@page import ="com.google.appengine.api.users.UserServiceFactory" %>
<% UserService us = UserServiceFactory.getUserService();%>
<% User user = us.getCurrentUser();	%>
<% String sesion=(String)(getServletContext().getAttribute("sesion")); %>
<% ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos")); %>
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->
  <%if(alumnos!=null &&sesion.equals("administrador") && user!=null) {%>
<html>
  <head>
  	<meta http-equip="Content-type" content="text/html;charset=UTF-8">
  	<link href="css/default.css" rel="stylesheet" >
    <title>Registrar</title>
  </head>
  <body>
  <!-- Menu de navegacion -->
  <header id="main-header">
   <nav>
   <ul id="navbar">
   <li><a href="buscar.jsp">Buscar</a></li>
   <li><a href="registrar.jsp">Registrar</a></li>
   <li><a href="editar.jsp">Editar</a></li>
   <li><a href="alumnosMed.jsp">Ver</a></li> 
     <li><a href="salir">Salir</a></li> 
   </ul>
   </nav>
	 </header>
	 
    <div id="fondoFormulario2"></div>
    <div id="form">
    	
	    <form id="formulario" action="registrar" method="POST" > 
		<table>
		<tr>
            <td align=center>
			Correo:</br><input type="text" name="correo" value="@"></br>
			</td>
      	</tr>
      	<tr>
            <td align=center>
			Tipo:</br><select name="tipo" >
				<option>administrador</option>
				<option>estudiante</option>
				<option>profesor</option>
				<option>padre/apoderado</option>
				</select></br>
				</td>
      	</tr>
      	
		
			</br></br></br></br>
			<tr>
            <td align=center>
			<input type="submit" value="Guardar" name="Guardar"></br></br>
				</td>
      	</tr>
		</table>
		</form>
		
	</div>
	
	<footer id="main-footer2">
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
   