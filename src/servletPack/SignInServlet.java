package servletPack;

import generalPack.CredentialsBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignInServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        CredentialsBean b = new CredentialsBean();
        
        b.setEmail(email);
        b.setPassword(password);
        
        if(b.login()) {
			Cookie cookie1 = new Cookie("userName",b.getName());
			Cookie cookie2 = new Cookie("phone",b.getPhone());
			Cookie cookie3 = new Cookie("email",b.getEmail());
			Cookie cookie4 = new Cookie("address",b.getAddress());
			
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			
			response.sendRedirect("index.jsp");
        }
        else {
        	if(b.flag==0) {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 5vw;'>"
    					+ "Wrong Credentials!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        	else if(b.flag==1) {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 5vw;'>"
    					+ "Wrong Password!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        	else {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 5vw;'>"
    					+ "Something went Wrong!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        }
	}
}
