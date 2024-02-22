package displayBeanPack;
import connection.Connect;
import bookPack.Book;
import java.util.*;
import java.sql.*;

public class displayBooksBean {
//	private int bookId;
//	private String name;
//	private int price;
//	private int stock;
//	private String imgUrl;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
//	public void setBookId(int bookId) {
//		this.bookId = bookId;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public void setPrice(int price) {
//		this.price = price;
//	}
//	public void setStock(int stock) {
//		this.stock = stock;
//	}
//	public void setImgUrl(String imgUrl) {
//		this.imgUrl = imgUrl;
//	}
	
	public HashMap<Integer,Book> getJavaBooks() {
		HashMap<Integer,Book> h = new HashMap<>();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.name as name, books.price as price, "
					+ "books.stock as stock, books.img_url as img_url, "
					+ "books.type as type, books_info.author as author, "
					+ "books_info.description as description, "
					+ "books_info.publisher as publisher, "
					+ "books_info.edition as edition from books inner join "
					+ "books_info on books.book_id = books_info.book_id and "
					+ "books.type = ?;");
			ps.setString(1, "java");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book b = new Book(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),
						rs.getString("type"),rs.getString("author"),
						rs.getString("description"),rs.getString("publisher"),
						rs.getString("edition"));
				h.put(rs.getInt("book_id"), b);
			}
			
			return h;
		}
		catch(SQLException e){}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return h;
	}
	
	public HashMap<Integer,Book> getPythonBooks() {
		HashMap<Integer,Book> h = new HashMap<>();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.name as name, books.price as price, "
					+ "books.stock as stock, books.img_url as img_url, "
					+ "books.type as type, books_info.author as author, "
					+ "books_info.description as description, "
					+ "books_info.publisher as publisher, "
					+ "books_info.edition as edition from books inner join "
					+ "books_info on books.book_id = books_info.book_id and "
					+ "books.type = ?;");
			ps.setString(1, "python");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book b = new Book(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),
						rs.getString("type"),rs.getString("author"),
						rs.getString("description"),rs.getString("publisher"),
						rs.getString("edition"));
				h.put(rs.getInt("book_id"), b);
			}
			
			return h;
		}
		catch(SQLException e){}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return h;
	}
	
	public HashMap<Integer,Book> getCppBooks() {
		HashMap<Integer,Book> h = new HashMap<>();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.name as name, books.price as price, "
					+ "books.stock as stock, books.img_url as img_url, "
					+ "books.type as type, books_info.author as author, "
					+ "books_info.description as description, "
					+ "books_info.publisher as publisher, "
					+ "books_info.edition as edition from books inner join "
					+ "books_info on books.book_id = books_info.book_id and "
					+ "books.type = ?;");
			ps.setString(1, "cpp");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book b = new Book(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),
						rs.getString("type"),rs.getString("author"),
						rs.getString("description"),rs.getString("publisher"),
						rs.getString("edition"));
				h.put(rs.getInt("book_id"), b);
			}
			
			return h;
		}
		catch(SQLException e){}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return h;
	}
	
	public HashMap<Integer,Book> getCBooks() {
		HashMap<Integer,Book> h = new HashMap<>();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.name as name, books.price as price, "
					+ "books.stock as stock, books.img_url as img_url, "
					+ "books.type as type, books_info.author as author, "
					+ "books_info.description as description, "
					+ "books_info.publisher as publisher, "
					+ "books_info.edition as edition from books inner join "
					+ "books_info on books.book_id = books_info.book_id and "
					+ "books.type = ?;");
			ps.setString(1, "c");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book b = new Book(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),
						rs.getString("type"),rs.getString("author"),
						rs.getString("publisher"),rs.getString("description"),
						rs.getString("edition"));
				h.put(rs.getInt("book_id"), b);
			}
			
			return h;
		}
		catch(SQLException e){}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return h;
	}
}
