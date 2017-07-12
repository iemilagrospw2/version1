<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding="UTF-8"%>
<%@ page import="pw2.*" %>
<%@ page import="java.util.*" %>
<% ArrayList<Curso>cursos=(ArrayList<Curso>)(getServletContext().getAttribute("cursos")); %>
<% ArrayList<Alumno>estudiante=(ArrayList<Alumno>)(getServletContext().getAttribute("estudiante")); %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="css/default.css" rel="stylesheet" >
<title>Alumno</title>
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
	<form action="alumno" method="POST">
		<table>
			<tr>
				<td colspan="2" style="font-weight: bold;">Matricula Alumno</td>
			</tr>
			<tr>
				<td>Nombre</br> <input type="text" name="nombre" value="Juan">
				</td>
			</tr>

			<tr>
				<td>Apellido</br> <input type="text" name="apellido" value="Perez">
				</td>
			</tr>

			<tr>
				<td>CUI</br> <input type="number" name="cui" value="123">
				</td>
			</tr>
			
			<tr>
				<td>Correo</br> 
				 <%if(estudiante!=null){ %>
								<select name="correo">
								 <%for(Alumno a : estudiante){ %> 
									<option><%=a.getCorreo() %></option>
								<%} %>
								</select>
					<%} %>
				</td>
			</tr>
			
			<tr>
				<td>Curso</br>
					 
					 <%if(cursos!=null){ %>
					 
						 <%for(Curso a : cursos){ %>  
							
							 <input type="checkbox" name="curso" value="<%=a.getNombre() %>"> <%=a.getNombre() %><br>		
					<%}}else{%>
						 <input type="checkbox" name="curso" > NO hay cursos<br>		
					<%}%>
					
				</td>
			</tr>
 			<%if(cursos!=null){ %>
			<tr>
				<td></br> <input type="submit" name="matricular">
				</td>
			</tr>
			<%}else{ %>	
<tr>
				<td></br> <input type="submit" name="matricular" disabled="disabled">
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
