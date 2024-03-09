package displayBeanPack;

import connection.Connect;
//import java.io.*;
//import bookPack.Book;
//import java.util.*;
import java.sql.*;

public class OrderBean {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	public ResultSet getOrders() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.name"
					+ " as name, books.price as price, books.stock as stock, "
					+ "books.img_url as img_url, books.type as type, orders.orderId "
					+ "as order_id, orders.email as email, orders.quantity as "
					+ "quantity from books inner join orders on books.book_id "
					+ "= orders.book_id;");
			rs = ps.executeQuery();
			
			return rs;
		}
		catch(SQLException e) {}
		
		return null;
	}
}
