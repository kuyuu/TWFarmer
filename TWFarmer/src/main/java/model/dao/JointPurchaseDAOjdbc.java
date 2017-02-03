package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.JointPurchaseBean;
import model.JointPurchaseDAO;

public class JointPurchaseDAOjdbc implements JointPurchaseDAO {

	DataSource dataSource;

	public JointPurchaseDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 測試程式
	// public static void main(String[] args) {
	// //查詢所有資料
	// List<JointPurchaseBean> beans = dao.select();
	// System.out.println("bean="+beans);
	// //查詢單筆資料
	// JointPurchaseBean jpBeanSelect = dao.select(4001);
	// System.out.print(jpBeanSelect.getJpId() + ",");
	// System.out.print(jpBeanSelect.getInitId() + ",");
	// System.out.print(jpBeanSelect.getJpIntro() + ",");
	// System.out.print(jpBeanSelect.getInitDate() + ",");
	// System.out.print(jpBeanSelect.getEndDate() + ",");
	// System.out.print(jpBeanSelect.getJpLocation() + ",");
	// System.out.print(jpBeanSelect.getJpStatusId() + ",");
	// System.out.print(jpBeanSelect.getJpFreight() + ",");
	// System.out.print(jpBeanSelect.getMiscViaId() + ",");
	// System.out.print(jpBeanSelect.getMisc() + ",");

	// 新增
	// JointPurchaseBean jpBeanInsert = new JointPurchaseBean();
	//
	// jpBeanInsert.setInitId(1005);
	// jpBeanInsert.setJpIntro("大安區的愛吃水果的人一起來跟團");
	// jpBeanInsert.setInitDate(java.sql.Timestamp.valueOf("2017-01-21
	// 09:23:12"));
	// jpBeanInsert.setEndDate(java.sql.Timestamp.valueOf("2017-01-28
	// 09:23:12"));
	// jpBeanInsert.setJpLocation("台北市大安區");
	// jpBeanInsert.setJpStatusId(4103);
	// jpBeanInsert.setJpFreight(300);
	// jpBeanInsert.setMiscViaId(4203);
	// jpBeanInsert.setMisc(15);
	//
	// JointPurchaseBean jpadd = dao.insert(jpBeanInsert);
	// System.out.println(jpadd);

	// 修改
	// JointPurchaseBean jpBeanUpdate = new JointPurchaseBean();
	//
	// jpBeanUpdate.setJpId(4006);
	// jpBeanUpdate.setInitId(1006);
	// jpBeanUpdate.setJpIntro("主揪換人做做看");
	// jpBeanUpdate.setInitDate(java.sql.Timestamp.valueOf("2017-01-22
	// 09:23:12"));
	// jpBeanUpdate.setEndDate(java.sql.Timestamp.valueOf("2017-01-29
	// 09:23:12"));
	// jpBeanUpdate.setJpLocation("台北市中正區");
	// jpBeanUpdate.setJpStatusId(4102);
	// jpBeanUpdate.setJpFreight(350); //總運費要再確認
	// jpBeanUpdate.setMiscViaId(4201);
	// jpBeanUpdate.setMisc(0);
	//
	// JointPurchaseBean jpBeanChange = dao.update(jpBeanUpdate);
	// System.out.println(jpBeanChange);
	//
	// // 刪除
	// dao.delete(4006);
	// System.out.println("資料已刪除");
	//
	// }

	// 查詢
	private static final String SELECT_BY_ID = "SELECT * from JointPurchase where JPId=?";

