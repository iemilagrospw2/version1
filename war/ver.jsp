<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<% ArrayList<Curso>cursos=(ArrayList<Curso>)(getServletContext().getAttribute("cursos")); %>
<% ArrayList<Alumno>alumnos=(ArrayList<Alumno>)(getServletContext().getAttribute("alumnos2")); %>
<% String cur=""; %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/default.css" rel="stylesheet" >
<title>Datos</title>
</head>

<body>
 <header id="main-header">
   <nav>
   <ul class="navbar">
   <li><a href="ver.jsp">Ver</a></li>
	<li><a href="inicio.html">VOLVER</a></li>
	  <%if(cursos !=null){ %>
  	<li><a href="vaciarServlet">Vaciar</a></li>
  <%}%>
  </ul>
     </nav>
	 </header>
	 
	<div id="fondoFormulario2"></div>
    <div id="form3"> 
	<table border="1">
	<tr><td>CURSOS</td></tr>
 <%if(cursos!=null){ %>
 	
  	<tr><td>Nombre</td><td>Profesor</td><td>Horas</td><td>Creditos</td></tr>
	<%for(Curso a : cursos){ %>  
	<tr>
	<td><%=a.getNombre()%></td><td><%=a.getProfesor() %></td><td><%=a.getHoras() %></td><td><%=a.getCreditos() %></td>
	</tr>
 <%}}else{%>
 	<tr><td>No hay nada para mostrar</td></tr>
  <%}%>
  </table></br>
  </br>
  <table>
  <tr><td>ALUMNOS</td></tr>
   <%if(alumnos!=null){ %>
 	
  	<tr><td>Nombre</td><td>Apellido</td><td>CUI</td><td>Cursos</td></tr>
	<%for(Alumno b : alumnos){ %>
	<%for(Curso c: b.getCurso()){ %>	
			
			
			<% cur = cur +" " +c.getNombre();}%>  
	<tr>
	<td><%=b.getNombre()%></td><td><%=b.getApellido() %></td><td><%=b.getCui() %></td>
	
	<td> <%=cur %></td>
			<%cur=""; %>
	</tr>
 <%}}else{%>
 	<tr><td>No hay nada para mostrar</td></tr>
  <%}%>
  
  </table>
  </div>
	   <footer id="main-footer">
       
    </footer>
</body>
</html>
