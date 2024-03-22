package adminInitializationBean;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.*;
import connection.Connect;

public class AdminBean {
	private int sales = 0;
	private int orders = 0;
	private int products = 0;
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public String exc;
	
	public int getSales() {
		return sales;
	}
	public int getOrders() {
		return orders;
	}
	public int getProducts() {
		return products;
	}
	
	public void setInitials() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select count(*) as sales from orders "
					+ "where status = ?;");
			ps.setInt(1,3);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.sales = rs.getInt("sales");
			}
			
			ps = con.prepareStatement("select count(*) as orders from orders;");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.orders = rs.getInt("orders");
			}
			
			ps = con.prepareStatement("select count(*) as products from books;");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				this.products = rs.getInt("products");
			}
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
	}
	
	public boolean getStatus() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select status from admin;");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean("status");
			}
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
	
	public void setStatus() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("delete from admin;");
			ps = con.prepareStatement("insert into admin values (?);");
			ps.setBoolean(1, true);
			ps.executeUpdate();
		}
		catch(SQLException e) {}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
	}
}
