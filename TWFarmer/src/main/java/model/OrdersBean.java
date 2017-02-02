package model;
import java.util.Date;

public class OrdersBean {
	private int orderId;
	private int sellerId;
	private int buyerId;
	private int totalFreight;
	private int totalPrice;
	private Date orderDate ;
	private Date shipDate;
	private String shipName;
	private String shipPostalCode;
	private String shipDistrict;
	private String shipAddress;
	private int orderStatusId;
	private int ratingBuyer;
	private int ratingSeller;
	
	@Override
	public String toString() {
		return "OrdersBean [orderId=" + orderId + ", sellerId=" + sellerId + ", buyerId=" + buyerId + ", totalFreight="
				+ totalFreight + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", shipDate=" + shipDate
				+ ", shipName=" + shipName + ", shipPostalCode=" + shipPostalCode + ", shipDistrict=" + shipDistrict
				+ ", shipAddress=" + shipAddress + ", orderStatusId=" + orderStatusId + ", ratingBuyer=" + ratingBuyer
				+ ", ratingSeller=" + ratingSeller + "]";
	}

	public OrdersBean(int orderId, int sellerId, int buyerId, int totalFreight, int totalPrice, Date orderDate,
			Date shipDate, String shipName, String shipPostalCode, String shipDistrict, String shipAddress,
			int orderStatusId, int ratingBuyer, int ratingSeller) {
		super();
		this.orderId = orderId;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.totalFreight = totalFreight;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.shipDate = shipDate;
		this.shipName = shipName;
		this.shipPostalCode = shipPostalCode;
		this.shipDistrict = shipDistrict;
		this.shipAddress = shipAddress;
		this.orderStatusId = orderStatusId;
		this.ratingBuyer = ratingBuyer;
		this.ratingSeller = ratingSeller;
	}

	public OrdersBean() {
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public int getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}

	public int getTotalFreight() {
		return totalFreight;
	}

	public void setTotalFreight(int totalFreight) {
		this.totalFreight = totalFreight;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getShipDate() {
		return shipDate;
	}

	public void setShipDate(Date shipDate) {
		this.shipDate = shipDate;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getShipPostalCode() {
		return shipPostalCode;
	}

	public void setShipPostalCode(String shipPostalCode) {
		this.shipPostalCode = shipPostalCode;
	}

	public String getShipDistrict() {
		return shipDistrict;
	}

	public void setShipDistrict(String shipDistrict) {
		this.shipDistrict = shipDistrict;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public int getOrderStatusId() {
		return orderStatusId;
	}

	public void setOrderStatusId(int orderStatusId) {
		this.orderStatusId = orderStatusId;
	}

	public int getRatingBuyer() {
		return ratingBuyer;
	}

	public void setRatingBuyer(int ratingBuyer) {
		this.ratingBuyer = ratingBuyer;
	}

	public int getRatingSeller() {
		return ratingSeller;
	}

	public void setRatingSeller(int ratingSeller) {
		this.ratingSeller = ratingSeller;
	}
	
}
