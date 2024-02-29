package OrderPack;

import java.sql.*;

import connection.Connect;

public class PlaceOrderBean {
	private int bookId;
	private String email;
	private int status;
	private int quantity;
	
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
			
			ps = con.prepareStatement("insert into orders (book_id,email,status"
					+ ",quantity) values (?,?,?,?);");
			ps.setInt(1, bookId);
			ps.setString(2, email);
			ps.setInt(3, status);
			ps.setInt(4, quantity);
			ps.executeUpdate();
			
			if(status==1) {
				ps = con.prepareStatement("select stock from books where "
						+ "book_id = ?;");
				ps.setInt(1, bookId);
				rs = ps.executeQuery();
				
				int stock = 0;
				while(rs.next()) {
					stock = rs.getInt("stock")-quantity;
				}
				
				ps = con.prepareStatement("update books"
						+ " set stock=? where book_id=?");
				ps.setInt(1, stock);
				ps.setInt(2, bookId);
				ps.executeUpdate();
			}
			
			return true;
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
