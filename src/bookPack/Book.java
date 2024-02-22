package bookPack;

public class Book {
	private String name;
	private int price;
	private int stock;
	private String imgUrl;
	private String type;
	private String author;
	private String publisher;
	private String description;
	private String edition;
	
	public Book(String name, int price, int stock, String imgUrl, String type, 
			String author, String publisher, String description, String edition) {
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.imgUrl = imgUrl;
		this.type = type;
		this.author = author;
		this.publisher = publisher;
		this.description = description;
		this.edition = edition;
	}
	
	public String getName() {
		return this.name;
	}
	public int getPrice() {
		return this.price;
	}
	public int getStock() {
		return this.stock;
	}
	public String getImgUrl() {
		return this.imgUrl;
	}
	public String getType() {
		return this.type;
	}
	public String getAuthor() {
		return this.author;
	}
	public String getPublisher() {
		return this.publisher;
	}
	public String getDescription() {
		return this.description;
	}
	public String getEdition() {
		return this.edition;
	}
}
