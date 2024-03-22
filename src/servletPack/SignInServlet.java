package servletPack;

import generalPack.CredentialsBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignInServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        ServletContext context = getServletContext();
        String admin = "admin123";
        String paramValue = context.getInitParameter("admin123");
        
        if(email.equals(admin) && password.equals(paramValue)) {
        	response.sendRedirect("admin-check");
        }
        
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
			
			response.sendRedirect("index.jsp");
        }
        else {
        	if(b.flag==0) {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 8vw;'>"
    					+ "Wrong Credentials!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        	else if(b.flag==1) {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 8vw;'>"
    					+ "Wrong Password!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        	else {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 8vw;'>"
    					+ "Something went Wrong!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    			rd.include(request,response);
        	}
        }
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request,response);
	}
}
