package servletPack;

import generalPack.CredentialsBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AjaxSignIn extends HttpServlet {
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
			Cookie cookie = new Cookie("email",b.getEmail());
			cookie.setMaxAge(24*60*60);
			
			response.addCookie(cookie);
			
			HttpSession session = request.getSession();
			session.setAttribute("name",b.getName());
			session.setAttribute("phone",b.getPhone());
			session.setAttribute("address",b.getAddress());
			session.setMaxInactiveInterval(24*60*60);
			
			response.setStatus(HttpServletResponse.SC_OK);
			
			response.sendRedirect("assets/presentation/orders.jsp");
        }
        else {
        	response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        	if(b.flag==0) {
        		response.getWriter().write("Wrong Credentials!!");
        	}
        	else if(b.flag==1) {
        		response.getWriter().write("Wrong Password!!");
        	}
        	else {
        		response.getWriter().write("Something Went Wrong!!");
        	}
        }
	}
}
