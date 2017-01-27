package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.JPDetailBean;
import model.JPDetailDAO;

public class JPDetailDAOjdbc implements JPDetailDAO {
	
	DataSource dataSource;
	 public JPDetailDAOjdbc() {
		 try {
		 Context ctx = new InitialContext();
		 dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		 } catch (NamingException e) {
		 e.printStackTrace();
		 }
	 }

//	//測試程式
//	public static void main(String[] args) {
//		JPDetailDAO dao = new JPDetailDAOjdbc();
////		查詢所有資料
//		List<JPDetailBean> beans = dao.select();
//		System.out.println("bean="+beans);
//		//依JPID查詢資料
//		List<JPDetailBean> selectByJpIds = dao.selectByJpId(4001);
//		for (JPDetailBean selectByJpId :selectByJpIds) {
//			System.out.print(selectByJpId.getJpId()+",");
//			System.out.print(selectByJpId.getProductId()+",");
//			System.out.print(selectByJpId.getJpPopulationMin()+",");
//			System.out.print(selectByJpId.getJpPopulationMax()+",");
//			System.out.print(selectByJpId.getJpMinQEach()+",");
//			System.out.print(selectByJpId.getJpPrice()+",");
//			System.out.print(selectByJpId.getJpFreight());
//		}

//		//依ProductID查詢資料
//		List<JPDetailBean> selectByProductIDs = dao.selectByProductId(2001);
//		for (JPDetailBean selectByProductId :selectByProductIDs) {
//			System.out.print(selectByProductId.getJpId()+",");
//			System.out.print(selectByProductId.getProductId()+",");
//			System.out.print(selectByProductId.getJpPopulationMin()+",");
//			System.out.print(selectByProductId.getJpPopulationMax()+",");
//			System.out.print(selectByProductId.getJpMinQEach()+",");
//			System.out.print(selectByProductId.getJpPrice()+",");
//			System.out.print(selectByProductId.getJpFreight());
//		}
		
//		//依PK值查詢資料
//		JPDetailBean selectByPk = dao.select(4001,2001);
//
//		System.out.print(selectByPk.getJpId()+",");
//		System.out.print(selectByPk.getProductId()+",");
//		System.out.print(selectByPk.getJpPopulationMin()+",");
//		System.out.print(selectByPk.getJpPopulationMax()+",");
//		System.out.print(selectByPk.getJpMinQEach()+",");
//		System.out.print(selectByPk.getJpPrice()+",");
//		System.out.print(selectByPk.getJpFreight());

		 //新增
//		JPDetailBean jpDetailInsert = new JPDetailBean();
//
//		jpDetailInsert.setJpId(4002);
//		jpDetailInsert.setProductId(2002);
//		jpDetailInsert.setJpPopulationMin(10);
//		jpDetailInsert.setJpPopulationMax(20);
//		jpDetailInsert.setJpMinQEach(2);
//		jpDetailInsert.setJpPrice(25);
//		jpDetailInsert.setJpFreight(10);
//		
//		JPDetailBean JPDetailadd = dao.insert(jpDetailInsert);
//		System.out.println(JPDetailadd);
//
//		 修改
//		JPDetailBean jpDetailUpdate = new JPDetailBean();
//
//		jpDetailUpdate.setJpId(4003);
//		jpDetailUpdate.setProductId(2002);
//		jpDetailUpdate.setJpPopulationMin(15);
//		jpDetailUpdate.setJpPopulationMax(25);
//		jpDetailUpdate.setJpMinQEach(5);
//		jpDetailUpdate.setJpPrice(22);
//		jpDetailUpdate.setJpFreight(5);
//		
//		JPDetailBean jpDetailChange = dao.update(jpDetailUpdate);
//		System.out.println(jpDetailChange);
//
		// 刪除
//		dao.deleteByJpId(4002);
//		System.out.println("資料已刪除");
//		
//		dao.deleteByProductId(2002);
//		System.out.println("資料已刪除");
//		
//		dao.delete(4001, 2002);
//		System.out.println("資料已刪除");
//
//	}

	
	
	
	//查詢
	 
		private static final String SELECT_BY_PK = "select * from JPDetail where JPId=? and ProductId=?";

