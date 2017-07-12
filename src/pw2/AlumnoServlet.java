package pw2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.*;

@SuppressWarnings("serial")
public class AlumnoServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html");
		ArrayList<Curso> cursos = (ArrayList<Curso>) (getServletContext().getAttribute("cursos"));
		ArrayList<Alumno> alumnos = (ArrayList<Alumno>) (getServletContext().getAttribute("alumnos2"));
		ArrayList<Curso> cu = new ArrayList<Curso>();
		int comprobar = 0;
		resp.getWriter()
				.println("<html>" + "<head>" + "<meta http-equiv='content-type' content='text/html; charset=UTF-8'>"
						+ "		<link href='css/default.css' rel='stylesheet' type='text/css'>"
						+ "<title>Alumnos</title>" + "<header id='main-header'>" + "<nav>" + "<ul class='navbar'>"+
					
						"<li><a href='ver.jsp'>Ver</a></li>" + 
						"<li><a href='inicio.html'>VOLVER</a></li>" +"</ul>"+
						 "</nav>" + "</header>" + "</head>" + "<body>");

		resp.getWriter().println("<div id='fondoFormulario2'></div>" + "<div id='form2'>");
		resp.getWriter().println("<table><tr> <td>");
		if (alumnos == null) {

			resp.getWriter().println("ALUMNO CREADO</br>");
			resp.getWriter().println("Nombre: " + req.getParameter("nombre"));
			resp.getWriter().println("</br>Apellido: " + req.getParameter("apellido"));
			resp.getWriter().println("</br>Correo: " + req.getParameter("correo"));
			resp.getWriter().println("</br>CUI: " + req.getParameter("cui") + "</br>");

			String select[] = req.getParameterValues("curso");
			if (select != null && select.length != 0) {
				resp.getWriter().println("Cursos: " + "<br>");
				for (int i = 0; i < select.length; i++) {
					resp.getWriter().println(select[i] + "<br>");
					for (Curso a : cursos)
						if (a.getNombre().equals(select[i])) {
							cu.add(a);

						}
				}
				

			}
			resp.getWriter().println("</td></tr> </table>" + "</div>");
			resp.getWriter().println("</td></tr> </table>" + "</div>");
			resp.getWriter().println("   <footer id='main-footer'>"
					+ "<p>&copy; Hecho por Iam Contreras Alcazar (20160651)</p>" + "</footer>");
			resp.getWriter().println("</body>" + "</html>");
			Alumno nuevo = new Alumno(req.getParameter("nombre"), req.getParameter("apellido"),
					Integer.parseInt(req.getParameter("cui")), cu,req.getParameter("correo"));
			if (getServletContext().getAttribute("alumnos2") != null) {// si
																		// existe
																		// objeto
																		// alumno
				alumnos = (ArrayList<Alumno>) (getServletContext().getAttribute("alumnos2"));// conseguir
																							// lista
																							// existente
				alumnos.add(nuevo);// agregar nuevo alumno
				getServletContext().setAttribute("alumnos2", alumnos);
			} else {// si no existe objeto alumno
				alumnos = new ArrayList<Alumno>();// crear nuevo alumno
				alumnos.add(nuevo);// y lo agrega
				getServletContext().setAttribute("alumnos2", alumnos);
			}
		

		} else {
			for (Alumno a : alumnos){
				if (Integer.parseInt(req.getParameter("cui")) == (a.getCui())) {
					resp.getWriter().println("YA EXISTE ESE ALUMNO");
					comprobar = 1;
				}
		}
		if (comprobar != 1) {
			resp.getWriter().println("ALUMNO CREADO</br>");
			resp.getWriter().println("Nombre: " + req.getParameter("nombre"));
			resp.getWriter().println("</br>Apellido: " + req.getParameter("apellido"));
			resp.getWriter().println("</br>Correo: " + req.getParameter("correo"));
			resp.getWriter().println("</br>CUI: " + req.getParameter("cui") + "</br>");

			String select[] = req.getParameterValues("curso");
			if (select != null && select.length != 0) {
				resp.getWriter().println("Cursos: " + "<br>");
				for (int i = 0; i < select.length; i++) {
					resp.getWriter().println(select[i] + "<br>");
					for (Curso a : cursos)
						if (a.getNombre().equals(select[i])) {
							cu.add(a);

						}
				}
			

			}
			resp.getWriter().println("</td></tr> </table>" + "</div>");
			resp.getWriter().println("   <footer id='main-footer'>"
					+ "<p>&copy; Hecho por Iam Contreras Alcazar (20160651)</p>" + "</footer>");
			resp.getWriter().println("</body>" + "</html>");
			Alumno nuevo = new Alumno(req.getParameter("nombre"), req.getParameter("apellido"),
					Integer.parseInt(req.getParameter("cui")), cu,req.getParameter("correo"));
			if (getServletContext().getAttribute("alumnos") != null) {// si
																		// existe
																		// objeto
																		// alumno
				alumnos = (ArrayList<Alumno>) (getServletContext().getAttribute("alumnos"));// conseguir
																							// lista
																							// existente
				alumnos.add(nuevo);// agregar nuevo alumno
				getServletContext().setAttribute("alumnos", alumnos);
			} else {// si no existe objeto alumno
				alumnos = new ArrayList<Alumno>();// crear nuevo alumno
				alumnos.add(nuevo);// y lo agrega
				getServletContext().setAttribute("alumnos", alumnos);
			}

		}
		}

	}
}
