package pw2;

import java.io.IOException;

import java.util.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")

public class RegistrarServlet extends HttpServlet {

	public static int i=1;
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	
	
		
		//recoje todos los datos del alumno :v
		String correo=req.getParameter("correo").trim();
		String tipo=req.getParameter("tipo").trim();
		//creo un nuevo alumno
		AlumnosMed nuevo =new AlumnosMed(correo,tipo,i);
		i++;
		if(getServletContext().getAttribute("alumnos")!=null){//si existe objeto alumno
			ArrayList<AlumnosMed>alumnos=(ArrayList<AlumnosMed>)(getServletContext().getAttribute("alumnos"));//conseguir lista existente
			alumnos.add(nuevo);//agregar nuevo  alumno
			getServletContext().setAttribute("alumnos", alumnos);
		}else{//si no existe objeto alumno 
			ArrayList<AlumnosMed>alumnos= new ArrayList<AlumnosMed>();//crear nuevo alumno
			alumnos.add(nuevo);//y lo agrega
			getServletContext().setAttribute("alumnos", alumnos);
		}
		resp.sendRedirect("alumnosMed.jsp");
		
	}
}