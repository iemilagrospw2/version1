package pw2;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class Login2Servlet extends HttpServlet {
	public  int i =0 ;
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException, ServletException {
	 resp.setContentType("text/html");
 	 PrintWriter out = resp.getWriter();
 	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
	 if(user == null){
		 resp.sendRedirect(us.createLoginURL(req.getRequestURI())); 
	 }
	 else{ 
		 boolean encontro=false;
		 ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos"));
		 AlumnosMed ok=new AlumnosMed();
		 if(alumnos!=null){
			for(AlumnosMed a : alumnos){
				if(a.getCorreo().equals(user.getEmail())){		
					encontro=true;
					ok=a;
					getServletContext().setAttribute("sesion",ok.getTipo());
					break;
				}
			}
		}
 		if(encontro){
		 out.println("<!DOCTYPE html>"	 
		 + "<html>"
		 + "<head><title>Información de la cuenta</title>"
		 + "<meta charset=utf-8;>"
		 + "<body>"
		 + "<h1>BIENVENIDO " +ok.getTipo()+"</h1>"
		 + "<h1>ACCESO: " +ok.getAcceso()+"</h1>"
		 + "<br><a href='../'>Regresar...</a>"
		 +"<br/><b>User :</b>"
		 +"<br/>getNickname retorna : "+user.getNickname()
		 +"<br/>getAuthDomain retorna : "+user.getAuthDomain()
		 +"<br/>getEmail retorna : "+user.getEmail()
		 +"<br/>getUserId retorna : "+user.getUserId()
		 +"<br/>getFederatedIdentity retorna : "+user.getFederatedIdentity()
		 +"<br/>"
		 +"<br/><b>UserService :</b>"
		 +"<br/>isUserAdmin retorna : "+us.isUserAdmin() 
		 +"<br/>isUserLoggedIn retorna : "+us.isUserLoggedIn()
		 +"<br/>getCurrentUser retorna : "+us.getCurrentUser()
		 +"<br/>"
		 +"<a href='"+ us.createLogoutURL(req.getRequestURI())+"'> Cerrar sesión </a>"
				 +"<br/>"
		 +"<a href='inicio.jsp'> inicio </a>"
		 + "</body></html>");
 		}
 		else{
 			out.println("<!DOCTYPE html>"	 
					 + "<html>"
					 + "<head><title>SDP-WebSystem</title>"
					 + "<meta charset=utf-8;></head>"
					 + "<link rel='stylesheet' href='css/estyle.css'>"
					 + "<body>"
					 + "<div id='body'>"
					 + "<a href='"+ us.createLogoutURL("/cerrarsesion")+"' class='button large'><span class='icon-code'>Cerrar sesión</span></a>"
					 + "<h3>No perteneces al sistema</h3>"
					 + "</div>"
					 + "</body></html>");	
 		}
 	}
 }
}