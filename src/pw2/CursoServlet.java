package pw2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CursoServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		int comprobar = 0;
		ArrayList<Curso> cursos = (ArrayList<Curso>) (getServletContext().getAttribute("cursos"));
		resp.getWriter()
				.println("<html>" + "<head>" + "<meta http-equiv='content-type' content='text/html; charset=UTF-8'>"
						+ "		<link href='css/default.css' rel='stylesheet' type='text/css'>" + "<title>Curso</title>"
						+ "<header id='main-header'>" + "<nav>" + "<ul class='navbar'>"+ "<li><a href='ver.jsp'>Ver</a></li>"
						+ "<li><a href='inicio.html'>VOLVER</a></li>"  + "</ul>"
						+ "</nav>" + "</header>" + "</head>" + "<body>");
		resp.getWriter().println("<div id='fondoFormulario2'></div>" + "<div id='form2'>");
		resp.getWriter().println("<table><tr><td>");

		String nombre = req.getParameter("nombre");
		String profesor = req.getParameter("profesor");
		int creditos = Integer.parseInt(req.getParameter("creditos"));
		int horas = Integer.parseInt(req.getParameter("horas"));
		if (cursos == null) {
			resp.getWriter().println("CURSO CREADO" + "</br>");
			resp.getWriter().println("Nombre: " + nombre + "</br>");
			resp.getWriter().println("Profesor: " + profesor + "</br>");
			resp.getWriter().println("Creditos: " + creditos + "</br>");
			resp.getWriter().println("Horas: " + horas + "</br>");
			resp.getWriter().println("</td></tr> </table>" + "</div>");

			resp.getWriter().println("   <footer id='main-footer'>"
					+ "<p>&copy; Hecho por Iam Contreras Alcazar (20160651)</p>" + "</footer>");
			resp.getWriter().println("</body>" + "</html>");

			Curso nuevo = new Curso(nombre, profesor, creditos, horas);
			if (getServletContext().getAttribute("cursos") != null) {// si //
																		// existe
																		// objeto
																		// alumno
				cursos = (ArrayList<Curso>) (getServletContext().getAttribute("cursos"));// conseguir
																							// lista
																							// existente
				cursos.add(nuevo);// agregar nuevo alumno
				getServletContext().setAttribute("cursos", cursos);
			} else {// si no existe objeto alumno
				cursos = new ArrayList<Curso>();// crear nuevo alumno
				cursos.add(nuevo);// y lo agrega
				getServletContext().setAttribute("cursos", cursos);
			}
		} else {
			for (Curso a : cursos) {
				if (nombre.equals(a.getNombre())) {
					resp.getWriter().println("YA EXISTE ESE CURSO");
					comprobar = 1;
				}

			}
			if (comprobar != 1) {
				resp.getWriter().println("CURSO CREADO" + "</br>");
				resp.getWriter().println("Nombre: " + nombre + "</br>");
				resp.getWriter().println("Profesor: " + profesor + "</br>");
				resp.getWriter().println("Creditos: " + creditos + "</br>");
				resp.getWriter().println("Horas: " + horas + "</br>");
				resp.getWriter().println("</td></tr> </table>" + "</div>");

				resp.getWriter().println("   <footer id='main-footer'>"
						+ "<p>&copy; Hecho por Iam Contreras Alcazar (20160651)</p>" + "</footer>");
				resp.getWriter().println("</body>" + "</html>");

				Curso nuevo = new Curso(nombre, profesor, creditos, horas);
				if (getServletContext().getAttribute("cursos") != null) {// si
																			// //
																			// existe
																			// objeto
																			// alumno
					cursos = (ArrayList<Curso>) (getServletContext().getAttribute("cursos"));// conseguir
																								// lista
																								// existente
					cursos.add(nuevo);// agregar nuevo alumno
					getServletContext().setAttribute("cursos", cursos);
				} else {// si no existe objeto alumno
					cursos = new ArrayList<Curso>();// crear nuevo alumno
					cursos.add(nuevo);// y lo agrega
					getServletContext().setAttribute("cursos", cursos);
				}
			}
		}
	}
}
