package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.TrackProductBean;
import model.TrackProductDAO;

public class TrackProductDAOJdbc implements TrackProductDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=TWFarmer";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "P@ssw0rd";
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public static void main(String[] args) {
		TrackProductDAO ppdao = new TrackProductDAOJdbc();

		TrackProductBean bean = ppdao.selectByMemberId(1001);
		System.out.println("bean(MemberID) = " + bean);

		bean = ppdao.selectByProductId(2001);
		System.out.println("bean(Product) = " + bean);

		List<TrackProductBean> beans = ppdao.select();
		System.out.println("beans = " + beans);

		TrackProductBean insert = ppdao.selectByProductId(2001);
		insert.setMemberId(1002);
		ppdao.insert(insert);

		Date date = null;
		try {
			date = sdf.parse("2011-11-11");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		TrackProductBean update = new TrackProductBean();
		update.setMemberId(1002);
		update.setProductId(2002);
		update.setTrackDate(date);
		ppdao.updateByMemberId(update);
		
		ppdao.deleteByMemberId(1001);
		
		ppdao.deleteByProductId(2002);

	}

	private static final String SELECT_BY_MEMBERID = "select * from TrackProduct where memberId=?";

	@Override
	public TrackProductBean selectByMemberId(int memberId) {
		TrackProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MEMBERID);) {

			stmt.setInt(1, memberId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new TrackProductBean();
				result.setMemberId(rset.getInt("MemberID"));
				result.setProductId(rset.getInt("ProductID"));
				result.setTrackDate(rset.getDate("TrackDate"));
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

	private static final String SELECT_BY_PRODUCTID = "select * from TrackProduct where ProductID=?";

	@Override
	public TrackProductBean selectByProductId(int productId) {
		TrackProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {

			stmt.setInt(1, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new TrackProductBean();
				result.setMemberId(rset.getInt("MemberID"));
				result.setProductId(rset.getInt("ProductID"));
				result.setTrackDate(rset.getDate("TrackDate"));
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

	private static final String SELECT_ALL = "select * from TrackProduct";

	@Override
	public List<TrackProductBean> select() {
		List<TrackProductBean> result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<TrackProductBean>();
			while (rset.next()) {
				TrackProductBean bean = new TrackProductBean();
				bean.setMemberId(rset.getInt("MemberID"));
				bean.setProductId(rset.getInt("ProductID"));
				bean.setTrackDate(rset.getDate("TrackDate"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into TrackProduct (MemberID, ProductID, TrackDate) values (?, ?, ?)";

	@Override
	public TrackProductBean insert(TrackProductBean trackProductBean) {
		TrackProductBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (trackProductBean != null) {
				stmt.setInt(1, trackProductBean.getMemberId());
				stmt.setInt(2, trackProductBean.getProductId());
				java.sql.Date d = new java.sql.Date(trackProductBean.getTrackDate().getTime());
				stmt.setDate(3, d);
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = trackProductBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update TrackProduct set ProductID=?, TrackDate=? where MemberID=?";

	@Override
	public TrackProductBean updateByMemberId(TrackProductBean trackProductBean) {
		TrackProductBean result = null;
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, trackProductBean.getProductId());
			java.sql.Date d = new java.sql.Date(trackProductBean.getTrackDate().getTime());
			stmt.setDate(2, d);
			stmt.setInt(3, trackProductBean.getMemberId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.selectByMemberId(trackProductBean.getMemberId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_MEMBERID = "delete from TrackProduct where MemberID=?";

	@Override
	public boolean deleteByMemberId(int memberId) {
		try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_MEMBERID);) {
			stmt.setInt(1, memberId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private static final String DELETE_BY_PRODUCTID = "delete from TrackProduct where ProductID=?";

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
