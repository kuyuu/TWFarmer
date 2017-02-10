package model;

import java.util.List;

public interface ProductDiscountDAO {

		public abstract ProductDiscountBean select(int  discountId);

		public abstract List<ProductDiscountBean> select();

		public abstract ProductDiscountBean insert(ProductDiscountBean bean);

		public abstract ProductDiscountBean update(ProductDiscountBean bean);
		
		public abstract boolean delete(int  discountId);

		List<ProductDiscountBean> selectByProductId(int productId);

}
