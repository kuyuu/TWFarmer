package model;

import java.util.List;

public interface OrdersDAO {
	public abstract List<OrdersBean> select();
	public abstract OrdersBean select(int orderId);
	public abstract OrdersBean insert(OrdersBean ordersBean);
	public abstract OrdersBean update(OrdersBean ordersBean);
	public abstract boolean delete(int orderId);
	public abstract List<OrdersBean> findSellerAllList(int sellerID);
	public abstract List<OrdersBean> findBuyerAllList(int buyerId);
}
