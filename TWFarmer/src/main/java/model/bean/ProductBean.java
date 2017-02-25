package model.bean;

import java.text.SimpleDateFormat;

import model.daojdbc.MemberDAOJdbc;

public class ProductBean {
	MemberDAOJdbc memberDAO = new MemberDAOJdbc();
	private int productId;
	private int sellerId;
	private String origin;
	private String productName;
	private int inventory;
	private int price;
	private String unit;
	private String productTypeName;
	private String productIntro;
	private int freight;
	private java.util.Date addDate;
	private java.util.Date removeEstDate;
	private java.util.Date removeDate;
	// private int productStatusId;
	private String productStatusName;
	private static SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private MemberBean memberBean;

	@Override
	public boolean equals(Object obj) {
		if (obj != null && (obj instanceof ProductBean)) {
			ProductBean temp = (ProductBean) obj;
			if (this.productId == temp.productId) {
				return true;
			}
		}
		return false;
	}

	public String toString() {
		return "{" + productId + ":" + sellerId + ":" + origin + ":" + productName + ":" + inventory + ":" + price + ":"
				+ unit + ":" + productTypeName + ":" + productIntro + ":" + freight + ":" + addDate + ":"
				+ removeEstDate + "" + ":" + removeDate + "" + ":" + productStatusName + "}";
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
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

	public String getProductStatusName() {
		return productStatusName;
	}

	public void setProductStatusName(String productStatusName) {
		this.productStatusName = productStatusName;
	}

	public MemberBean getMemberBean() {
		return memberDAO.select(sellerId);
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	// public int getProductStatusId() {
	// return productStatusId;
	// }
	//
	// public void setProductStatusId(int productStatusId) {
	// this.productStatusId = productStatusId;
	// }

	// public int getproductTypeId() {
	// return productTypeId;
	// }
	//
	// public void setproductTypeId(int productTypeId) {
	// this.productTypeId = productTypeId;
	// }

}
