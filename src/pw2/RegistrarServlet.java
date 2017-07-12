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
		
		if (tipo.equals("profesor")) {
			if (getServletContext().getAttribute("profesores") == null) {
				String profe = new String(correo);
				ArrayList<String> profeArray = new ArrayList<String>();
				profeArray.add(profe);
				getServletContext().setAttribute("profesores", profeArray);

			} else {
				String profe = new String(correo);
				ArrayList<String> profeArray = (ArrayList<String>) (getServletContext().getAttribute("profesores"));
				profeArray.add(profe);
			}
		}if (tipo.equals("estudiante")) {
			if (getServletContext().getAttribute("estudiante") == null) {
				Alumno e = new Alumno(correo);
				ArrayList<Alumno> eArray = new ArrayList<Alumno>();
				eArray.add(e);
				getServletContext().setAttribute("estudiante", eArray);

			} else {
				Alumno e = new Alumno(correo);
				ArrayList<Alumno> eArray = (ArrayList<Alumno>) (getServletContext().getAttribute("estudiante"));
				eArray.add(e);
			}
		}
		resp.sendRedirect("alumnosMed.jsp");
		
	}
}