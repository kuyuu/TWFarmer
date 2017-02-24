package model.bean;

public class OrderStatusBean {
	private int orderStatusId;
	private String orderStatusName;
	
	@Override
	public String toString() {
		return "OrderStatusBean [orderStatusId=" + orderStatusId + ", orderStatusName=" + orderStatusName + "]";
	}

	public OrderStatusBean(int orderStatusId, String orderStatusName) {
		super();
		this.orderStatusId = orderStatusId;
		this.orderStatusName = orderStatusName;
	}

	public OrderStatusBean() {
	}

	public int getOrderStatusId() {
		return orderStatusId;
	}

	public void setOrderStatusId(int orderStatusId) {
		this.orderStatusId = orderStatusId;
	}

	public String getOrderStatusName() {
		return orderStatusName;
	}

	public void setOrderStatusName(String orderStatusName) {
		this.orderStatusName = orderStatusName;
	}
	
	
}
