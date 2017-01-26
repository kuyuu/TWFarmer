package model;

import java.util.List;

public interface ProductDiscountDAO {
	public abstract ProductDiscountBean select(int DiscountId);
	public abstract List<ProductDiscountBean> select();
	public abstract ProductDiscountBean insert(ProductDiscountBean bean);
	public abstract ProductDiscountBean update(int DiscountId, int ProductId,
			int MinThreshold,int MaxThreshold,int DiscountPrice	);
	public abstract boolean delete(int DiscountId);
}
