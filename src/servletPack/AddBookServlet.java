package servletPack;

import bookPack.AddBookBean;
import javax.servlet.annotation.MultipartConfig;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@MultipartConfig(
		location = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\E_BookStore\\WebContent\\books\\images",
		fileSizeThreshold = 1024 * 1024,   //1mb
		maxFileSize = 1024 * 1024 * 10,    //10mb
		maxRequestSize = 1024 * 1024 * 11 //11mb
	)

public class AddBookServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String edition = request.getParameter("edition");
		String description = request.getParameter("description");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		Part file = request.getPart("file");
		String fileName = file.getSubmittedFileName();
		
		OutputStream os = null;
		InputStream fileContent = null;
		
		String upload = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\"
				+ "E_BookStore\\WebContent\\books\\images";
		
		AddBookBean b = new AddBookBean();
		
		b.setName(name);
		b.setAuthor(author);
		b.setPublisher(publisher);
		b.setEdition(edition);
		
		int extStart = fileName.lastIndexOf('.');
		String descFileName = fileName.substring(0, extStart)+".txt";
		b.setDescription("C:\\Users\\Ramandeep Singh\\eclipse-workspace\\E_BookStore\\WebContent\\books\\desc"+"\\"+descFileName);
		try {
			File descFile = new File("C:\\Users\\Ramandeep Singh\\eclipse-workspace\\E_BookStore\\WebContent\\books\\desc",
					descFileName);
			FileWriter writer = new FileWriter(descFile);
			writer.write(description);
			writer.close();
		}
		catch(IOException e) {
			StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
			out.print(sw.toString());
		}
		b.setType(type);
		b.setPrice(price);
		b.setStock(quantity);
		b.setImgUrl("books/images/"+ fileName);
		
		if(b.addBook()) {
			try {
				os = new FileOutputStream(new File(upload + File.separator + fileName));
				fileContent = file.getInputStream();
				int read = 0;
	            byte[] bytes = new byte[1024];
	            while ((read = fileContent.read(bytes)) != -1) {
	                os.write(bytes, 0, read);
	            }
	            response.sendRedirect("index.jsp");
			}
			catch(FileNotFoundException e) {
				out.print(e);
			}
			finally {
				if(os!=null) {
					os.close();
				}
				if(fileContent!=null) {
					fileContent.close();
				}
			}
		}
		else {
			out.print(b.exc);
//			out.print("<p style='color: red; position: absolute; "
//					+ "text-align: center; width: 100%; top: 8vw;'>"
//					+ "Something went wrong!!</p>");
//			
//			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//			rd.include(request,response);
		}
	}
}
