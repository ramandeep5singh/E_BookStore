package OrderPack;

import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.*;
import java.util.TreeMap;
import connection.Connect;
import OrderPack.UserBook;

public class UserOrders {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public TreeMap<Integer,UserBook> getOrders(String email) {
		TreeMap<Integer,UserBook> t = new TreeMap();
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select orders.status as status, orders.payment as payment, "
					+ "orders.quantity as quantity, orders.orderId as orderId, "
					+ " books.name as name, books.price as price, books.img_url as img_url "
					+ "from orders inner join books on books.book_id = "
					+ "orders.book_Id where email = ?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				UserBook ub = new UserBook(rs.getString("name"), rs.getInt("price"), 
						rs.getInt("status"), rs.getInt("payment"), rs.getString("img_url"), 
						rs.getInt("quantity"), rs.getInt("orderId"));
				t.put(rs.getInt("orderId"), ub);
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
