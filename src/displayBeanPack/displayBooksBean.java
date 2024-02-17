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
	
	public HashMap<Integer,Book> getBooks() {
		HashMap<Integer,Book> h = new HashMap<>();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select * from books;");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Book b = new Book(rs.getString("name"),rs.getInt("price"),rs.getInt("stock"),rs.getString("img_url"));
				h.put(rs.getInt("book_id"), b);
			}
			
			return h;
		}
		catch(SQLException e){}
		finally {
			try {
				if(con!=null) {
					con.close();
				}
			}
			catch(SQLException e) {}
		}
		
		return h;
	}
}
