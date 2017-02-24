package model.daojdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.ProductDiscountBean;
import model.bean.ProductStatusBean;
import model.dao.ProductDiscountDAO;

public class ProductDiscountDAOjdbc implements ProductDiscountDAO {
	private DataSource dataSource;

	public ProductDiscountDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 測試程式
	public static void main(String[] args) {
		ProductDiscountDAO dao = new ProductDiscountDAOjdbc();

		// select all. ok
		// List<ProductDiscountBean> beans = dao.select();
		// System.out.println("bean="+beans);

		// //select by id. ok
		// ProductDiscountBean productDiscountBean1 = dao.select(2301);
		// System.out.println(productDiscountBean1.toString());

		// insert.
		// ProductDiscountBean productDiscountBean2 = new ProductDiscountBean();
		//
		// productDiscountBean2.setProductId(3007);
		// productDiscountBean2.setMinThreshold(50);
		// productDiscountBean2.setMaxThreshold(100);
		// productDiscountBean2.setDiscountPrice(900);
		//
		// ProductDiscountBean ins = dao.insert(productDiscountBean2);
		// System.out.println(ins);

		// update. ok
		// ProductDiscountBean productDiscountBean3 = new ProductDiscountBean();
		//
		// productDiscountBean3.setDiscountId(3306);
		// productDiscountBean3.setProductId(3007);
		// productDiscountBean3.setMinThreshold(1);
		// productDiscountBean3.setMaxThreshold(2);
		// productDiscountBean3.setDiscountPrice(1300);
		//
		// ProductDiscountBean upd = dao.update(productDiscountBean3);
		// System.out.println(upd);
		//
		// delete. ok
		// dao.delete(3307);
		// System.out.println("資料已刪除");

	}

	private static final String SELECT_BY_ID = "SELECT * from ProductDiscount where discountId=?";

	@Override
	public ProductDiscountBean select(int discountId) {
		ProductDiscountBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, discountId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductDiscountBean();
				result.setDiscountId(rset.getInt("discountId"));
				;
				result.setProductId(rset.getInt("productId"));
				result.setMinThreshold(rset.getInt("minThreshold"));
				;
				result.setMaxThreshold(rset.getInt("maxThreshold"));
				;
				result.setDiscountPrice(rset.getInt("discountPrice"));

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

	private static final String SELECT_ALL = "SELECT * from ProductDiscount";

	@Override
	public List<ProductDiscountBean> select() {
		List<ProductDiscountBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ProductDiscountBean>();
			while (rset.next()) {
				ProductDiscountBean productDiscountBean = new ProductDiscountBean();
				productDiscountBean.setDiscountId(rset.getInt("discountId"));
				;
				productDiscountBean.setProductId(rset.getInt("productId"));
				productDiscountBean.setMinThreshold(rset.getInt("minThreshold"));
				;
				productDiscountBean.setMaxThreshold(rset.getInt("maxThreshold"));
				;
				productDiscountBean.setDiscountPrice(rset.getInt("discountPrice"));

				result.add(productDiscountBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/*
	 * 從select方法copy，修改
	 * 1.指令   
	 * 2.stmt.setInt(1, productId); 放ResultSet前面
	 * 3.prepareStatement參數名
	 */
	private static final String SELECT_BY_PRODUCTID = "SELECT * from ProductDiscount WHERE ProductId=?";

	@Override
	public List<ProductDiscountBean> selectByProductId(int productId) {
		List<ProductDiscountBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {
			stmt.setInt(1, productId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<ProductDiscountBean>();
			while (rset.next()) {
				ProductDiscountBean productDiscountBean = new ProductDiscountBean();
				productDiscountBean.setDiscountId(rset.getInt("discountId"));
				;
				productDiscountBean.setProductId(rset.getInt("productId"));
				productDiscountBean.setMinThreshold(rset.getInt("minThreshold"));
				;
				productDiscountBean.setMaxThreshold(rset.getInt("maxThreshold"));
				;
				productDiscountBean.setDiscountPrice(rset.getInt("discountPrice"));

				result.add(productDiscountBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into ProductDiscount (productId, minThreshold, maxThreshold, discountPrice) VALUES (?,?,?,?)";

	@Override
	public ProductDiscountBean insert(ProductDiscountBean bean) {
		ProductDiscountBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (bean != null) {

				stmt.setInt(1, bean.getProductId());
				stmt.setInt(2, bean.getMinThreshold());
				stmt.setInt(3, bean.getMaxThreshold());
				stmt.setInt(4, bean.getDiscountPrice());

				int i = stmt.executeUpdate();
				if (i == 1) {
					result = bean;
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "UPDATE ProductDiscount " + "SET productId=?, " + "minThreshold=?, "
			+ "maxThreshold=?, " + "discountPrice=? " + "where discountId=?";

	@Override
	public ProductDiscountBean update(ProductDiscountBean bean) {
		ProductDiscountBean result = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setInt(1, bean.getProductId());
			stmt.setInt(2, bean.getMinThreshold());
			stmt.setInt(3, bean.getMaxThreshold());
			stmt.setInt(4, bean.getDiscountPrice());
			stmt.setInt(5, bean.getDiscountId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = bean;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "DELETE FROM ProductDiscount where discountId=?";

	@Override
	public boolean delete(int discountId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, discountId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static final String DELETE_BY_PRODUCTID = "DELETE FROM ProductDiscount where ProductDiscount.ProductID=?";

	@Override
	public boolean deleteByProductId(int productId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PRODUCTID);) {
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
