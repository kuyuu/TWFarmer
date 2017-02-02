package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.OrderDetailBean;
import model.OrderDetailDAO;

public class OrderDetailDAOJdbc implements OrderDetailDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";

	public static void main(String[] args) {
		OrderDetailDAO dao = new OrderDetailDAOJdbc();

		// Select all
		 List<OrderDetailBean> beans = dao.select();
		 System.out.println("bean=" + beans);

		// Select By OrderID
//		System.out.println(dao.selectByOrderId(3001));

		// Select By ProductID
		// System.out.println(dao.selectByProductId(2001));

		// Insert
//		OrderDetailBean bean = new OrderDetailBean();
//		bean.setOrderId(3005);
//		bean.setProductId(2001);
//		bean.setUnitId(2204);
//		bean.setUnitPrice(35);
//		bean.setOrderQuantity(10);
//		bean.setUnitFreight(100);
//		dao.insert(bean);
//		System.out.println(bean);

		//Update
//		OrderDetailBean bean2 = dao.selectByOrderId(3005);
//		bean2.setOrderId(3005);
//		bean2.setProductId(2002);
//		bean2.setUnitId(2204);
//		bean2.setUnitPrice(600);
//		bean2.setOrderQuantity(3);
//		bean2.setUnitFreight(300);
//		System.out.println(bean2);
		
		//Delete By OrderID
//		dao.deleteByOrderId(3005);
		
		//Delete By ProductID
//		dao.deleteByOrderId(2001);
	}

	private static final String SELECT_ALL = "SELECT * FROM OrderDetail";

	@Override
	public List<OrderDetailBean> select() {
		List<OrderDetailBean> result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<OrderDetailBean>();
			while (rset.next()) {
				OrderDetailBean bean = new OrderDetailBean();
				bean.setOrderId(rset.getInt("orderId"));
				bean.setProductId(rset.getInt("productId"));
				bean.setUnitId(rset.getInt("unitId"));
				bean.setUnitPrice(rset.getInt("unitPrice"));
				bean.setOrderQuantity(rset.getInt("orderQuantity"));
				bean.setUnitFreight(rset.getInt("unitFreight"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_ORDERID = "SELECT * FROM OrderDetail where OrderID=?";

	@Override
	public OrderDetailBean selectByOrderId(int orderId) {
		OrderDetailBean result = null;
		ResultSet rset = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ORDERID);) {

			stmt.setInt(1, orderId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new OrderDetailBean();
				result.setOrderId(rset.getInt("orderId"));
				result.setProductId(rset.getInt("productId"));
				result.setUnitId(rset.getInt("unitId"));
				result.setUnitPrice(rset.getInt("unitPrice"));
				result.setOrderQuantity(rset.getInt("orderQuantity"));
				result.setUnitFreight(rset.getInt("unitFreight"));

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

	private static final String SELECT_BY_PRODUCTID = "SELECT * FROM OrderDetail where ProductId=?";

	@Override
	public OrderDetailBean selectByProductId(int productId) {
		OrderDetailBean result = null;
		ResultSet rset = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {

			stmt.setInt(1, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new OrderDetailBean();
				result.setOrderId(rset.getInt("orderId"));
				result.setProductId(rset.getInt("productId"));
				result.setUnitId(rset.getInt("unitId"));
				result.setUnitPrice(rset.getInt("unitPrice"));
				result.setOrderQuantity(rset.getInt("orderQuantity"));
				result.setUnitFreight(rset.getInt("unitFreight"));

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

	private static final String INSERT = "INSERT INTO OrderDetail (OrderId, ProductId, UnitId, UnitPrice, OrderQuantity, UnitFreight) values ( ?, ?, ?, ?, ?, ? )";

	@Override
	public OrderDetailBean insert(OrderDetailBean orderDetailBean) {
		OrderDetailBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (orderDetailBean != null) {
				stmt.setInt(1, orderDetailBean.getOrderId());
				stmt.setInt(2, orderDetailBean.getProductId());
				stmt.setInt(3, orderDetailBean.getUnitId());
				stmt.setInt(4, orderDetailBean.getUnitPrice());
				stmt.setInt(5, orderDetailBean.getOrderQuantity());
				stmt.setInt(6, orderDetailBean.getUnitFreight());

				int i = stmt.executeUpdate();
				if (i == 1) {
					result = orderDetailBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "UPDATE OrderDetail set OrderId=?, ProductId=?, UnitId=?, UnitPrice=?, OrderQuantity=?, UnitFreight=?)";

	@Override
	public OrderDetailBean update(OrderDetailBean orderDetailBean) {
		OrderDetailBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, orderDetailBean.getOrderId());
			stmt.setInt(2, orderDetailBean.getProductId());
			stmt.setInt(3, orderDetailBean.getUnitId());
			stmt.setInt(4, orderDetailBean.getUnitPrice());
			stmt.setInt(5, orderDetailBean.getOrderQuantity());
			stmt.setInt(6, orderDetailBean.getUnitFreight());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.selectByOrderId(orderDetailBean.getOrderId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_ORDERID = "DELETE FROM OrderDetail WHERE OrderID = ?";

	@Override
	public boolean deleteByOrderId(int orderId) {
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_ORDERID);) {
			stmt.setInt(1, orderId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String DELETE_BY_PRODUCTID = "DELETE FROM OrderDetail WHERE ProductID = ?";

	@Override
	public boolean deleteByProductId(int productId) {
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PRODUCTID);) {
			stmt.setInt(1, productId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
