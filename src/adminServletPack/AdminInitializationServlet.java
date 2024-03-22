package adminServletPack;

import adminInitializationBean.AdminBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminInitializationServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		boolean status = false;
		
		AdminBean ab = new AdminBean();
		status = ab.getStatus();
		
		if(status) {
			out.print("<center style='color: red'><h1>Already Login!!</h1></center>");
		}
		else {
			ab.setInitials();
			ab.setStatus();
			HttpSession session = request.getSession();
			session.setAttribute("sales", ab.getSales());
			session.setAttribute("orders", ab.getOrders());
			session.setAttribute("products", ab.getProducts());
			response.sendRedirect("assets/admin-presentation/admin.jsp");
		}
	}

}
