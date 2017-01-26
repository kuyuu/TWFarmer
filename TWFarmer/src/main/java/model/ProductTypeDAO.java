package model;

import java.util.List;

public interface ProductTypeDAO {
	public abstract ProductTypeBean select(int ProductTypeId);

	public abstract List<ProductTypeBean> select();

	public abstract ProductTypeBean insert(ProductTypeBean bean);

	public abstract ProductTypeBean update(int ProductTypeId, String Type
			);

	public abstract boolean delete(int ProductTypeId);
}
