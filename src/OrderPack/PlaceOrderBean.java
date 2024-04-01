package OrderPack;

import java.sql.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import connection.Connect;

public class PlaceOrderBean {
	private int bookId;
	private String email;
	private int status;
	private int quantity;
	private int payment;
	private String name;
	private String cartPath = "C:\\Users\\Ramandeep Singh\\eclipse-workspace\\"
			+ "E_BookStore\\WebContent\\books\\cart";
	
	public String exc;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public int flag = 0;
	
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	
	public boolean order() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select * from orders where book_id = ?"
					+ " and email=?;");
			ps.setInt(1, bookId);
			ps.setString(2, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				flag = 1;
				return false;
			}
			
			ps = con.prepareStatement("select name from books where book_id = ?");
			ps.setInt(1,bookId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
			
			ps = con.prepareStatement("insert into orders (book_id,email,status"
					+ ",quantity,payment) values (?,?,?,?,?);");
			ps.setInt(1, bookId);
			ps.setString(2, email);
			ps.setInt(3, status);
			ps.setInt(4, quantity);
			ps.setInt(5, payment);
			ps.executeUpdate();
			
			ps = con.prepareStatement("select stock from books where "
					+ "book_id = ?;");
			ps.setInt(1, bookId);
			rs = ps.executeQuery();
			
			int stock = 0;
			if(rs.next()) {
				stock = rs.getInt("stock")-quantity;
			}
			
			ps = con.prepareStatement("update books"
					+ " set stock=? where book_id=?");
			ps.setInt(1, stock);
			ps.setInt(2, bookId);
			ps.executeUpdate();
			
			String bookPath = cartPath + File.separator + email + File.separator + 
					name + bookId + ".ser";	
			Path filePath = Paths.get(bookPath);
	        try {
	            Files.delete(filePath);
	            return true;
	        } catch (IOException e) {
	        	StringWriter sw = new StringWriter();
	            PrintWriter pw = new PrintWriter(sw);
	            e.printStackTrace(pw);
	            this.exc = sw.toString();
	            flag = 2;
	        }
	        
	        return false;
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return false;
	}
}
