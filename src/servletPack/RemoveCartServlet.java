package servletPack;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RemoveCartServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String folder = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\"
				+ "E_BookStore\\WebContent\\books\\cart\\"+email;
		
		String fileName = name+id+".ser";
		
		File file = new File(folder,fileName);
		
		try {
            if (file.exists() && file.isFile()) {
                if (file.delete()) {
                    response.sendRedirect("assets\\presentation\\cart.jsp");
                } else {
                    out.print("Error: Failed to delete file");
                }
            } else {
                out.print("File does not exist");
            }
        } catch (SecurityException e) {
            out.print("SecurityException: " + e.getMessage());
        } catch (Exception e) {
            out.print("Exception: " + e.getMessage());
        }
	}
}