		@Override
		public JPDetailBean select(int jpId, int productId) {
			JPDetailBean result = null;
			ResultSet rset = null;
			try (Connection conn = dataSource.getConnection();
					PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {

				stmt.setInt(1, jpId);
				stmt.setInt(2, productId);
				
				rset = stmt.executeQuery();
				if (rset.next()) {
					result = new JPDetailBean();
					result.setJpId(rset.getInt("JpID"));
					result.setProductId(rset.getInt("ProductID"));
					result.setJpPopulationMin(rset.getInt("JpPopulationMin"));
					result.setJpPopulationMax(rset.getInt("JpPopulationMax"));
					result.setJpMinQEach(rset.getInt("JpMinQEach"));
					result.setJpPrice(rset.getInt("JpPrice"));
					result.setJpFreight(rset.getInt("JpFreight"));

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

	 
	 
	private static final String SELECT_BY_JPID = "select * from JPDetail where JPId=?";

	@Override
	public List<JPDetailBean> selectByJpId(int jpId) {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);) {

			stmt.setInt(1, jpId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();
				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BY_PRODUCTID = "select * from JPDetail where ProductID=?";

	@Override
	public List<JPDetailBean> selectByProductId(int productId) {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {

			stmt.setInt(1, productId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();

				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));

				result.add(bean);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_ALL = "select * from JPDetail";

	@Override
	public List<JPDetailBean> select() {
		List<JPDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<JPDetailBean>();
			while (rset.next()) {
				JPDetailBean bean = new JPDetailBean();
				bean.setJpId(rset.getInt("JpID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setJpPopulationMin(rset.getInt("JpPopulationMin"));
				bean.setJpPopulationMax(rset.getInt("JpPopulationMax"));
				bean.setJpMinQEach(rset.getInt("JpMinQEach"));
				bean.setJpPrice(rset.getInt("JpPrice"));
				bean.setJpFreight(rset.getInt("JpFreight"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = 
			"insert into JPDetail (JPID, ProductID, JPPopulationMin, JPPopulationMax, JPMinQEach, JPPrice, JPFreight)  VALUES (?, ?, ?, ?, ?, ?, ?)";

	@Override
	public JPDetailBean insert(JPDetailBean JPDetailBean) {
		JPDetailBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (JPDetailBean != null) {
				stmt.setInt(1, JPDetailBean.getJpId());
				stmt.setInt(2, JPDetailBean.getProductId());
				stmt.setInt(3, JPDetailBean.getJpPopulationMin());
				stmt.setInt(4, JPDetailBean.getJpPopulationMax());
				stmt.setInt(5, JPDetailBean.getJpMinQEach());
				stmt.setInt(6, JPDetailBean.getJpPrice());
				stmt.setInt(7, JPDetailBean.getJpFreight());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = JPDetailBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update JPDetail "
			+ "set JPPopulationMin=?, "
			+ "JPPopulationMax=?, "
			+ "JPMinQEach=?, "
			+ "JPPrice=?, "
			+ "JPFreight=? "
			+ "WHERE JPId=? AND ProductId=?";

	@Override
	public JPDetailBean update(JPDetailBean JPDetailBean) {
		JPDetailBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, JPDetailBean.getJpPopulationMin());
			stmt.setInt(2, JPDetailBean.getJpPopulationMax());
			stmt.setInt(3, JPDetailBean.getJpMinQEach());
			stmt.setInt(4, JPDetailBean.getJpPrice());
			stmt.setInt(5, JPDetailBean.getJpFreight());
			stmt.setInt(6, JPDetailBean.getJpId());
			stmt.setInt(7, JPDetailBean.getProductId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(JPDetailBean.getJpId(), JPDetailBean.getProductId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_JPID = "delete from JPDetail where JpID=?";

	@Override
	public boolean deleteByJpId(int jpId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_JPID);) {
			stmt.setInt(1, jpId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static final String DELETE_BY_PRODUCTID = "delete from JPDetail where ProductID=?";

	@Override
	public boolean deleteByProductId(int productId) {
		try (Connection conn = dataSource.getConnection();
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
	
	private static final String DELETE_BY_PK = "delete from JPDetail where JPID=? and ProductID=?";
	@Override
	public boolean delete(int jpId, int productId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PK);) {
			stmt.setInt(1, jpId);
			stmt.setInt(2, productId);
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
