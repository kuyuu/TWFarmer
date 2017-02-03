package model;

import java.util.List;

public interface OrderDetailDAO {
	public abstract OrderDetailBean select(int orderId, int productId);
	public abstract List<OrderDetailBean> select();
	public abstract List<OrderDetailBean> selectByOrderId(int orderId);
	public abstract List<OrderDetailBean> selectByProductId(int productId);
	public abstract OrderDetailBean insert(OrderDetailBean orderDetailBean);
	public abstract OrderDetailBean update(OrderDetailBean orderDetailBean);
	public abstract boolean deleteByOrderId(int orderId);
	public abstract boolean deleteByProductId(int productId);
}
