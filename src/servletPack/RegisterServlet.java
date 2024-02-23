package servletPack;

import generalPack.CredentialsBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		/*cache control mechanism*/
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address1")+", "+request.getParameter("address2");
		String password = request.getParameter("password");
		
		CredentialsBean b = new CredentialsBean();
		
		b.setName(name);
		b.setPhone(phone);
		b.setEmail(email);
		b.setAddress(address);
		b.setPassword(password);
		
		if(b.register()) {
			out.print("<p style='z-index: 10; color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 5vw;'>"
					+ "Account created Successfully!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request,response);
		}
		else {
			out.print("<p style='color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 5vw;'>"
					+ "Account already exists!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request,response);
		}
	}

}
