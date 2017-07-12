package pw2;
import java.io.IOException;

import java.util.*;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;


@SuppressWarnings("serial")
public class SubirNotasServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		ArrayList<Alumno> estudiantes = (ArrayList<Alumno>) (getServletContext().getAttribute("estudiante"));
		
		String correo = req.getParameter("correo");
		
		int bim1 = Integer.parseInt(req.getParameter("n1"));
		int bim2 = Integer.parseInt(req.getParameter("n2"));
		int bim3 = Integer.parseInt(req.getParameter("n3"));
		
		
        final PersistenceManager pm = PMF.get().getPersistenceManager();
       
        try{
        	Alumno a = null;
        	for(Alumno al : estudiantes){
  				if(al.getCorreo().equals(correo))
  					a=al;
        	}
        	if(a!=null)
        		a.setNotas(bim1, bim2, bim3);
	        
          	resp.sendRedirect("subirnotas.jsp");
        	
         }catch(Exception e){
	        System.out.println(e);
	        resp.getWriter().println("Ocurrio un error, <a href='/llenarnotas'>vuelva a intentarlo</a> " + e);
         }finally{
	        pm.close();
         }
	}
}