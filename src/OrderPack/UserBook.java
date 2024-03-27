package OrderPack;

public class UserBook {
	private String name;
	private int price;
	private int status;
	private int payment;
	private String img_url;
	private int quantity;
	private int orderId;
	
	public UserBook(String name, int price, int status, int payment, String img_url, 
			int quantity, int orderId) {
		this.name = name;
		this.price = price;
		this.status = status;
		this.payment = payment;
		this.img_url = img_url;
		this.quantity = quantity;
		this.orderId = orderId;
	}
	
	public String getName() {
		return this.name;
	}
	public int getPrice() {
		return this.price;
	}
	public int getStatus() {
		return this.status;
	}
	public int getPayment() {
		return this.payment;
	}
	public String getImg_url() {
		return this.img_url;
	}
	public int getQuantity() {
		return this.quantity;
	}
	public int getOrderId() {
		return this.orderId;
	}
}
