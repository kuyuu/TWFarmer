package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.OrderStatusBean;
import model.OrderStatusDAO;

public class OrderStatusDAOJdbc implements OrderStatusDAO{
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";
	
	public static void main(String[] args) {
		OrderStatusDAO dao = new OrderStatusDAOJdbc();
		
		// Select all
//		List<OrderStatusBean> beans = dao.select();
//		System.out.println("bean="+beans);
		
		// Select By OrderID
		System.out.println(dao.select(3101));
		
		//Insert
//		OrderStatusBean bean = new OrderStatusBean();
//		bean.setOrderStatusName("測試");
//		dao.insert(bean);
//		System.out.println(bean);
		
		//Update
//		OrderStatusBean bean2 = dao.select(3104);
//		bean2.setOrderStatusName("測試改變");
//		System.out.println(bean2);
		
		//Delete
//		dao.delete(3104);
	}
	
	private static final String SELECT_ALL ="SELECT * FROM OrderStatus";
	@Override
	public List<OrderStatusBean> select() {
		List<OrderStatusBean> result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<OrderStatusBean>();
			while(rset.next()) {
				OrderStatusBean bean = new OrderStatusBean();
				bean.setOrderStatusId(rset.getInt("orderStatusId"));
				bean.setOrderStatusName(rset.getString("orderStatusName"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_ID =
			"SELECT * FROM OrderStatus where orderStatusId=?";
	@Override
	public OrderStatusBean select(int orderStatusId) {
		OrderStatusBean result = null;
		ResultSet rset = null;
		try(
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, orderStatusId);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new OrderStatusBean();
				result.setOrderStatusId(rset.getInt("orderStatusId"));
				result.setOrderStatusName(rset.getString("orderStatusName"));
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
			"INSERT INTO OrderStatus (OrderStatusName) Values (?)";
	@Override
	public OrderStatusBean insert(OrderStatusBean orderStatusBean) {
		OrderStatusBean result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if(orderStatusBean!=null) {
				stmt.setString(1,orderStatusBean.getOrderStatusName());
				
				int i = stmt.executeUpdate();
				if(i==1) {
					result = orderStatusBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE =
			"UPDATE OrderStatus set OrderStatusId=?, OrderStatusName=?";
	@Override
	public OrderStatusBean update(OrderStatusBean orderStatusBean) {
		OrderStatusBean result = null;
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1,orderStatusBean.getOrderStatusName());
			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(orderStatusBean.getOrderStatusId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE =
			"DELETE FROM OrderStatus WHERE OrderStatusId = ?";
	@Override
	public boolean delete(int orderStatusId) {
		try(
				Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, orderStatusId);
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
