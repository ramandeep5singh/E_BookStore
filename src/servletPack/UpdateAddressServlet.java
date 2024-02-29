package servletPack;

import generalPack.UpdateAddressBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UpdateAddressServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
		
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String email = request.getParameter("email");
		
		UpdateAddressBean ua = new UpdateAddressBean();
		
		ua.setAddress(address1+" "+address2);
		ua.setEmail(email);
		
		if(ua.update()) {
			HttpSession session = request.getSession();
			session.setAttribute("address",address1+" "+address2);
			response.sendRedirect("assets/presentation/orders.jsp");
		}
		else {
			out.print("<p style='color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 5vw;'>"
					+ "Something went wrong!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("assets/presentation/orders.jsp");
			rd.include(request,response);
		}
	}
}
