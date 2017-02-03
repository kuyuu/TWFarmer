package model;

import java.util.List;

public interface ProductPicDAO {
	public abstract ProductPicBean select(int productPicId);
	public abstract List<ProductPicBean> select();
	public abstract ProductPicBean insert(ProductPicBean productPicBean);
	public abstract ProductPicBean update(ProductPicBean productPicBean);
	public abstract boolean delete(int productPicId);
	List<ProductPicBean> selectByProductId(int productId);
}
