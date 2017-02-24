package model.bean;

public class ProductTypeBean {
	//ProductTypeID int IDENTITY(2101,1) NOT NULL PRIMARY KEY,
	//Type nvarchar(10),
	
	private int productTypeId;
	private String type;
	
	@Override
	public String toString() {
		return "{"+productTypeId+":"+type+"}";
	}
	
	
	public int getProductTypeId() {
		return productTypeId;
	}
	public void setProductTypeId(int productTypeId) {
		this.productTypeId = productTypeId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
