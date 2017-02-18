package model;

import java.util.List;
import java.util.Map;

public interface ProductDAO {
	public abstract ProductBean select(int productId);

	public abstract List<ProductBean> select();

	public abstract Map<ProductBean, List<ProductPicBean>> selectByName(String keyword);

	public abstract Map<ProductBean, List<ProductPicBean>> selectByType(String type);
	
	public abstract Map<ProductBean, List<ProductPicBean>> selectByTypeAndName(String type, String keyword);
	
	public abstract Map<ProductBean, List<QnABean>> selectQna(int sellerId);
	
	public abstract ProductBean insert(ProductBean bean);

	public abstract ProductBean update(ProductBean bean);

	public abstract boolean delete(int productId);

	List<ProductBean> selectBySellerId(int sellerId);

	Map<JPDetailBean, ProductBean> selectByJpId(int jpId);

	Map<ProductBean, List<ProductPicBean>> selectBySellerIdWithPic(int sellerId);
	
}
