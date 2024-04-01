package bookPack;

import java.sql.*;
import connection.Connect;

public class CartCheckBean {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public boolean checkOrder(String id) {
		int book_id = Integer.parseInt(id);
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select * from orders where book_Id = ?");
			ps.setInt(1, book_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return true;
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
