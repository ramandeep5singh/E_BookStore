package generalPack;
import java.sql.*;

import connection.Connect;

public class CredentialsBean {
	private String name;
	private String phone;
	private String email;
	private String address;
	private String password;
	
	public int flag = 0;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getAddress() {
		return address;
	}
	public String getPassword() {
		return password;
	}
	
	public boolean register() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select * from users where email = ?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return false;
			}
			ps = con.prepareStatement("insert into users "
					+ "(name,email,phone,address,password) "
					+ "values (?,?,?,?,?);");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, password);
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
	
	public boolean login() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select * from users where email = ?;");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(password.equals(rs.getString("password"))){
					name = rs.getString("name");
					phone = rs.getString("phone");
					address = rs.getString("address");
					return true;
				}
				else {
					flag = 1;
					return false;
				}
			}
			
			return false;
		}
		catch(SQLException e) {
			flag = 2;
		}
		finally {
			try {
				con.close();
			}
			catch(SQLException e) {}
		}
		
		return false;
	}
}
