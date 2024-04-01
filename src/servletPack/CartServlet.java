package servletPack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Map;
import java.util.HashMap;
import bookPack.Book;
import bookPack.CartCheckBean;

public class CartServlet extends HttpServlet {
	private static boolean isSerialized(String fileName) {
        File file = new File(fileName);
        return file.exists();
    }
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setHeader("Expires", "0"); // Proxies
		
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String price = request.getParameter("price");
        String imgUrl = request.getParameter("img-url");
        String type = request.getParameter("type");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String edition = request.getParameter("edition");
        String description = request.getParameter("description");
        String stock = request.getParameter("stock");
		
		String folder = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\"
				+ "E_BookStore\\WebContent\\books\\cart\\"+email;
		File emailFolder = new File(folder);
		if(!emailFolder.exists()) {
			emailFolder.mkdir();
		}
		
		CartCheckBean cb = new CartCheckBean();
		
		if(cb.checkOrder(id)) {
			out.print("<p style='color: red; position: absolute; "
					+ "text-align: center; width: 100%; top: 8vw;'>"
					+ "Item already been Ordered By you!!</p>");
			
			RequestDispatcher rd = request.getRequestDispatcher("assets/presentation/booksDisp.jsp");
			rd.include(request,response);
		}
		else {
			Book b = new Book(name, Integer.parseInt(price), Integer.parseInt(stock), 
					imgUrl, type, author, publisher, description, edition);
			
			String serFile = folder + File.separator + b.getName() + id + ".ser";
			
			if(!isSerialized(serFile)) {
				FileOutputStream file = new FileOutputStream(serFile);
				ObjectOutputStream objectOut = new ObjectOutputStream(file);
				objectOut.writeObject(b);
				
				file.close();
				objectOut.close();
				
				response.sendRedirect("index.jsp");
			}
			else {
				out.print("<p style='color: red; position: absolute; "
						+ "text-align: center; width: 100%; top: 8vw;'>"
						+ "Already added to cart!!</p>");
				
				RequestDispatcher rd = request.getRequestDispatcher("assets/presentation/booksDisp.jsp");
				rd.include(request,response);
			}
		}
	}
}
