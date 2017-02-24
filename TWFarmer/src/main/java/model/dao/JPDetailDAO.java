package model.dao;

import java.util.List;

import model.bean.JPDetailBean;

public interface JPDetailDAO {
	public abstract JPDetailBean select(int jpId, int productId);
	public abstract List<JPDetailBean> selectByJpId(int jpId);
	public abstract List<JPDetailBean> selectByProductId(int productId);
	public abstract List<JPDetailBean> select();
	public abstract JPDetailBean insert(JPDetailBean jpDetailBean);
	public abstract JPDetailBean update(JPDetailBean bean);
	public abstract boolean delete(int jpId, int productId);
	public abstract boolean deleteByJpId(int jpId);
	public abstract boolean deleteByProductId(int productId);
	
}
