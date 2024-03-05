package bookPack;

import java.sql.*;
import java.util.Scanner;
import java.io.*;

import connection.Connect;

public class AddBookBean {
	private String name;
	private int price;
	private int stock;
	private String imgUrl;
	private String type;
	private String author;
	private String publisher;
	private String description;
	private String edition;
	
	public String exc;
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	
	public boolean addBook() {
		con = Connect.getConnection();
		try {
			ps = con.prepareStatement("select books.book_id as book_id, books.stock"
					+ " as stock from books inner join books_info on books.book_id "
					+ "= books_info.book_id and (books.book_id = ? and "
					+ "books_info.edition = ?);");
			ps.setString(1, name);
			ps.setString(2, edition);
			rs = ps.executeQuery();
			
			int id = -1;
			int st = -1;
			
			if(rs.next()) {
				id = rs.getInt("book_id");
				st = rs.getInt("stock")+stock;
				
				ps = con.prepareStatement("update books set stock = ? where book_id = ?;");
				ps.setInt(1, st);
				ps.setInt(2, id);
				ps.executeUpdate();
				
				return true;
			}
			
			ps = con.prepareStatement("insert into books (name,price,stock,img_url,type)"
					+ " values (?,?,?,?,?);");
			ps.setString(1, name);
			ps.setInt(2, price);
			ps.setInt(3, stock);
			ps.setString(4, imgUrl);
			ps.setString(5, type);
			ps.executeUpdate();
			
			ps = con.prepareStatement("select LAST_INSERT_ID() as id;");
			rs = ps.executeQuery();
			
			if(rs.next()) {
				id = rs.getInt("id");	
			}
			
			ps = con.prepareStatement("insert into books_info "
					+ "(book_id,author,description,publisher,edition) "
					+ "values (?,?,?,?,?);");
			ps.setInt(1, id);
			ps.setString(2, author);
			ps.setString(3, description);
			ps.setString(4, publisher);
			ps.setString(5, edition);
			ps.executeUpdate();
			
			return true;
		}
		catch(SQLException e){
			StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            this.exc = sw.toString();
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
