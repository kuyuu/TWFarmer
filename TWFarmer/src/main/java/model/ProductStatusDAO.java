package model;

import java.util.List;

public interface ProductStatusDAO {
	public abstract ProductStatusBean select(int productStatusId);

	public abstract List<ProductStatusBean> select();

	public abstract ProductStatusBean insert(ProductStatusBean bean);

	public abstract ProductStatusBean update(ProductStatusBean bean);

	public abstract boolean delete(int productStatusId);
}
