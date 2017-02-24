package model.dao;

import java.util.List;

import model.bean.OrderStatusBean;

public interface OrderStatusDAO {
	public abstract List<OrderStatusBean> select();
	public abstract OrderStatusBean select(int orderStatusId);
	public abstract OrderStatusBean insert(OrderStatusBean orderStatusBean);
	public abstract OrderStatusBean update(OrderStatusBean orderStatusBean);
	public abstract boolean delete(int orderStatusId);
}
