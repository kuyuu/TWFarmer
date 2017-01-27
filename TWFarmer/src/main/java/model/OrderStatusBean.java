package model;

public class OrderStatusBean {
	private int OrderStatusId;
	private String OrderStatusName;
	
	@Override
	public String toString() {
		return "OrderStatusBean [OrderStatusId=" + OrderStatusId + ", OrderStatusName=" + OrderStatusName + "]";
	}

	public OrderStatusBean(int orderStatusId, String orderStatusName) {
		super();
		OrderStatusId = orderStatusId;
		OrderStatusName = orderStatusName;
	}

	public OrderStatusBean(){
		
	}

	public int getOrderStatusId() {
		return OrderStatusId;
	}

	public void setOrderStatusId(int orderStatusId) {
		this.OrderStatusId = orderStatusId;
	}

	public String getOrderStatusName() {
		return OrderStatusName;
	}

	public void setOrderStatusName(String orderStatusName) {
		this.OrderStatusName = orderStatusName;
	}
	
	
}
