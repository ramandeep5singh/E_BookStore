package servletPack;

import generalPack.CredentialsBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		CredentialsBean b = new CredentialsBean();
		
		b.setName(name);
		b.setPhone(phone);
		b.setEmail(email);
		b.setPassword(password);
		
		if(b.register()) {
			Cookie cookie1 = new Cookie("userName",name);
			Cookie cookie2 = new Cookie("phone",phone);
			Cookie cookie3 = new Cookie("email",email);
			
			out.print("<p style='color: red; position: absolute; text-align: center; width: 100%; top: 6vw;'>Account Created Successfully!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request,response);
		}
	}

}
