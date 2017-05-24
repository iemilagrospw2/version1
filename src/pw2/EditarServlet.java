package pw2;
import java.io.IOException;

import java.util.*;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class EditarServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		UserService us = UserServiceFactory.getUserService();
		User user = us.getCurrentUser();	
		String sesion=(String)(getServletContext().getAttribute("sesion"));
		if(sesion.equals("administrador") && user!=null) {
		resp.getWriter().println(" <html>"+
				 "<head>"+
		"		<meta http-equip='Content-type' content='text/html;charset=UTF-8'>"+
		"		<link href='css/default.css' rel='stylesheet' type='text/css'>"+
		"			<title>Buscar</title>"+
		"			</head>");
		resp.getWriter().println(" <body>");
		resp.getWriter().println("<header id='main-header'>"+
				"<nav>"+
				"<ul class='navbar'>"+
				"<li><a href='buscar.jsp'>Buscar</a></li>"+
				"<li><a href='registrar.jsp'>Registrar</a></li>"+
				"<li><a href='editar.jsp'>Editar</a></li>"+
				"<li><a href='alumnosMed.jsp'>Ver</a></li>"+
				  "<li><a href='salir'>Salir</a></li>"+
				"</ul>"+
				"</nav>"+
				"</header>");
		String correo=req.getParameter("correo");
		boolean encontro=false;
		ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos"));
		resp.getWriter().println("<div id='fondoFormulario2'></div>"+
				 "<div id='form2'> "+
				"<table>");
		if(alumnos !=null){
			AlumnosMed ok=new AlumnosMed();
			for(AlumnosMed a : alumnos){
				if(a.getCorreo().equals(correo)){
					encontro=true;
					ok=a;
					break;
				}
			}
			if(encontro){
				 
				resp.getWriter().println("<p><Un alumno encontrado></p>"+
						 "<form action='registrareditar' method='POST' id='registrar'>"+ 
						"	Correo:</br><input type='text' name='correo' value='"+ok.getCorreo()+"'></br>"+
						"	Tipo:</br><select name='tipo' >"
						+ "<option>administrador</option>"+
						"<option>estudiante</option>"
						+"<option>profesor</option>"
						+"<option>padre/apoderado</option>"
						+ "</select></br>"+
						"	ACCESO:</br><select name='acceso' >"
						+ "<option>concedido</option>"+
						"<option>DENEGADO</option>"
					
						+ "</select></br>"+
						"	<input type='text' name='contador' value='"+ok.getContador()+"'  style='visibility:hidden'></br>"+
						"	</br><input type='submit' value='Editar' name='Editar'></br></br>"+
						"</form>");
				
			}else{
				resp.getWriter().println("<p>NO se ha encontrado ningun alumno ("+correo+").</p>");
			}
		}else{
			resp.getWriter().println("<p>NO EXISTE.</p>");
		}
		
		resp.getWriter().println(" </table>"+
				"</div>");
			resp.getWriter().println("   <footer id='main-footer2'>"+
			"<p>Hecho por:<br>-Contreras Iam<br>-Solis Angie<br>-Carpio Yherico<br>-Veliz Diego<br>-Nuñez Gary</p>"+
			"</footer>");
			resp.getWriter().println(" </body>");
			resp.getWriter().println(" </html>");
	
	}else{ 
		 resp.getWriter().println("<html>"+
	   "<head>"+
	   "<tittle>registrar</tittle>"+
	   "</head>"+
	   "<body>"+
	   "<h1>USTED N O ES ADMINISTRADOR PARA VER ESTE SITIO o no se a logueado</h1>"+
	   "<a href='login2'>volver</a>"+
	   "</body>"+
	   "</html>");
	   } 	
}
}