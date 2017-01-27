package model;

public class OrderDetailBean {
	private int OrderId;
	private int ProductId;
	private int UnitId;
	private int UnitPrice;
	private int OrderQuantity;
	private int UnitFreight;
	
	@Override
	public String toString() {
		return "OrderDetailBean [OrderId=" + OrderId + ", ProductId=" + ProductId + ", UnitId=" + UnitId
				+ ", UnitPrice=" + UnitPrice + ", OrderQuantity=" + OrderQuantity + ", UnitFreight=" + UnitFreight
				+ "]";
	}

	public OrderDetailBean(int orderId, int productId, int unitId, int unitPrice, int orderQuantity, int unitFreight) {
		this.OrderId = orderId;
		this.ProductId = productId;
		this.UnitId = unitId;
		this.UnitPrice = unitPrice;
		this.OrderQuantity = orderQuantity;
		this.UnitFreight = unitFreight;
	}

	public OrderDetailBean() {
	}

	public int getOrderId() {
		return OrderId;
	}

	public void setOrderId(int orderId) {
		this.OrderId = orderId;
	}

	public int getProductId() {
		return ProductId;
	}

	public void setProductId(int productId) {
		this.ProductId = productId;
	}

	public int getUnitId() {
		return UnitId;
	}

	public void setUnitId(int unitId) {
		this.UnitId = unitId;
	}

	public int getUnitPrice() {
		return UnitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.UnitPrice = unitPrice;
	}

	public int getOrderQuantity() {
		return OrderQuantity;
	}

	public void setOrderQuantity(int orderQuantity) {
		this.OrderQuantity = orderQuantity;
	}

	public int getUnitFreight() {
		return UnitFreight;
	}

	public void setUnitFreight(int unitFreight) {
		this.UnitFreight = unitFreight;
	}
	
	
	
}