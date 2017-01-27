package model;

import java.util.List;

public interface OrderDetailDAO {
	public abstract List<OrderDetailBean> select();
	public abstract OrderDetailBean selectByOrderId(int orderId);
	public abstract OrderDetailBean selectByProductId(int productId);
	public abstract OrderDetailBean insert(OrderDetailBean orderDetailBean);
	public abstract OrderDetailBean update(OrderDetailBean orderDetailBean);
	public abstract boolean deleteByOrderId(int orderId);
	public abstract boolean deleteByProductId(int productId);
}
