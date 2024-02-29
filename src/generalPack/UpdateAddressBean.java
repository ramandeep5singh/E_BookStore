package generalPack;

import java.sql.*;
import connection.Connect;

public class UpdateAddressBean {
	private String address;
	private String email;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public void setAddress(String address) {
		this.address = address;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean update() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("update users set address ="
					+ " ? where email = ?;");
			ps.setString(1, address);
			ps.setString(2, email);
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
