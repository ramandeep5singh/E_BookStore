package servletPack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import OrderPack.CancelOrderBean;

public class CancelOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		
		CancelOrderBean cob = new CancelOrderBean();
		
		if(cob.cancel(Integer.parseInt(id))) {
			out.print("<p style='color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 5vw; z-index: 12;'>"
					+ "Order cancelled successfully!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request,response);
		}
		else {
			out.print("<p style='color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 5vw; z-index: 12;'>"
					+ "Something went wrong!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request,response);
		}
	}

}
