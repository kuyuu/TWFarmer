package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "JPFollowerDetail")
public class JPFollowerDetailBean implements java.io.Serializable {
	private Integer JPFollowerId;
	private Integer productId;
	private Integer quantity;
	private Integer price;

	public JPFollowerDetailBean() {
	}
	@Id 
	@Column(name = "JPFollowerID") 
	public Integer getJPFollowerId() {
		return JPFollowerId;
	}

	public void setJPFollowerId(Integer JPFollowerId) {
		this.JPFollowerId = JPFollowerId;
	}
	@Id 
	@Column(name = "ProductID") 
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	@Column(name = "Quantity")
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Column(name = "Price")
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
}
