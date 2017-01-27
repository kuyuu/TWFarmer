package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.ProductBean;
import model.ProductDAO;






public class ProductDAOjdbc implements ProductDAO{
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";
	
	public static void main(String[] args) {
		ProductDAO dao=new ProductDAOjdbc();
		
		//select all OK
//		List<ProductBean> beans= dao.select();
//		System.out.println("bean="+beans);
		
		// 查詢單筆 OK
//		 ProductBean productBean3 = dao.select(2001);
//		 System.out.print(productBean3.getSellerId() + ",");
//		 System.out.print(productBean3.getOrigin() + ",");
//		 System.out.print(productBean3.getProductName() + ",");
//		 System.out.print(productBean3.getInventory() + ",");
//		 System.out.print(productBean3.getPrice() + ",");
//		 System.out.print(productBean3.getUnitId() + ",");
//		 System.out.print(productBean3.getProductTypeId() + ",");
//		 System.out.print(productBean3.getProductIntro() + ",");
//		 System.out.print(productBean3.getFreight() + ",");
//		 System.out.print(productBean3.getAddDate() + ",");
//		 System.out.print(productBean3.getRemoveEstDate() + ",");
//		 System.out.print(productBean3.getRemoveDate() + ",");
//		 System.out.println(productBean3.getProductStatusId() );
		
		
		// 新增  OK
//		ProductBean productBean1 = new ProductBean();
//		productBean1.setSellerId(1004);
//		productBean1.setOrigin("台北市南港區");
//		productBean1.setProductName("草莓");
//		productBean1.setInventory(500);
//		productBean1.setPrice(1000);
//		productBean1.setUnitId(2201);
//		productBean1.setProductTypeId(2104);
//		productBean1.setProductIntro("草莓草莓");
//		productBean1.setFreight(50);
//		productBean1.setAddDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean1.setRemoveEstDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean1.setRemoveDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean1.setProductStatusId(2501);
//	
//		ProductBean q = dao.insert(productBean1);
//		System.out.println(q);

		// update. ok
//		ProductBean productBean2 = dao.select(3007);
//
//		productBean2.setSellerId(1004);
//		productBean2.setOrigin("屏東縣九如鄉");
//		productBean2.setProductName("草莓牛奶");
//		productBean2.setInventory(500);
//		productBean2.setPrice(50000);
//		productBean2.setUnitId(2201);
//		productBean2.setProductTypeId(2101);
//		productBean2.setProductIntro("草莓草莓草莓");
//		productBean2.setFreight(50);
//		productBean2.setAddDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean2.setRemoveEstDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean2.setRemoveDate(java.sql.Date.valueOf("2016-06-05"));
//		productBean2.setProductStatusId(2502);	
//		dao.update(productBean2);
//		System.out.println(productBean2);

		// 刪除. ok
//		dao.delete(3007);
//		System.out.println("delete it");
//
		






	}

	
	private static final String SELECT_BY_ID = "select * from Product where productId=?";
	@Override
	public ProductBean select(int productId) {
		ProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ProductBean();
				result.setProductId(rset.getInt("productId"));
				result.setSellerId(rset.getInt("sellerId"));
				result.setOrigin(rset.getString("origin"));
				result.setProductName(rset.getString("productName"));
				result.setInventory(rset.getInt("inventory"));
				result.setPrice(rset.getInt("price"));
				result.setUnitId(rset.getInt("unitId"));
				result.setProductTypeId(rset.getInt("productTypeId"));
				result.setProductIntro(rset.getString("productIntro"));
				result.setFreight(rset.getInt("freight"));
				result.setAddDate(rset.getDate("addDate"));
				result.setRemoveEstDate(rset.getDate("removeEstDate"));
				result.setRemoveDate(rset.getDate("removeDate"));
				result.setProductStatusId(rset.getInt("productStatusId"));
				result.setAddDate(rset.getDate("addDate"));
				result.setRemoveEstDate(rset.getDate("removeEstDate"));
				result.setRemoveDate(rset.getDate("removeDate"));
				result.setProductStatusId(rset.getInt("productStatusId"));
				
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

	private static final String SELECT_ALL = "select * from Product";
	@Override
	public List<ProductBean> select() {
		List<ProductBean> result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ProductBean>();
			while (rset.next()) {
				ProductBean productBean = new ProductBean();
				productBean.setProductId(rset.getInt("productId"));
				productBean.setSellerId(rset.getInt("sellerId"));
				productBean.setOrigin(rset.getString("origin"));
				productBean.setProductName(rset.getString("productName"));
				productBean.setInventory(rset.getInt("inventory"));
				productBean.setPrice(rset.getInt("price"));
				productBean.setUnitId(rset.getInt("unitId"));
				productBean.setProductTypeId(rset.getInt("productTypeId"));
				productBean.setProductIntro(rset.getString("productIntro"));
				productBean.setFreight(rset.getInt("freight"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusId(rset.getInt("productStatusId"));
				productBean.setAddDate(rset.getDate("addDate"));
				productBean.setRemoveEstDate(rset.getDate("removeEstDate"));
				productBean.setRemoveDate(rset.getDate("removeDate"));
				productBean.setProductStatusId(rset.getInt("productStatusId"));

				result.add(productBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into Product (sellerId,origin,productName,inventory,price,unitId,productTypeId,productIntro,freight,addDate,removeEstDate,removeDate,productStatusId) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
	@Override
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		Connection conn;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (bean != null) {

				stmt.setInt(1, bean.getSellerId());
				stmt.setString(2, bean.getOrigin());
				stmt.setString(3, bean.getProductName());
				stmt.setInt(4, bean.getInventory());
				stmt.setInt(5, bean.getPrice());
				stmt.setInt(6, bean.getUnitId());
				stmt.setInt(7, bean.getProductTypeId());
				stmt.setString(8, bean.getProductIntro());
				stmt.setInt(9, bean.getFreight());
				
				java.util.Date AddDate = bean.getAddDate();
				if (AddDate != null) {
					long time = AddDate.getTime();
					stmt.setDate(10, new java.sql.Date(time));
				} else {
					stmt.setDate(10, null);
				}
				
				java.util.Date removeEstDate = bean.getRemoveEstDate();
				if (removeEstDate != null) {
					long time = removeEstDate.getTime();
					stmt.setDate(11, new java.sql.Date(time));
				} else {
					stmt.setDate(11, null);
				}
				
				java.util.Date removeDate = bean.getRemoveDate();
				if (removeDate != null) {
					long time = removeDate.getTime();
					stmt.setDate(12, new java.sql.Date(time));
				} else {
					stmt.setDate(12, null);
				}
System.out.println(INSERT);
				stmt.setInt(13, bean.getProductStatusId());
			
				
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

	private static final String UPDATE = "update Product set sellerId=?, origin=?, productName=?, inventory=?, price=?, unitId=?, productTypeId=?, productIntro=?, freight=?, addDate=?, removeEstDate=?, removeDate=?, productStatusId=? where productId=?";
	@Override
	public ProductBean update(ProductBean bean) {
		ProductBean result = null;

			try(Connection conn= DriverManager.getConnection(URL, USERNAME, PASSWORD);
					PreparedStatement stmt = conn.prepareStatement(UPDATE);){
			
				stmt.setInt(1, bean.getSellerId());
				stmt.setString(2, bean.getOrigin());
				stmt.setString(3, bean.getProductName());
				stmt.setInt(4, bean.getInventory());
				stmt.setInt(5, bean.getPrice());
				stmt.setInt(6, bean.getUnitId());
				stmt.setInt(7, bean.getProductTypeId());
				stmt.setString(8, bean.getProductIntro());
				stmt.setInt(9, bean.getFreight());
				
				java.util.Date AddDate = bean.getAddDate();
				if (AddDate != null) {
					long time = AddDate.getTime();
					stmt.setDate(10, new java.sql.Date(time));
				} else {
					stmt.setDate(10, null);
				}
				
				java.util.Date removeEstDate = bean.getRemoveEstDate();
				if (removeEstDate != null) {
					long time = removeEstDate.getTime();
					stmt.setDate(11, new java.sql.Date(time));
				} else {
					stmt.setDate(11, null);
				}
				
				java.util.Date removeDate = bean.getRemoveDate();
				if (removeDate != null) {
					long time = removeDate.getTime();
					stmt.setDate(12, new java.sql.Date(time));
				} else {
					stmt.setDate(12, null);
				}
//System.out.println(INSERT);
				stmt.setInt(13, bean.getProductStatusId());
				stmt.setInt(14, bean.getProductId());
				
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = bean;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from Product where productId=?";
	@Override
	public boolean delete(int productId) {
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
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
