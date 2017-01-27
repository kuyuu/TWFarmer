package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductBean {
//	ProductID int IDENTITY(2001,1) NOT NULL PRIMARY KEY,
//	SellerID int REFERENCES Member (MemberID) NOT NULL,
//	Origin nvarchar(10),
//	ProductName nvarchar(40),
//	Inventory int,
//	Price int,
//	UnitID int REFERENCES Unit(UnitID),
//	ProductTypeID int REFERENCES ProductType(ProductTypeID),
//	ProductIntro nvarchar(600),
//	Freight int,
//	AddDate datetime,
//	RemoveEstDate datetime,
//	RemoveDate datetime,
//	ProductStatusID int REFERENCES ProductStatus(ProductStatusID),
	private int productId;
	private int sellerId;
	private String origin;
	private String productName;
	private int inventory;
	private int price;
	private int unitId;
	private int productTypeId;
	private String productIntro;
	private int freight;
	private java.util.Date addDate;
	private java.util.Date removeEstDate;
	private java.util.Date removeDate;
	private int productStatusId;
	private static SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
//	public boolean equals(Object obj) {
//		if(obj!=null && (obj instanceof ProductBean)) {
//			ProductBean temp = (ProductBean) obj;
//			if(this.ProductId == temp.ProductId) {
//				return true;
//			}
//		}
//		return false;
//	}
	public String toString() {
		return "{"+productId+":"+sellerId+":"+origin+":"+productName+":"+inventory+
				":"+price+":"+unitId+":"+productTypeId+":"+productIntro+":"+freight+":"+addDate+":"+removeEstDate+""
						+ ":"+removeDate+""
								+  ":"+productStatusId+"}";
	}
	
	
	
	
	
	
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}

	public int getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(int productTypeId) {
		this.productTypeId = productTypeId;
	}

	public String getProductIntro() {
		return productIntro;
	}

	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}

	public int getFreight() {
		return freight;
	}

	public void setFreight(int freight) {
		this.freight = freight;
	}

	public java.util.Date getAddDate() {
		return addDate;
	}

	public void setAddDate(java.util.Date addDate) {
		this.addDate = addDate;
	}

	public java.util.Date getRemoveEstDate() {
		return removeEstDate;
	}

	public void setRemoveEstDate(java.util.Date removeEstDate) {
		this.removeEstDate = removeEstDate;
	}

	public java.util.Date getRemoveDate() {
		return removeDate;
	}

	public void setRemoveDate(java.util.Date removeDate) {
		this.removeDate = removeDate;
	}

	public int getProductStatusId() {
		return productStatusId;
	}

	public void setProductStatusId(int productStatusId) {
		this.productStatusId = productStatusId;
	}

	
	
	

	
}
