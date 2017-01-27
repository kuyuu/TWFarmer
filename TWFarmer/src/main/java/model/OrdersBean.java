package model;
import java.util.Date;

public class OrdersBean {
	private int OrderId;
	private int SellerId;
	private int BuyerId;
	private int TotalFreight;
	private int TotalPrice;
	private Date OrderDate ;
	private Date ShipDate;
	private String ShipName;
	private String ShipPostalCode;
	private String ShipDistrict;
	private String ShipAddress;
	private int OrderStatusId;
	private int RatingBuyer;
	private int RatingSeller;
	
	@Override
	public String toString() {
		return "OrdersBean [OrderId=" + OrderId + ", SellerId=" + SellerId + ", BuyerId=" + BuyerId + ", TotalFreight="
				+ TotalFreight + ", TotalPrice=" + TotalPrice + ", OrderDate=" + OrderDate + ", ShipDate=" + ShipDate
				+ ", ShipName=" + ShipName + ", ShipPostalCode=" + ShipPostalCode + ", ShipDistrict=" + ShipDistrict
				+ ", ShipAddress=" + ShipAddress + ", OrderStatusId=" + OrderStatusId + ", RatingBuyer=" + RatingBuyer
				+ ", RatingSeller=" + RatingSeller + "]";
	}

	public OrdersBean(){
	}
	
	public OrdersBean(int orderId, int sellerId, int buyerId, int totalFreight, int totalPrice, Date orderDate,
			Date shipDate, String shipName, String shipPostalCode, String shipDistrict, String shipAddress,
			int orderStatusId, int ratingBuyer, int ratingSeller) {
		super();
		this.OrderId = orderId;
		this.SellerId = sellerId;
		this.BuyerId = buyerId;
		this.TotalFreight = totalFreight;
		this.TotalPrice = totalPrice;
		this.OrderDate = orderDate;
		this.ShipDate = shipDate;
		this.ShipName = shipName;
		this.ShipPostalCode = shipPostalCode;
		this.ShipDistrict = shipDistrict;
		this.ShipAddress = shipAddress;
		this.OrderStatusId = orderStatusId;
		this.RatingBuyer = ratingBuyer;
		this.RatingSeller = ratingSeller;
	}

	public int getOrderId() {
		return OrderId;
	}

	public void setOrderId(int orderId) {
		this.OrderId = orderId;
	}

	public int getSellerId() {
		return SellerId;
	}

	public void setSellerId(int sellerId) {
		this.SellerId = sellerId;
	}

	public int getBuyerId() {
		return BuyerId;
	}

	public void setBuyerId(int buyerId) {
		this.BuyerId = buyerId;
	}

	public int getTotalFreight() {
		return TotalFreight;
	}

	public void setTotalFreight(int totalFreight) {
		this.TotalFreight = totalFreight;
	}

	public int getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.TotalPrice = totalPrice;
	}

	public Date getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.OrderDate = orderDate;
	}

	public Date getShipDate() {
		return ShipDate;
	}

	public void setShipDate(Date shipDate) {
		this.ShipDate = shipDate;
	}

	public String getShipName() {
		return ShipName;
	}

	public void setShipName(String shipName) {
		this.ShipName = shipName;
	}

	public String getShipPostalCode() {
		return ShipPostalCode;
	}

	public void setShipPostalCode(String shipPostalCode) {
		this.ShipPostalCode = shipPostalCode;
	}

	public String getShipDistrict() {
		return ShipDistrict;
	}

	public void setShipDistrict(String shipDistrict) {
		this.ShipDistrict = shipDistrict;
	}

	public String getShipAddress() {
		return ShipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.ShipAddress = shipAddress;
	}

	public int getOrderStatusId() {
		return OrderStatusId;
	}

	public void setOrderStatusId(int orderStatusId) {
		this.OrderStatusId = orderStatusId;
	}

	public int getRatingBuyer() {
		return RatingBuyer;
	}

	public void setRatingBuyer(int ratingBuyer) {
		this.RatingBuyer = ratingBuyer;
	}

	public int getRatingSeller() {
		return RatingSeller;
	}

	public void setRatingSeller(int ratingSeller) {
		this.RatingSeller = ratingSeller;
	}
	
	
}
