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

	public JointPurchaseDAOjdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

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
				result.setBankAccount(rset.getString("bankAccount"));
				result.setBankName(rset.getString("bankName"));
				result.setPictureName(rset.getString("pictureName"));
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
				bean.setBankAccount(rset.getString("bankAccount"));
				bean.setBankName(rset.getString("bankName"));
				bean.setPictureName(rset.getString("pictureName"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_KEYWORD = "Select * from JointPurchase Where  JPStatusID = 4103 and (JPName Like ? or JPLocation like ?)";

	@Override
	public List<JointPurchaseBean> selectByKeyword(String Keyword) {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_KEYWORD);) {

			stmt.setString(1, "%" + Keyword + "%");
			stmt.setString(2, "%" + Keyword + "%");
			ResultSet rset = stmt.executeQuery();
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
				bean.setBankAccount(rset.getString("bankAccount"));
				bean.setBankName(rset.getString("bankName"));
				bean.setPictureName(rset.getString("pictureName"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_JPOK = "SELECT * from JointPurchase where JPStatusID = 4103";

	@Override
	public List<JointPurchaseBean> selectByPurchaseOk() {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_JPOK);
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
				bean.setBankAccount(rset.getString("bankAccount"));
				bean.setBankName(rset.getString("bankName"));
				bean.setPictureName(rset.getString("pictureName"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 新增
	private static final String INSERT = "insert into JointPurchase (InitID, JPName, JPIntro, InitDate, EndDate, JPLocation, JPStatusID, JPFreight, MiscViaID, Misc, BankAccount, BankName, PictureName) "
			+ "OUTPUT INSERTED.JPID " + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

	@Override
	public JointPurchaseBean insert(JointPurchaseBean bean) {
		JointPurchaseBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
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
				stmt.setString(11, bean.getBankAccount());
				stmt.setString(12, bean.getBankName());
				stmt.setString(13, bean.getPictureName());

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
	private static final String UPDATE = "UPDATE JointPurchase " + "SET InitId=?, " + "JPName=?, " + "JPIntro=?, "
			+ "InitDate=?, " + "EndDate=?, " + "JPLocation=?, " + "JPStatusID=?, " + "JPFreight=?, " + "MiscViaID=?, "
			+ "Misc=?, " + "BankAccount=?, " + "BankName=?, " + "PictureName=? " + "WHERE JPId=?";

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
			stmt.setString(11, bean.getBankAccount());
			stmt.setString(12, bean.getBankName());
			stmt.setString(13, bean.getPictureName());
			stmt.setInt(14, bean.getJpId());
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
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
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

	private static final String SELECT_JPID_BY_SELLERID = "SELECT DISTINCT JointPurchase.JPID FROM JPDetail JOIN Product ON JPDetail.productId = Product.productId JOIN JointPurchase ON JPDetail.JPID = JointPurchase.JPID WHERE sellerId=? AND JPStatusID = 4101";

	public List<JointPurchaseBean> selectJpIdBySellerId(int sellerId) {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_JPID_BY_SELLERID);) {
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

	private static final String SELECT_JPID_BY_SELLERID2 = "SELECT DISTINCT JointPurchase.JPID FROM JPDetail JOIN Product ON JPDetail.productId = Product.productId JOIN JointPurchase ON JPDetail.JPID = JointPurchase.JPID WHERE sellerId=? AND JPStatusID != 4101";

	public List<JointPurchaseBean> selectJpIdBySellerId2(int sellerId) {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_JPID_BY_SELLERID2);) {
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

	private static final String SELECT_JPID_BY_INITID = "SELECT * FROM JointPurchase WHERE InitID=?";

	public List<JointPurchaseBean> selectByInitId(int initId) {
		List<JointPurchaseBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_JPID_BY_INITID);) {
			stmt.setInt(1, initId);
			ResultSet rset = stmt.executeQuery();
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
				bean.setBankAccount(rset.getString("bankAccount"));
				bean.setBankName(rset.getString("bankName"));
				bean.setPictureName(rset.getString("pictureName"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}

}
