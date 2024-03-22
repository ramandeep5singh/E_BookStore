package adminServletPack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminRedirectServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		String encodedUrl = response.encodeURL("login.jsp");
		String url = encodedUrl + "?type=admin";
		response.sendRedirect(url);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		doGet(request,response);
	}
}
