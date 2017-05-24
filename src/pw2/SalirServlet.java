package pw2; 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;


@SuppressWarnings("serial")
public class SalirServlet extends HttpServlet {
	public  int i =0 ;
 public void doGet(HttpServletRequest req, HttpServletResponse resp)
 throws IOException, ServletException {
	 resp.setContentType("text/html");
 	 UserService us = UserServiceFactory.getUserService();
	 User user = us.getCurrentUser();
	 PrintWriter out = resp.getWriter();
	 
		
		 out.println("<!DOCTYPE html>"	 
				 + "<html>"
				 + "<head><title>Información de la cuenta</title>"
				 + "<meta charset=utf-8;>"
				 + "<body>"
				 + "Sera redirigido en 3 segundos a la pagina de inicio"
				 +"<meta http-equiv='Refresh' content='3;url=login2'>"
				 +"<a href='login2'> volver </a>"
				 + "</body></html>");
 }
}