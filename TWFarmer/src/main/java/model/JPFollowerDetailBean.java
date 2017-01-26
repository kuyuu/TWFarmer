package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "JPFollowerDetail")
public class JPFollowerDetailBean implements java.io.Serializable {
	private int JPFollowerId;
	private int productId;
	private int quantity;
	private int price;

	public JPFollowerDetailBean() {
	}
	@Id 
	@Column(name = "JPFollowerID") 
	public int getJPFollowerId() {
		return JPFollowerId;
	}

	public void setJPFollowerId(int JPFollowerId) {
		this.JPFollowerId = JPFollowerId;
	}
	@Id 
	@Column(name = "ProductID") 
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Column(name = "Quantity")
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Column(name = "Price")
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
