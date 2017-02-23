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
	private int buyerOrderStatusId;
	private int sellerOrderStatusId;
	private int ratingBuyer;
	private int ratingSeller;
	private int remittance;
	private Date remittanceDate;
	private String remittanceBank;
	private String remittanceAcc;
	
	private String sellerOrderStatusName;
	
	@Override
	public String toString() {
		return "OrdersBean [orderId=" + orderId + ", sellerId=" + sellerId + ", buyerId=" + buyerId + ", totalFreight="
				+ totalFreight + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", shipDate=" + shipDate
				+ ", shipName=" + shipName + ", shipPostalCode=" + shipPostalCode + ", shipDistrict=" + shipDistrict
				+ ", shipAddress=" + shipAddress + ", buyerOrderStatusId=" + buyerOrderStatusId
				+ ", sellerOrderStatusId=" + sellerOrderStatusId + ", ratingBuyer=" + ratingBuyer + ", ratingSeller="
				+ ratingSeller + ", remittance=" + remittance + ", remittanceDate=" + remittanceDate
				+ ", remittanceBank=" + remittanceBank + ", remittanceAcc=" + remittanceAcc + ", orderStatusName="
				+ sellerOrderStatusName + "]";
	}

	public OrdersBean(int orderId, int sellerId, int buyerId, int totalFreight, int totalPrice, Date orderDate,
			Date shipDate, String shipName, String shipPostalCode, String shipDistrict, String shipAddress,
			int buyerOrderStatusId,int sellerOrderStatusId, int ratingBuyer, int ratingSeller) {
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
		this.buyerOrderStatusId = buyerOrderStatusId;
		this.sellerOrderStatusId= sellerOrderStatusId;
		this.ratingBuyer = ratingBuyer;
		this.ratingSeller = ratingSeller;
	}

	public int getSellerOrderStatusId() {
		return sellerOrderStatusId;
	}

	public void setSellerOrderStatusId(int sellerOrderStatusId) {
		this.sellerOrderStatusId = sellerOrderStatusId;
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

	public int getBuyerOrderStatusId() {
		return buyerOrderStatusId;
	}

	public void setBuyerOrderStatusId(int buyerOrderStatusId) {
		this.buyerOrderStatusId = buyerOrderStatusId;
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

	public int getRemittance() {
		return remittance;
	}

	public void setRemittance(int remittance) {
		this.remittance = remittance;
	}

	public Date getRemittanceDate() {
		return remittanceDate;
	}

	public void setRemittanceDate(Date remittanceDate) {
		this.remittanceDate = remittanceDate;
	}

	public String getRemittanceBank() {
		return remittanceBank;
	}

	public void setRemittanceBank(String remittanceBank) {
		this.remittanceBank = remittanceBank;
	}

	public String getRemittanceAcc() {
		return remittanceAcc;
	}

	public void setRemittanceAcc(String remittanceAcc) {
		this.remittanceAcc = remittanceAcc;
	}

	public void setSellerOrderStatusName(String sellerOrderStatusName) {
		this.sellerOrderStatusName = sellerOrderStatusName;
	}
	
	public String getSellerOrderStatusName() {
		return this.sellerOrderStatusName;
	}
	
//	public String getSellerOrderStatusName() {
//		SELECT  OrderStatusName FROM orderStatusName WHERE orderID = this.orderId
	
	
//	}
}
