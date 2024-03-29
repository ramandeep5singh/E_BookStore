package servletPack;

import OrderPack.PlaceOrderBean;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class PlaceOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
        
        String bookId = request.getParameter("id");
        String email = request.getParameter("email");
        String status = request.getParameter("status");
        String quantity = request.getParameter("quantity");
        String payment = request.getParameter("payment");
        
        PlaceOrderBean po = new PlaceOrderBean();
        
        po.setBookId(Integer.parseInt(bookId));
        po.setEmail(email);
        po.setQuantity(Integer.parseInt(quantity));
        po.setStatus(Integer.parseInt(status));
        po.setPayment(Integer.parseInt(status));
        
        if(po.order()) {
//        	out.print("<p style='color: red; position: absolute; "
//					+ "text-align: center; width: 100%; top: 5vw;'>"
//					+ "Ordered Successfully!!</p>");
//			
//			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//			rd.include(request,response);
        	response.sendRedirect("index.jsp");
        }
        else {
        	if(po.flag==1) {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 5vw;'>"
    					+ "Ordered Previously!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    			rd.include(request,response);
        	}
        	else {
        		out.print("<p style='color: red; position: absolute; "
    					+ "text-align: center; width: 100%; top: 5vw;'>"
    					+ "Something went wrong!!</p>");
    			
    			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    			rd.include(request,response);
        	}
        }
	}
}
