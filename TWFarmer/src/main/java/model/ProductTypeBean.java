package model;

public class ProductTypeBean {
	//ProductTypeID int IDENTITY(2101,1) NOT NULL PRIMARY KEY,
	//Type nvarchar(10),
	
	private int ProductTypeId;
	private String Type;
	public int getProductTypeId() {
		return ProductTypeId;
	}
	public void setProductTypeId(int productTypeId) {
		ProductTypeId = productTypeId;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	
}
