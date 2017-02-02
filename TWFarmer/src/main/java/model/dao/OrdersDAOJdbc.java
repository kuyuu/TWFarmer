package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.OrdersBean;
import model.OrdersDAO;

public class OrdersDAOJdbc implements OrdersDAO{
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";
	
	public static void main(String[] args) {
		OrdersDAO dao = new OrdersDAOJdbc();
		
		//Select all
//		List<OrdersBean> beans = dao.select();
//		System.out.println("bean="+beans);

		//Select By ID
		System.out.println(dao.select(3001));
		
		//Insert
//		OrdersBean bean = new OrdersBean();
//
//		bean.setSellerId(1002);
//		bean.setBuyerId(1004);
//		bean.setTotalFreight(200);
//		bean.setTotalPrice(1000);
//		bean.setOrderDate(java.sql.Timestamp.valueOf("2017-01-23 09:07:43"));
//		bean.setShipDate(java.sql.Timestamp.valueOf("2017-01-25 13:27:03"));
//		bean.setShipName("會員B");
//		bean.setShipPostalCode("106");
//		bean.setShipDistrict("台北市大安區");
//		bean.setShipAddress("會員B的家");
//		bean.setOrderStatusId(3103);
////		bean.setRatingBuyer();
////		bean.setRatingSeller();
//		dao.insert(bean);
//		System.out.println(bean);
		
		//Update
//		OrdersBean bean2 = dao.select(3004);
//		bean2.setSellerId(1001);
//		bean2.setBuyerId(1003);
//		bean2.setTotalFreight(200);
//		bean2.setTotalPrice(1000);
//		bean2.setOrderDate(java.sql.Timestamp.valueOf("2017-01-23 09:07:43"));
//		bean2.setShipDate(java.sql.Timestamp.valueOf("2017-01-25 13:27:03"));
//		bean2.setShipName("會員B");
//		bean2.setShipPostalCode("235");
//		bean2.setShipDistrict("台北市大安區");
//		bean2.setShipAddress("會員B的家");
//		bean2.setOrderStatusId(3103);
//		bean2.setRatingBuyer(5);
//		bean2.setRatingSeller(5);	
//		System.out.println(bean2);
		
		//Delete
//		dao.delete(3004);
		
	}

