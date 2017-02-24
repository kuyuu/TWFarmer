package model.dao;

import java.util.List;

import model.bean.ProductTypeBean;

public interface ProductTypeDAO {
	public abstract ProductTypeBean select(int productTypeId);

	public abstract List<ProductTypeBean> select();

	public abstract ProductTypeBean insert(ProductTypeBean bean);

	public abstract ProductTypeBean update(ProductTypeBean bean
			);

	public abstract boolean delete(int productTypeId);
}
