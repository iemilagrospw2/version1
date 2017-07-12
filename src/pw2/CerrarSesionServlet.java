package pw2;

import java.io.IOException;

import javax.servlet.http.*;


@SuppressWarnings("serial")
public class CerrarSesionServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		HttpSession misesion= req.getSession();
		
		misesion.invalidate();
		
		 resp.sendRedirect("principal.html");

	}
}