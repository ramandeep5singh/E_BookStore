package servletPack;

import java.io.*;
import java.nio.file.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RemoveCartServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		String path = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\"
				+ "E_BookStore\\WebContent\\books\\cart\\"+email+"\\"+name+id+".ser";
		Path filePath = Paths.get(path);
        try {
            Files.delete(filePath);
            out.print("File deleted successfully");
        } catch (IOException e) {
            out.print("Error deleting file: " + e.getMessage());
        }
	}
}