	@Override
	public JointPurchaseBean select(int jpId) {
		JointPurchaseBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, jpId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new JointPurchaseBean();
				result.setJpId(rset.getInt("jpId"));
				result.setInitId(rset.getInt("initId"));
				result.setJpName(rset.getString("jpName"));
				result.setJpIntro(rset.getString("jpIntro"));
				result.setInitDate(rset.getDate("initDate"));
				result.setEndDate(rset.getDate("endDate"));
				result.setJpLocation(rset.getString("jpLocation"));
				result.setJpStatusId(rset.getInt("jpStatusId"));
				result.setJpFreight(rset.getInt("jpFreight"));
				result.setMiscViaId(rset.getInt("MiscViaId"));
				result.setMisc(rset.getInt("Misc"));
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

	private static final String SELECT_ALL = "SELECT * from JointPurchase";

	@Override
	public List<JointPurchaseBean> select() {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<JointPurchaseBean>();
			while (rset.next()) {
				JointPurchaseBean bean = new JointPurchaseBean();
				bean.setJpId(rset.getInt("jpId"));
				bean.setInitId(rset.getInt("initId"));
				bean.setJpName(rset.getString("jpName"));
				bean.setJpIntro(rset.getString("jpIntro"));
				bean.setInitDate(rset.getDate("initDate"));
				bean.setEndDate(rset.getDate("endDate"));
				bean.setJpLocation(rset.getString("jpLocation"));
				bean.setJpStatusId(rset.getInt("jpStatusId"));
				bean.setJpFreight(rset.getInt("jpFreight"));
				bean.setMiscViaId(rset.getInt("MiscViaId"));
				bean.setMisc(rset.getInt("Misc"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 新增
	private static final String INSERT = "insert into JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate, JPLocation, JPStatusID, JPFreight, MiscViaID, Misc) "
			+ "OUTPUT INSERTED.JPID " + "VALUES (?,?,?,?,?,?,?,?,?,?)";

	@Override
	public JointPurchaseBean insert(JointPurchaseBean bean) {
		JointPurchaseBean result = null;
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getInitId());
				stmt.setString(2, bean.getJpName());
				stmt.setString(3, bean.getJpIntro());

				Date initDate = bean.getInitDate();
				if (initDate != null) {
					long time = initDate.getTime();
					stmt.setDate(4, new java.sql.Date(time));
				} else {
					stmt.setDate(4, null);
				}

				Date endDate = bean.getEndDate();
				if (endDate != null) {
					long time = endDate.getTime();
					stmt.setDate(5, new java.sql.Date(time));
				} else {
					stmt.setDate(5, null);
				}

				stmt.setString(6, bean.getJpLocation());
				stmt.setInt(7, bean.getJpStatusId());
				stmt.setInt(8, bean.getJpFreight());
				stmt.setInt(9, bean.getMiscViaId());
				stmt.setInt(10, bean.getMisc());

				ResultSet rs = stmt.executeQuery();

				if (rs.next()) {
					result = new JointPurchaseBean();
					result = select(rs.getInt("jpId"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 修改
	private static final String UPDATE = "UPDATE JointPurchase " + "SET InitId=?, " + "JPName=?, "+ "JPIntro=?, " + "InitDate=?, "
			+ "EndDate=?, " + "JPLocation=?, " + "JPStatusID=?, " + "JPFreight=?, " + "MiscViaID=?, " + "Misc=? "
			+ "WHERE JPId=?";

	@Override
	public JointPurchaseBean update(JointPurchaseBean bean) {
		JointPurchaseBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getInitId());
			stmt.setString(2, bean.getJpName());
			stmt.setString(3, bean.getJpIntro());

			if (bean.getInitDate() != null) {
				long time = bean.getInitDate().getTime();
				stmt.setDate(4, new java.sql.Date(time));
			} else {
				stmt.setDate(4, null);
			}

			if (bean.getEndDate() != null) {
				long time = bean.getEndDate().getTime();
				stmt.setDate(5, new java.sql.Date(time));
			} else {
				stmt.setDate(5, null);
			}

			stmt.setString(6, bean.getJpLocation());
			stmt.setInt(7, bean.getJpStatusId());
			stmt.setInt(8, bean.getJpFreight());
			stmt.setInt(9, bean.getMiscViaId());
			stmt.setInt(10, bean.getMisc());
			stmt.setInt(11, bean.getJpId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = bean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 刪除
	private static final String DELETE = "DELETE FROM JointPurchase where JPID=?";

	@Override
	public boolean delete(int jpId) {
		try (Connection conn = dataSource.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
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
	
	private static final String SELECT_JPID_BY_SELLERID = "SELECT JointPurchase.JPID FROM JPDetail JOIN Product ON JPDetail.productId = Product.productId JOIN JointPurchase ON JPDetail.JPID = JointPurchase.JPID WHERE sellerId=? AND JPStatusID = 4101";

	public List<JointPurchaseBean> selectJpIdBySellerId(int sellerId) {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_JPID_BY_SELLERID);) 
		{
			stmt.setInt(1, sellerId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<JointPurchaseBean>();
			while (rset.next()) {
				JointPurchaseBean bean = new JointPurchaseBean();
				bean = select(rset.getInt("jpId"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
}
