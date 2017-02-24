package model.dao;

import java.util.List;

import model.bean.ProductDiscountBean;

public interface ProductDiscountDAO {

		public abstract ProductDiscountBean select(int  discountId);

		public abstract List<ProductDiscountBean> select();

		public abstract ProductDiscountBean insert(ProductDiscountBean bean);

		public abstract ProductDiscountBean update(ProductDiscountBean bean);
		
		public abstract boolean delete(int  discountId);
		
		public abstract boolean deleteByProductId(int productId);

		List<ProductDiscountBean> selectByProductId(int productId);

}
