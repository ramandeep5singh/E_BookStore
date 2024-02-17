package bookPack;

public class Book {
	private String name;
	private int price;
	private int stock;
	private String imgUrl;
	
	public Book(String name, int price, int stock, String imgUrl) {
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.imgUrl = imgUrl;
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
}
