package model.dao;

import java.util.List;

import model.bean.ProductStatusBean;

public interface ProductStatusDAO {
	public abstract ProductStatusBean select(int productStatusId);

	public abstract List<ProductStatusBean> select();

	public abstract ProductStatusBean insert(ProductStatusBean bean);

	public abstract ProductStatusBean update(ProductStatusBean bean);

	public abstract boolean delete(int productStatusId);
}
