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
	private int ProductId;
	private int SellerId;
	private String Origin;
	private String ProductName;
	private int Inventory;
	private int Price;
	private int UnitId;
	private int ProductTypeId;
	private String ProductIntro;
	private int Freight;
	private Date AddDate;
	private Date RemoveEstDate;
	private Date RemoveDate;
	private int ProductStatusId;
	private static SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof ProductBean)) {
			ProductBean temp = (ProductBean) obj;
			if(this.ProductId == temp.ProductId) {
				return true;
			}
		}
		return false;
	}
	public String toString() {
		return "{"+ProductId+":"+SellerId+":"+Origin+":"+ProductName+":"+Inventory+
				":"+Price+":"+UnitId+":"+ProductTypeId+":"+ProductIntro+":"+Freight+":"+AddDate+":"+RemoveEstDate+""
						+ ":"+ProductStatusId+" }";
	}
	
	
	public int getProductId() {
		return ProductId;
	}
	public void setProductId(int productId) {
		ProductId = productId;
	}
	public int getSellerId() {
		return SellerId;
	}
	public void setSellerId(int sellerId) {
		SellerId = sellerId;
	}
	public String getOrigin() {
		return Origin;
	}
	public void setOrigin(String origin) {
		Origin = origin;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getInventory() {
		return Inventory;
	}
	public void setInventory(int inventory) {
		Inventory = inventory;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getUnitId() {
		return UnitId;
	}
	public void setUnitId(int unitId) {
		UnitId = unitId;
	}
	public int getProductTypeId() {
		return ProductTypeId;
	}
	public void setProductTypeId(int productTypeId) {
		ProductTypeId = productTypeId;
	}
	public String getProductIntro() {
		return ProductIntro;
	}
	public void setProductIntro(String productIntro) {
		ProductIntro = productIntro;
	}
	public int getFreight() {
		return Freight;
	}
	public void setFreight(int freight) {
		Freight = freight;
	}
	public Date getAddDate() {
		return AddDate;
	}
	public void setAddDate(Date addDate) {
		AddDate = addDate;
	}
	public Date getRemoveEstDate() {
		return RemoveEstDate;
	}
	public void setRemoveEstDate(Date removeEstDate) {
		RemoveEstDate = removeEstDate;
	}
	public Date getRemoveDate() {
		return RemoveDate;
	}
	public void setRemoveDate(Date removeDate) {
		RemoveDate = removeDate;
	}
	public int getProductStatusId() {
		return ProductStatusId;
	}
	public void setProductStatusId(int productStatusId) {
		ProductStatusId = productStatusId;
	}
	
	
}
