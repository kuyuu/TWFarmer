package model.dao;

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

import model.ProductStatusBean;
import model.ProductTypeBean;
import model.ProductTypeDAO;

public class ProductTypeDAOjdbc implements ProductTypeDAO {
	private DataSource dataSource;
	public ProductTypeDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		ProductTypeDAO dao=new ProductTypeDAOjdbc();
		
		//select all. ok
//		List<ProductTypeBean> beans= dao.select();
//		System.out.println("bean="+beans);	
		
		//select by id. ok
//		ProductTypeBean productTypeBean1=dao.select(2101);
//		System.out.println(productTypeBean1.toString());
//		
		//insert. ok
//		ProductTypeBean productTypeBean2= new ProductTypeBean();
//		productTypeBean2.setType("我是人類");
//		ProductTypeBean ins =dao.insert(productTypeBean2);
//		System.out.println(ins);
		
		//update. ok
//		ProductTypeBean productTypeBean3=dao.select(2114);
//		productTypeBean3.setType("敗類");
//		ProductTypeBean upd= dao.update(productTypeBean3);
//		System.out.println(upd);
		
		//delete. ok
//		dao.delete(2114);
//		System.out.println("delete it");
	}



	

	

	

		
	
	
	private static final String SELECT_BY_ID=
			"select* from ProductType where productTypeId=?";
	@Override
	public ProductTypeBean select(int productTypeId) {
		ProductTypeBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, productTypeId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductTypeBean();
				result.setProductTypeId(rset.getInt("productTypeId"));;
				result.setType(rset.getString("type"));;
							
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
			"select * from ProductType";
	@Override
	public List<ProductTypeBean> select() {
		List<ProductTypeBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ProductTypeBean>();
			while (rset.next()) {
				ProductTypeBean productTypeBean = new ProductTypeBean();
				productTypeBean.setProductTypeId(rset.getInt("productTypeId"));;
				productTypeBean.setType(rset.getString("type"));
	
				result.add(productTypeBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT =
			"insert into ProductType (Type) values (?)";
	@Override
	public ProductTypeBean insert(ProductTypeBean bean) {
		ProductTypeBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (bean != null) {

				stmt.setString(1, bean.getType());;
				
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
			"update ProductType set Type=? Where productTypeId=?";
	@Override
	public ProductTypeBean update(ProductTypeBean bean) {
		ProductTypeBean result = null;

		try(Connection conn= dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);){
		
			stmt.setString(1, bean.getType());
			stmt.setInt(2, bean.getProductTypeId());
			
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
			"delete from ProductType where productTypeId=?";
	@Override
	public boolean delete(int productTypeId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, productTypeId);
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
