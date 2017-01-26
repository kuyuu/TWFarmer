package model;

public class ProductDiscountBean {
//	DiscountID int IDENTITY(2301,1) NOT NULL PRIMARY KEY,
//	ProductID int REFERENCES Product(ProductID) NOT NULL,
//	MinThreshold int,
//	MaxThreshold int,
//	DiscountPrice int,
	private int DiscountId;
	private int ProductId;
	private int MinThreshold;
	private int MaxThreshold;
	private int DiscountPrice;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof ProductDiscountBean)) {
			ProductDiscountBean temp = (ProductDiscountBean) obj;
			if(this.DiscountId == temp.DiscountId) {
				return true;
			}
		}
		return false;
	}
	public String toString() {
		return "{"+DiscountId+":"+ProductId+":"+MinThreshold+":"+MaxThreshold+":"+DiscountPrice+"}";
	}
	
	
	public int getDiscountId() {
		return DiscountId;
	}
	public void setDiscountId(int discountId) {
		DiscountId = discountId;
	}
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public int getMinThreshold() {
		return MinThreshold;
	}
	public void setMinThreshold(int minThreshold) {
		MinThreshold = minThreshold;
	}
	public int getMaxThreshold() {
		return MaxThreshold;
	}
	public void setMaxThreshold(int maxThreshold) {
		MaxThreshold = maxThreshold;
	}
	public int getDiscountPrice() {
		return DiscountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		DiscountPrice = discountPrice;
	}
}
