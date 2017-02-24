package model.daojdbc;

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

import model.bean.F2FDetailBean;
import model.dao.F2FDetailDAO;

public class F2FDetailDAOjdbc implements F2FDetailDAO {

	DataSource dataSource;

	public F2FDetailDAOjdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public F2FDetailDAOjdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// //測試程式
	// public static void main(String[] args) {
	// F2FDetailDAO dao = new F2FDetailDAOjdbc();
	//// 查詢所有資料
	// List<F2FDetailBean> beans = dao.select();
	// System.out.println("bean="+beans);
	// //查詢單筆資料
	// F2FDetailBean f2fDetailSelect = dao.select(4301);
	// System.out.print(f2fDetailSelect.getF2fId() + ",");
	// System.out.print(f2fDetailSelect.getJpId() + ",");
	// System.out.print(f2fDetailSelect.getF2fPlace() + ",");
	// System.out.print(f2fDetailSelect.getF2fTime() + ",");

	// 新增
	// F2FDetailBean f2fDetailInsert = new F2FDetailBean();
	//
	// f2fDetailInsert.setJpId(4001);
	// f2fDetailInsert.setF2fPlace("永和區郵局");
	// f2fDetailInsert.setF2fTime(java.sql.Timestamp.valueOf("2017-01-31
	// 18:20:00"));
	//
	// F2FDetailBean f2fDetailadd = dao.insert(f2fDetailInsert);
	// System.out.println(f2fDetailadd);

	// 修改
	// F2FDetailBean f2fDetailUpdate = new F2FDetailBean();
	//
	// f2fDetailUpdate.setF2fId(4304);
	// f2fDetailUpdate.setJpId(4002);
	// f2fDetailUpdate.setF2fPlace("雙和里公車站牌");
	// f2fDetailUpdate.setF2fTime(java.sql.Timestamp.valueOf("2017-01-31
	// 10:30:00"));
	//
	// F2FDetailBean f2fDetailChange = dao.update(f2fDetailUpdate);
	// System.out.println(f2fDetailChange);

	// 刪除
	// dao.delete(4304);
	// System.out.println("資料已刪除");
	//
	// }

	// 查詢
	private static final String SELECT_BY_ID = "select * from F2FDetail where F2FId=?";

	@Override
	public F2FDetailBean select(int f2fId) {
		F2FDetailBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, f2fId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new F2FDetailBean();
				result.setF2fId(rset.getInt("f2fId"));
				result.setJpId(rset.getInt("jpId"));
				result.setF2fPlace(rset.getString("f2fPlace"));
				result.setF2fTime(rset.getTimestamp("f2fTime"));
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

	private static final String SELECT_ALL = "select * from F2FDetail";

	@Override
	public List<F2FDetailBean> select() {
		List<F2FDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<F2FDetailBean>();
			while (rset.next()) {
				F2FDetailBean bean = new F2FDetailBean();
				bean.setF2fId(rset.getInt("f2fId"));
				bean.setJpId(rset.getInt("jpId"));
				bean.setF2fPlace(rset.getString("f2fPlace"));
				bean.setF2fTime(rset.getTimestamp("f2fTime"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 新增
	private static final String INSERT = "insert into F2FDetail (JPID, F2FPlace, F2FTime) values (?,?,?)";

	@Override
	public F2FDetailBean insert(F2FDetailBean bean) {
		F2FDetailBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (bean != null) {
				stmt.setInt(1, bean.getJpId());
				stmt.setString(2, bean.getF2fPlace());

				Date f2fTime = bean.getF2fTime();
				if (f2fTime != null) {
					long time = f2fTime.getTime();
					stmt.setTimestamp(3, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(3, null);
				}

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

	// 修改
	private static final String UPDATE = "update F2FDetail " + "set JPId=?, " + "F2FPlace=?, " + "F2FTime=? "
			+ "where F2FId=?";

	@Override
	public F2FDetailBean update(F2FDetailBean bean) {
		F2FDetailBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getJpId());
			stmt.setString(2, bean.getF2fPlace());

			if (bean.getF2fTime() != null) {
				long time = bean.getF2fTime().getTime();
				stmt.setTimestamp(3, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(3, null);
			}

			stmt.setInt(4, bean.getF2fId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getF2fId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 刪除
	private static final String DELETE = "DELETE FROM F2FDetail where F2FID=?";

	@Override
	public boolean delete(int f2fId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, f2fId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_JPID = "select * from F2FDetail where JPID=?";

	@Override
	public List<F2FDetailBean> selectByJpId(int jpId) {
		List<F2FDetailBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);) {
			stmt.setInt(1, jpId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<F2FDetailBean>();
			while (rset.next()) {
				F2FDetailBean bean = new F2FDetailBean();
				bean.setF2fId(rset.getInt("f2fId"));
				bean.setJpId(rset.getInt("jpId"));
				bean.setF2fPlace(rset.getString("f2fPlace"));
				bean.setF2fTime(rset.getTimestamp("f2fTime"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
