package adminServletPack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import adminInitializationBean.AcknowledgeBean;

public class AcknowledgeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		int status = Integer.parseInt(request.getParameter("status"));
		
		AcknowledgeBean ab = new AcknowledgeBean();
		
		if(status==1) {
			if(ab.acknowledge(2, id)) {
				response.sendRedirect("assets/admin-presentation/admin.jsp");
			}
			else {
				out.print("something went wrong!!");
			}
		}
		else {
			if(ab.acknowledge(3, id)) {
				response.sendRedirect("assets/admin-presentation/admin.jsp");
			}
			else {
				out.print("something went wrong!!");
			}
		}
	}
}