	private static final String SELECT_ALL ="SELECT * FROM Orders";
	@Override
	public List<OrdersBean> select() {
		List<OrdersBean> result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<OrdersBean>();
			while(rset.next()) {
				OrdersBean bean = new OrdersBean();
				bean.setOrderId(rset.getInt("orderId"));
				bean.setSellerId(rset.getInt("sellerId"));
				bean.setBuyerId(rset.getInt("buyerId"));
				bean.setTotalFreight(rset.getInt("totalFreight"));
				bean.setTotalPrice(rset.getInt("totalPrice"));
				bean.setOrderDate(rset.getDate("orderDate"));
				bean.setShipDate(rset.getDate("shipDate"));
				bean.setShipName(rset.getString("shipName"));
				bean.setShipPostalCode(rset.getString("shipPostalCode"));
				bean.setShipDistrict(rset.getString("shipDistrict"));
				bean.setShipAddress(rset.getString("shipAddress"));
				bean.setOrderStatusId(rset.getInt("orderStatusId"));
				bean.setRatingBuyer(rset.getInt("ratingBuyer"));
				bean.setRatingSeller(rset.getInt("ratingSeller"));
				
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_ID =
			"SELECT * FROM Orders where OrderID=?";
	@Override
	public OrdersBean select(int orderID) {
		OrdersBean result = null;
		ResultSet rset = null;
		try(
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, orderID);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new OrdersBean();
				result.setOrderId(rset.getInt("orderId"));
				result.setSellerId(rset.getInt("sellerId"));
				result.setBuyerId(rset.getInt("buyerId"));
				result.setTotalFreight(rset.getInt("totalFreight"));
				result.setTotalPrice(rset.getInt("totalPrice"));
				result.setOrderDate(rset.getDate("orderDate"));
				result.setShipDate(rset.getDate("shipDate"));
				result.setShipName(rset.getString("shipName"));
				result.setShipPostalCode(rset.getString("shipPostalCode"));
				result.setShipDistrict(rset.getString("shipDistrict"));
				result.setShipAddress(rset.getString("shipAddress"));
				result.setOrderStatusId(rset.getInt("orderStatusId"));
				result.setRatingBuyer(rset.getInt("ratingBuyer"));
				result.setRatingSeller(rset.getInt("ratingSeller"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	private static final String INSERT =
			"INSERT INTO Orders (SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, OrderStatusID, RatingBuyer, RatingSeller) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	@Override
	public OrdersBean insert(OrdersBean ordersBean) {
		OrdersBean result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(ordersBean!=null) {
				stmt.setInt(1,ordersBean.getSellerId());
				stmt.setInt(2,ordersBean.getBuyerId());
				stmt.setInt(3,ordersBean.getTotalFreight());
				stmt.setInt(4,ordersBean.getTotalPrice());
				java.util.Date orderDate = ordersBean.getOrderDate();
				if(orderDate!=null) {
					long time = orderDate.getTime();
					stmt.setDate(5, new java.sql.Date(time));
				} else {
					stmt.setDate(5, null);				
				}java.util.Date shipDate = ordersBean.getShipDate();
				if(shipDate!=null) {
					long time = shipDate.getTime();
					stmt.setDate(6, new java.sql.Date(time));
				} else {
					stmt.setDate(6, null);				
				}
				
				stmt.setString(7,ordersBean.getShipName());
				stmt.setString(8,ordersBean.getShipPostalCode());
				stmt.setString(9,ordersBean.getShipDistrict());
				stmt.setString(10,ordersBean.getShipAddress());
				stmt.setInt(11, ordersBean.getOrderStatusId());
				stmt.setInt(12,ordersBean.getRatingBuyer());
				stmt.setInt(13,ordersBean.getRatingSeller());
				
				int i = stmt.executeUpdate();
				if(i==1) {
					result = ordersBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	private static final String UPDATE =
			"UPDATE Orders set SellerID=?, BuyerID=?, TotalFreight=?, TotalPrice=?, OrderDate=?, ShipDate=?, ShipName=?, ShipPostalCode=?, ShipDistrict=?, ShipAddress=?, OrderStatusID=?, RatingBuyer=?, RatingSeller=? WHERE id=?";
	@Override
	public OrdersBean update(OrdersBean ordersBean) {
		OrdersBean result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1,ordersBean.getSellerId());
			stmt.setInt(2,ordersBean.getBuyerId());
			stmt.setInt(3,ordersBean.getTotalFreight());
			stmt.setInt(4,ordersBean.getTotalPrice());
			java.util.Date orderDate = ordersBean.getOrderDate();
			if(orderDate!=null) {
				long time = orderDate.getTime();
				stmt.setDate(5, new java.sql.Date(time));
			} else {
				stmt.setDate(5, null);				
			}java.util.Date shipDate = ordersBean.getShipDate();
			if(shipDate!=null) {
				long time = shipDate.getTime();
				stmt.setDate(6, new java.sql.Date(time));
			} else {
				stmt.setDate(6, null);				
			}
			
			stmt.setString(7,ordersBean.getShipName());
			stmt.setString(8,ordersBean.getShipPostalCode());
			stmt.setString(9,ordersBean.getShipDistrict());
			stmt.setString(10,ordersBean.getShipAddress());
			stmt.setInt(11, ordersBean.getOrderStatusId());
			stmt.setInt(12,ordersBean.getRatingBuyer());
			stmt.setInt(13,ordersBean.getRatingSeller());
			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(ordersBean.getOrderId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE =
			"DELETE FROM Orders WHERE OrderID = ?";
	@Override
	public boolean delete(int orderID) {
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, orderID);
			int i = stmt.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
