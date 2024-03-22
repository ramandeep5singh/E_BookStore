package OrderPack;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;
import java.util.TreeMap;
import connection.Connect;
import OrderPack.AdminBook;

public class AdminOrders {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public TreeMap<String,AdminBook> getOrders() {
		TreeMap<String,AdminBook> t = new TreeMap();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select orders.email as email, "
					+ "orders.quantity as quantity, orders.orderId as orderId, "
					+ " books.name as name, books.price as price, books.stock as"
					+ " stock, books.img_url as img_url, books.type as type "
					+ "from orders inner join books on books.book_id = "
					+ "orders.orderId where status = ?;");
			ps.setInt(1, 1);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBook ab = new AdminBook(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),rs.getString("type"),
						rs.getInt("quantity"),rs.getInt("orderId"));
				t.put(rs.getString("email"),ab);
			}
			
			return t;
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return t;
	}
	
	public TreeMap<String,AdminBook> getAcknowledgement() {
		TreeMap<String,AdminBook> t = new TreeMap();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select orders.email as email, "
					+ "orders.quantity as quantity, orders.orderId as orderId, "
					+ " books.name as name, books.price as price, books.stock as"
					+ " stock, books.img_url as img_url, books.type as type "
					+ "from orders inner join books on books.book_id = "
					+ "orders.orderId where status = ?;");
			ps.setInt(1, 2);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBook ab = new AdminBook(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),rs.getString("type"),
						rs.getInt("quantity"),rs.getInt("orderId"));
				t.put(rs.getString("email"),ab);
			}
			
			return t;
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return t;
	}
	
	public TreeMap<String,AdminBook> getDelivered() {
		TreeMap<String,AdminBook> t = new TreeMap();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select orders.email as email, "
					+ "orders.quantity as quantity, orders.orderId as orderId, "
					+ " books.name as name, books.price as price, books.stock as"
					+ " stock, books.img_url as img_url, books.type as type "
					+ "from orders inner join books on books.book_id = "
					+ "orders.orderId where status = ?;");
			ps.setInt(1, 3);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBook ab = new AdminBook(rs.getString("name"),rs.getInt("price"),
						rs.getInt("stock"),rs.getString("img_url"),rs.getString("type"),
						rs.getInt("quantity"),rs.getInt("orderId"));
				t.put(rs.getString("email"),ab);
			}
			
			return t;
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return t;
	}
}
