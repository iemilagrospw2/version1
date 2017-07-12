<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<% ArrayList<String>Profesor=(ArrayList<String>)(getServletContext().getAttribute("profesores")); %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/default.css" rel="stylesheet" >
<title>Curso</title>
</head>

<body>
<header id="main-header">
   <nav>
   <ul class="navbar">
   <li><a href='ver.jsp'>Ver</a></li>
	<li><a href="inicio.html">VOLVER</a></li>
	
	</ul>
   </nav>
	 </header>
<div id="fondoFormulario2"></div>
    <div id="form2">
	<form action="curso" method="POST">
		<table>
			<tr>
				<td colspan="2" style="font-weight: bold;">Registrar Curso</td>
			</tr>
			<tr>
				<td>Nombre Curso</br> <input type="text" name="nombre" value="Calculo en una Variable">
				</td>
			</tr>

				<tr>
				<td>Profesor</br>
					 
					 <%if(Profesor!=null){ %>
					 
						 <%for(String a : Profesor){ %>  
							
							 <input type="radio" name="profesor" value=<%=a %>><%=a %> <br>		
					<%}}else{%>
						 <input type="radio" name="profesor" > NO hay Profesores<br>		
					<%}%>
					
				</td>
			</tr>
 			

			<tr>
				<td>Creditos</br> <input type="number" name="creditos" value="6">
				</td>
			</tr>

			<tr>
				<td>Horas</br> <input type="number" name="horas" value="4">
				</td>
			</tr>

						

			<%if(Profesor!=null){ %>
			<tr>
				<td></br> <input type="submit" name="registrar">
				</td>
			</tr>
			<%}else{ %>	
<tr>
				<td></br> <input type="submit" name="registrar" disabled="disabled">
				</td>
			</tr>
			<%} %>


		</table>

	</form>
	 </div>
	   <footer id="main-footer">
        
    </footer>
</body>
</html>
