package adminInitializationBean;

import java.sql.*;
import connection.Connect;

public class AcknowledgeBean {
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public boolean acknowledge(int status, int id) {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("update orders set status = ? where orderId "
					+ "= ?");
			ps.setInt(1, status);
			ps.setInt(2, id);
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
