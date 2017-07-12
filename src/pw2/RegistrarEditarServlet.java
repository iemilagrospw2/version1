package pw2;

import java.io.IOException;

import java.util.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegistrarEditarServlet extends HttpServlet {
	@SuppressWarnings("unchecked")

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// recoje todos los datos del alumno :v
		String correo = req.getParameter("correo").trim();

		String tipo = req.getParameter("tipo").trim();
		System.out.println(tipo);
		String acceso = req.getParameter("acceso").trim();
		int i = Integer.parseInt(req.getParameter("contador").trim());
		// creo un nuevo alumno
		ArrayList<AlumnosMed> alumnos = (ArrayList<AlumnosMed>) (getServletContext().getAttribute("alumnos"));
		alumnos.get(i).setCorreo(correo);
		alumnos.get(i).setTipo(tipo);
		alumnos.get(i).setAcceso(acceso);
		
		resp.sendRedirect("alumnosMed.jsp");
	}
}