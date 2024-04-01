package OrderPack;

import java.sql.*;
import connection.Connect;

public class CancelOrderBean {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public boolean cancel(int id) {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("delete from orders where OrderId = ?;");
			ps.setInt(1, id);
			ps.executeUpdate();
			
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
