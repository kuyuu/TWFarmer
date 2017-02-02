package model;

public class OrderDetailBean {
	private int orderId;
	private int productId;
	private int unitId;
	private int unitPrice;
	private int orderQuantity;
	private int unitFreight;
	
	@Override
	public String toString() {
		return "OrderDetailBean [orderId=" + orderId + ", productId=" + productId + ", unitId=" + unitId
				+ ", unitPrice=" + unitPrice + ", orderQuantity=" + orderQuantity + ", unitFreight=" + unitFreight
				+ "]";
	}

	public OrderDetailBean(int orderId, int productId, int unitId, int unitPrice, int orderQuantity, int unitFreight) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.unitId = unitId;
		this.unitPrice = unitPrice;
		this.orderQuantity = orderQuantity;
		this.unitFreight = unitFreight;
	}

	public OrderDetailBean() {
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public int getUnitFreight() {
		return unitFreight;
	}

	public void setUnitFreight(int unitFreight) {
		this.unitFreight = unitFreight;
	}
	
}