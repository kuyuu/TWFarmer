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

import model.bean.ProductBean;
import model.bean.ProductStatusBean;
import model.dao.ProductStatusDAO;

public class ProductStatusDAOjdbc implements ProductStatusDAO {
	private DataSource dataSource;
	public ProductStatusDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ProductStatusDAO dao=new ProductStatusDAOjdbc();
		
		// select all. ok
//		List<ProductStatusBean> beans= dao.select();
//		System.out.println("bean="+beans);
		
		//select by ID. ok
//		ProductStatusBean productStatusBean1=dao.select(2501);
//		System.out.println(productStatusBean1.toString());
		
		//insert. ok
//		ProductStatusBean productStatusBean2 =new ProductStatusBean();
//		productStatusBean2.setProductStatusName("補貨中");
//		ProductStatusBean ins= dao.insert(productStatusBean2);
//		System.out.println(ins);
		
		//update. ok
//		ProductStatusBean productStatusBean3=dao.select(3502);
//		productStatusBean3.setProductStatusName("缺貨中");
//		ProductStatusBean upd= dao.update(productStatusBean3);
//		System.out.println(upd);
		
		//delete. ok
//		dao.delete(3502);
//		System.out.println("delete it");
		
	}
	
	
	
	
	private static final String SELECT_BY_ID=
			"select* from ProductStatus where productStatusId=?";
	
	@Override
	public ProductStatusBean select(int productStatusId) {
		ProductStatusBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, productStatusId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductStatusBean();
				result.setProductStatusId(rset.getInt("productStatusId"));
				result.setProductStatusName(rset.getString("productStatusName"));

								
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

	private static final String SELECT_ALL =
			"select * from ProductStatus";
	@Override
	public List<ProductStatusBean> select() {
		List<ProductStatusBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ProductStatusBean>();
			while (rset.next()) {
				ProductStatusBean productStatusBean = new ProductStatusBean();
				productStatusBean.setProductStatusId(rset.getInt("productStatusId"));
				productStatusBean.setProductStatusName(rset.getString("productStatusName"));;
	
				result.add(productStatusBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into ProductStatus (productStatusName) values (?)";
	@Override
	public ProductStatusBean insert(ProductStatusBean bean) {
		ProductStatusBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (bean != null) {

				stmt.setString(1, bean.getProductStatusName());
	
				
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

	
	private static final String UPDATE =
			"update ProductStatus set productStatusName=? where productStatusId=?";
	@Override
	public ProductStatusBean update(ProductStatusBean bean) {
		ProductStatusBean result = null;

		try(Connection conn= dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);){
		
			stmt.setString(1, bean.getProductStatusName());
			stmt.setInt(2,bean.getProductStatusId());

			
		int i = stmt.executeUpdate();
		if (i == 1) {
			result = bean;
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return result;
	}

	
	private static final String DELETE =
			"delete from ProductStatus where productStatusId=?";
	
	@Override
	public boolean delete(int productStatusId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, productStatusId);
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
