package model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ProductDAO {
	public abstract ProductBean select(int productId);

	public abstract List<ProductBean> select();

	public abstract List<ProductBean> selectByName(String name);

	public abstract List<ProductBean> selectByType(int productTypeId);
	
	public abstract ProductBean insert(ProductBean bean);

	public abstract ProductBean update(ProductBean bean);

	public abstract boolean delete(int productId);

	List<ProductBean> selectBySellerId(int sellerId);

	Map<JPDetailBean, ProductBean> selectByJpId(int jpId);
}
