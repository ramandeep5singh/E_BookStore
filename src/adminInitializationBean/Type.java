package adminInitializationBean;

import java.sql.*;
import connection.Connect;

public class Type {
	private String type;
	private int sold = 0;
	private int orders = 0;
	private int ack = 0;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public Type(String type) {
		this.type = type;
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select count(*) as sold from orders "
					+ "inner join books on books.book_id = orders.book_Id "
					+ "where books.type = ? and orders.status = ?;");
			ps.setString(1, type);
			ps.setInt(2, 3);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.sold = rs.getInt("sold");
			}
			
			ps = con.prepareStatement("select count(*) as orders from orders "
					+ "inner join books on books.book_id = orders.book_id "
					+ "where books.type = ?;");
			ps.setString(1, type);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.orders = rs.getInt("orders");
			}
			
			ps = con.prepareStatement("select count(*) as ack from orders "
					+ "inner join books on books.book_id = orders.book_Id "
					+ "where books.type = ? and orders.status = ?;");
			ps.setString(1, type);
			ps.setInt(2, 2);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.ack = rs.getInt("ack");
			}
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e){}
		}
	}
	
	public int getSold() {
		return this.sold;
	}
	public int getOrders() {
		return this.orders;
	}
	public int getAck() {
		return this.ack;
	}
}
