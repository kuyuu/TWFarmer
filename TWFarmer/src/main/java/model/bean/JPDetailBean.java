package model.bean;

import java.io.Serializable;

import model.dao.ProductDAO;
import model.daojdbc.ProductDAOjdbc;

public class JPDetailBean implements Serializable {		

	private int jpId;
	private int productId;
	private int jpPopulationMin;
	private int jpPopulationMax;
	private int jpMinQEach;
	private int jpPrice;
	private int jpFreight;
	private String jpUnit;
	private String productName;
	
	@Override
	public boolean equals(Object obj) {
		if(obj!=null && (obj instanceof JPDetailBean)) {
			JPDetailBean temp = (JPDetailBean) obj;
			if(this.jpId == temp.jpId) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "{"+jpId+":"+productId+":"+ jpPopulationMin+":"+jpPopulationMax+":"+jpMinQEach+":"+jpPrice+":"+jpFreight+"}";
	}

	
	public int getJpId() {
		return jpId;
	}

	public void setJpId(int jpId) {
		this.jpId = jpId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getJpPopulationMin() {
		return jpPopulationMin;
	}

	public void setJpPopulationMin(int jpPopulationMin) {
		this.jpPopulationMin = jpPopulationMin;
	}

	public int getJpPopulationMax() {
		return jpPopulationMax;
	}

	public void setJpPopulationMax(int jpPopulationMax) {
		this.jpPopulationMax = jpPopulationMax;
	}

	public int getJpMinQEach() {
		return jpMinQEach;
	}

	public void setJpMinQEach(int jpMinQEach) {
		this.jpMinQEach = jpMinQEach;
	}

	public int getJpPrice() {
		return jpPrice;
	}

	public void setJpPrice(int jpPrice) {
		this.jpPrice = jpPrice;
	}

	public int getJpFreight() {
		return jpFreight;
	}

	public void setJpFreight(int jpFreight) {
		this.jpFreight = jpFreight;
	}

	public String getProductName() {
		ProductDAO dao = new ProductDAOjdbc();
		return dao.select(productId).getProductName();
	}

	public String getJpUnit() {
		return jpUnit;
	}

	public void setJpUnit(String jpUnit) {
		this.jpUnit = jpUnit;
	}
	
}
