package pw2;
import java.io.IOException;

import java.util.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CrearAdminServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		if(getServletContext().getAttribute("alumnos")==null){
			AlumnosMed admin=new AlumnosMed("icontrerasalcazar@gmail.com","administrador",0);
			ArrayList<AlumnosMed>admin2= new ArrayList<AlumnosMed>();
			admin2.add(admin);
			getServletContext().setAttribute("alumnos", admin2);
			resp.sendRedirect("login2");
		}
		else
			resp.sendRedirect("login2");
	}
}