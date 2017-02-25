package model.bean;

import model.daojdbc.ProductDAOjdbc;
public class OrderDetailBean {
	
	ProductDAOjdbc productDAO = new ProductDAOjdbc();
	private int orderId;
	private int productId;
	private String unit;
	private int unitPrice;
	private int orderQuantity;
	private int unitFreight;
	private ProductBean productBean;
	
	@Override
	public String toString() {
		return "OrderDetailBean [orderId=" + orderId + ", productId=" + productId + ", unitId=" + unit
				+ ", unitPrice=" + unitPrice + ", orderQuantity=" + orderQuantity + ", unitFreight=" + unitFreight
				+ "]";
	}

	public OrderDetailBean(int orderId, int productId, String unit, int unitPrice, int orderQuantity, int unitFreight) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.unit = unit;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
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

	public ProductBean getProductBean() {
		return productDAO.select(productId);
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	
}