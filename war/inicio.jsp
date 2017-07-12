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
  	<link href="estilo.css" rel="stylesheet" type="text/css">
    <title>INICIO</title>
  </head>
  <body>
  <!-- Menu de navegacion -->
  
  
  
  
  <header id="main-header">
   <a id="logo-header" href=""> <span
		class="site-name">Milagros</span> <span class="site-desc">dedicándonos
			a la educación</span>
	</a> <nav>
   <ul id="navbar">
   <%if(sesion.equals("administrador")) {%>
   <li><a href="inicio.jsp">Mi cuenta</a></li>
	<li><a href="<%= us.createLogoutURL("/cerrarsesion")%>">CERRAR SESION</a></li> 
	</ul>
	</nav>
	 </header>
	 
	 
	 <aside>
	<div align="center">
		<img id="imagen1" src="milagros.png">
	</div>
	<ul>
		<li><a href="buscar.jsp">
				<div class="barra"></div>
				<p class="menu">Buscar</p>
		</a></li>
		<li><a href="registrar.jsp">
				<div class="barra"></div>
				<p class="menu">Registrar</p>
		</a></li>
		<li><a href="editar.jsp">
				<div class="barra"></div>
				<p class="menu">Editar</p>
		</a></li>
		<li><a href="alumnosMed.jsp">
				<div class="barra"></div>
				<p class="menu">Ver</p>
		</a></li>
	</ul>
	</aside>
	 
	<div id="fondoFormulario2"></div>
	
	
	 <div id="datos">
		<table WIDTH="700px" HEIGHT="600px" border="0">
			<tr>
				<td WIDTH="400px" HEIGHT="200px"><p>Bienvenido al registro de matriculas de alumnos<br>
					<h3 align="center">Use el menu </h3>
				</td>
				<td>
					<div align="right">
						<IMG SRC="admin.png" WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
					</div> 
				</td>
			</tr>
		</table>
	</div>
	
	
	<footer id="main-footer">
      
    </footer>
  </body>
</html>
   <%} else if(sesion.equals("estudiante")) {%>
	<header>
	<li><a href="Inicio.jsp">Mi cuenta</a></li>
	<li><a href="<%= us.createLogoutURL("/cerrarsesion")%>">CERRAR SESION</a></li> 
	</ul>
	</nav>
	 </header id="main-header">
	 
	  <aside>
	<div align="center">
		<img id="imagen1" src="milagros.png">
	</div>
	<ul>
		<li><a href="subirnotas.jsp">
				<div class="barra"></div>
				<p class="menu">Ver calificaciones</p>
		</a></li>
	</ul>
	</aside>
	 
	<div id="fondoFormulario2"></div>
    
    
    <div id="datos">
		<table WIDTH="700px" HEIGHT="600px" border="0">
			<tr>
				<td WIDTH="400px" HEIGHT="200px"><p>Bienvenido alumno<br>
					</td>
				<td>
					<div align="right">
						<IMG SRC="alumno.jpg"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
					</div> 
				</td>
			</tr>
		</table>
	</div>
    
   <footer id="main-footer">
       
    </footer>
  </body>
</html>
<%} else if(sesion.equals("profesor")) {%>
	
	<li><a href="inicio.jsp">Mi cuenta</a></li>
	<li><a href="<%= us.createLogoutURL("/cerrarsesion")%>">CERRAR SESION</a></li> 
	</ul>
	</nav>
	 </header>
	 
	 <aside>
	<div align="center">
		<img id="imagen1" src="milagros.png">
	</div>
	<ul>
		<li><a href="subirnotas.jsp">
				<div class="barra"></div>
				<p class="menu">Subir Notas</p>
		</a></li>
	</ul>
	</aside>
	
	<div id="datos">
		<table WIDTH="700px" HEIGHT="600px" border="0">
			<tr>
				<td WIDTH="400px" HEIGHT="200px"><p>Bienvenido docente<br>
					Nombre:Juan Perez<br>Especialidad:Matematica<br>Nivel:Primaria</p></td>
				<td>
					<div align="right">
						<IMG SRC="maestro.png"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
					</div> 
				</td>
			</tr>
			<td WIDTH="400px" HEIGHT="200px"><p>Cursos que enseña:<br>-Logico Matematico<br>-Raz.Matematico</p></td>
			<tr>
			</tr>
		</table>
	</div>
	
	
	
	<div id="fondoFormulario2"></div>
      
	<footer id="main-footer">
       
    </footer>
  </body>
</html>
<%} else if(sesion.equals("padre/apoderado")) {%>
	<li><a href="inicio.jsp">Mi cuenta</a></li>
	<li><a href="<%= us.createLogoutURL("/cerrarsesion")%>">Salir</a></li> 
	</ul>
	</nav>
	 </header>
	<div id="fondoFormulario2"></div>
    
    
    
    <div id="datos">
		<table WIDTH="700px" HEIGHT="600px" border="0">
			<tr>
				<td WIDTH="400px" HEIGHT="200px"><p>Bienvenido Sr/a. Padre de familia o Apoderado<br>
					Nombre:Juan Perez<br>Especialidad:Matematica<br>Nivel:Primaria</p></td>
				<td>
					<div align="right">
						<IMG SRC="padre.jpg"  WIDTH=178 HEIGHT=180 BORDER=2 ALIGN=center>
					</div> 
				</td>
			</tr>
		</table>
	</div>
    
   <footer id="main-footer">
       
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
		<a href="<%= us.createLogoutURL("/cerrarsesion")%>">SALIR</a>
	</body>
	</html>
<%}%>