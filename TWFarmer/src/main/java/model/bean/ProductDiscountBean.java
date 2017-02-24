package model.bean;

import java.io.Serializable;

public class ProductDiscountBean implements Serializable {
	
	int discountId;
	int productId;
	int minThreshold;
	int maxThreshold;
	int discountPrice;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof ProductDiscountBean)) {
			ProductDiscountBean temp = (ProductDiscountBean) obj;
			if(this.discountId == temp.discountId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+discountId+":"+productId+":"+minThreshold+":"+maxThreshold+":"+discountPrice+"}";
	}
	
	public int getDiscountId() {
		return discountId;
	}

	public void setDiscountId(int discountId) {
		this.discountId = discountId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getMinThreshold() {
		return minThreshold;
	}

	public void setMinThreshold(int minThreshold) {
		this.minThreshold = minThreshold;
	}

	public int getMaxThreshold() {
		return maxThreshold;
	}

	public void setMaxThreshold(int maxThreshold) {
		this.maxThreshold = maxThreshold;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

}
