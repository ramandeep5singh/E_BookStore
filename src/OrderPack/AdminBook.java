package OrderPack;

public class AdminBook {
	private String name;
	private int price;
	private int stock;
	private String img_url;
	private String type;
	private int quantity;
	private int orderId;
	
	public AdminBook(String name, int price, int stock, String img_url, String type, 
			int quantity, int orderId) {
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.img_url = img_url;
		this.type = type;
		this.quantity = quantity;
		this.orderId = orderId;
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
	public String getImg_url() {
		return this.img_url;
	}
	public String getType() {
		return this.type;
	}
	public int getQuantity() {
		return this.quantity;
	}
	public int getOrderId() {
		return this.orderId;
	}
}
