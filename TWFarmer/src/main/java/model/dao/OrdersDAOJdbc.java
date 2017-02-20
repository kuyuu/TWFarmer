package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.OrdersBean;
import model.OrdersDAO;

public class OrdersDAOJdbc implements OrdersDAO {
	// private static final String URL =
	// "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	// private static final String USERNAME = "sa";
	// private static final String PASSWORD = "P@ssw0rd";
	DataSource dataSource;

	public OrdersDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SELECT_ALL = "SELECT * FROM Orders";

	@Override
	public List<OrdersBean> select() {
		List<OrdersBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<OrdersBean>();
			while (rset.next()) {
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
				bean.setBuyerOrderStatusId(rset.getInt("buyerOrderStatusId"));
				bean.setSellerOrderStatusId(rset.getInt("sellerOrderStatusId"));
				bean.setRatingBuyer(rset.getInt("ratingBuyer"));
				bean.setRatingSeller(rset.getInt("ratingSeller"));
				bean.setRemittance(rset.getInt("remittance"));
				bean.setRemittanceDate(rset.getDate("remittanceDate"));
				bean.setRemittanceBank(rset.getString("remittanceBank"));
				bean.setRemittanceAcc(rset.getString("remittanceAcc"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_ID = "SELECT * FROM Orders where OrderID=?";

	@Override
	public OrdersBean select(int orderID) {
		OrdersBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, orderID);
			rset = stmt.executeQuery();
			if (rset.next()) {
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
				result.setBuyerOrderStatusId(rset.getInt("buyerOrderStatusId"));
				result.setSellerOrderStatusId(rset.getInt("sellerOrderStatusId"));
				result.setRatingBuyer(rset.getInt("ratingBuyer"));
				result.setRatingSeller(rset.getInt("ratingSeller"));
				result.setRemittance(rset.getInt("remittance"));
				result.setRemittanceDate(rset.getDate("remittanceDate"));
				result.setRemittanceBank(rset.getString("remittanceBank"));
				result.setRemittanceAcc(rset.getString("remittanceAcc"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	private static final String INSERT = "INSERT INTO Orders (SellerID, BuyerID, TotalFreight, TotalPrice, OrderDate, ShipDate, ShipName, ShipPostalCode, ShipDistrict, ShipAddress, BuyerOrderStatusId, SellerOrderStatusId, RatingBuyer, RatingSeller, Remittance, RemittanceDate, RemittanceBank, RemittanceAcc) values ( ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	
	@Override
	public OrdersBean insert(OrdersBean ordersBean) {
		OrdersBean result = null;
		// 此處也要加入(Statement.RETURN_GENERATED_KEYS)才能跑
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS);) {
			if (ordersBean != null) {
				stmt.setInt(1, ordersBean.getSellerId());
				stmt.setInt(2, ordersBean.getBuyerId());
				stmt.setInt(3, ordersBean.getTotalFreight());
				stmt.setInt(4, ordersBean.getTotalPrice());
				java.util.Date orderDate = ordersBean.getOrderDate();
				if (orderDate != null) {
					long time = orderDate.getTime();
					stmt.setDate(5, new java.sql.Date(time));
				} else {
					stmt.setDate(5, null);
				}
				java.util.Date shipDate = ordersBean.getShipDate();
				if (shipDate != null) {
					long time = shipDate.getTime();
					stmt.setDate(6, new java.sql.Date(time));
				} else {
					stmt.setDate(6, null);
				}

				stmt.setString(7, ordersBean.getShipName());
				stmt.setString(8, ordersBean.getShipPostalCode());
				stmt.setString(9, ordersBean.getShipDistrict());
				stmt.setString(10, ordersBean.getShipAddress());
				stmt.setInt(11, ordersBean.getBuyerOrderStatusId());
				stmt.setInt(12, ordersBean.getSellerOrderStatusId());
				stmt.setInt(13, ordersBean.getRatingBuyer());
				stmt.setInt(14, ordersBean.getRatingSeller());
				stmt.setInt(15, ordersBean.getRemittance());
				Date remittanceDate = ordersBean.getRemittanceDate();
				if (remittanceDate != null) {
					long time = remittanceDate.getTime();
					stmt.setDate(16, new java.sql.Date(time));
				} else {
					stmt.setDate(16, null);
				}
				stmt.setString(17, ordersBean.getRemittanceBank());
				stmt.setString(18, ordersBean.getRemittanceAcc());

				int i = stmt.executeUpdate();
				if (i == 1) {
					// 叫出流水號的寫法 給子table
					ResultSet resultSet = stmt.getGeneratedKeys();
					if (resultSet.next()) {
						ordersBean.setOrderId(resultSet.getInt(1));
					}
					result = ordersBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "UPDATE Orders set SellerID=?, BuyerID=?, TotalFreight=?, TotalPrice=?, OrderDate=?, ShipDate=?, ShipName=?, ShipPostalCode=?, ShipDistrict=?, ShipAddress=?, BuyerOrderStatusId=?, SellerOrderStatusId=?, RatingBuyer=?, RatingSeller=?, Remittance=?, RemittanceDate=?, RemittanceBank=?, RemittanceAcc=? WHERE OrderID=?";

	@Override
	public OrdersBean update(OrdersBean ordersBean) {
		OrdersBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, ordersBean.getSellerId());
			stmt.setInt(2, ordersBean.getBuyerId());
			stmt.setInt(3, ordersBean.getTotalFreight());
			stmt.setInt(4, ordersBean.getTotalPrice());
			java.util.Date orderDate = ordersBean.getOrderDate();
			if (orderDate != null) {
				long time = orderDate.getTime();
				stmt.setDate(5, new java.sql.Date(time));
			} else {
				stmt.setDate(5, null);
			}
			java.util.Date shipDate = ordersBean.getShipDate();
			if (shipDate != null) {
				long time = shipDate.getTime();
				stmt.setDate(6, new java.sql.Date(time));
			} else {
				stmt.setDate(6, null);
			}
			stmt.setString(7, ordersBean.getShipName());
			stmt.setString(8, ordersBean.getShipPostalCode());
			stmt.setString(9, ordersBean.getShipDistrict());
			stmt.setString(10, ordersBean.getShipAddress());
			stmt.setInt(11, ordersBean.getBuyerOrderStatusId());
			stmt.setInt(12, ordersBean.getSellerOrderStatusId());
			stmt.setInt(13, ordersBean.getRatingBuyer());
			stmt.setInt(14, ordersBean.getRatingSeller());
			stmt.setInt(15, ordersBean.getRemittance());
			Date remittanceDate = ordersBean.getRemittanceDate();
			if (remittanceDate != null) {
				long time = remittanceDate.getTime();
				stmt.setDate(16, new java.sql.Date(time));
			} else {
				stmt.setDate(16, null);
			}
			stmt.setString(17, ordersBean.getRemittanceBank());
			stmt.setString(18, ordersBean.getRemittanceAcc());
			stmt.setInt(19, ordersBean.getOrderId());
			
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(ordersBean.getOrderId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "DELETE FROM Orders WHERE OrderID = ?";

	@Override
	public boolean delete(int orderID) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, orderID);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_SEllER = "SELECT * FROM Orders where SellerID=?";

	@Override
	public List<OrdersBean> findSellerAllList(int sellerID) {
		List<OrdersBean> result = null;

		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_SEllER);
			stmt.setInt(1, sellerID);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<OrdersBean>();

			while (rset.next()) {
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
				bean.setBuyerOrderStatusId(rset.getInt("buyerOrderStatusId"));
				bean.setSellerOrderStatusId(rset.getInt("sellerOrderStatusId"));
				bean.setRatingBuyer(rset.getInt("ratingBuyer"));
				bean.setRatingSeller(rset.getInt("ratingSeller"));
				bean.setRemittance(rset.getInt("remittance"));
				bean.setRemittanceDate(rset.getDate("remittanceDate"));
				bean.setRemittanceBank(rset.getString("remittanceBank"));
				bean.setRemittanceAcc(rset.getString("remittanceAcc"));

				result.add(bean);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	private static final String SELECT_BY_BUYER = "SELECT * FROM Orders where BuyerId=?";

	@Override
	public List<OrdersBean> findBuyerAllList(int buyerId) {
		List<OrdersBean> result = null;

		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_BUYER);
			stmt.setInt(1, buyerId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<OrdersBean>();

			while (rset.next()) {
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
				bean.setBuyerOrderStatusId(rset.getInt("buyerOrderStatusId"));
				bean.setSellerOrderStatusId(rset.getInt("sellerOrderStatusId"));
				bean.setRatingBuyer(rset.getInt("ratingBuyer"));
				bean.setRatingSeller(rset.getInt("ratingSeller"));
				bean.setRemittance(rset.getInt("remittance"));
				bean.setRemittanceDate(rset.getDate("remittanceDate"));
				bean.setRemittanceBank(rset.getString("remittanceBank"));
				bean.setRemittanceAcc(rset.getString("remittanceAcc"));

				result.add(bean);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

}
