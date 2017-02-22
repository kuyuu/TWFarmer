package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

import model.dao.ProductDAOjdbc;

@Entity
@Table(name = "JPFollowerDetail")
public class JPFollowerDetailBean implements java.io.Serializable {
	private Integer JPFollowerId;
	private Integer productId;
	private Integer quantity;
	private Integer price;
	private String productName;

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

	@Transient
	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Transient
	public String getProductName() {
		ProductDAOjdbc dao = new ProductDAOjdbc();
		return dao.select(productId).getProductName();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}

		if (!(obj instanceof JPFollowerDetailBean)) {
			return false;
		}

		JPFollowerDetailBean user = (JPFollowerDetailBean) obj;
		return new EqualsBuilder().append(this.JPFollowerId, user.getJPFollowerId())
				.append(this.productId, user.getProductId()).isEquals();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().append(this.JPFollowerId).append(this.productId).toHashCode();
	}
}
