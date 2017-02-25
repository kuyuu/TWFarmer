package model.daojdbc;

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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.MemberBean;
import model.bean.TrackProductBean;
import model.dao.TrackProductDAO;

public class TrackProductDAOJdbc implements TrackProductDAO {
	DataSource dataSource;

	public TrackProductDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public TrackProductDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// public static void main(String[] args) {
	// TrackProductDAO ppdao = new TrackProductDAOJdbc();
	// System.out.println("Select By Member ID:");
	// List<TrackProductBean> selectByMemberIds = ppdao.selectByMemberId(1001);
	// for (TrackProductBean selectByMemberId : selectByMemberIds) {
	// System.out.println(selectByMemberId.getMemberId());
	// }
	//
	// System.out.println("Select By Product ID:");
	// List<TrackProductBean> selectByProductIds =
	// ppdao.selectByProductId(2001);
	// for (TrackProductBean selectByProductId : selectByProductIds) {
	// System.out.println(selectByProductId.getProductId());
	// }
	//
	// System.out.println("Select All:");
	// List<TrackProductBean> selectAll = ppdao.select();
	// for (TrackProductBean select : selectAll) {
	// System.out.println(select.getMemberId() + ":" + select.getProductId() +
	// ":" + select.getTrackDate());
	// }
	//
	// System.out.println("Select By PrimaryKey:");
	// TrackProductBean selectByPk = ppdao.select(1001, 2001);
	// System.out
	// .println(selectByPk.getMemberId() + ":" + selectByPk.getProductId() + ":"
	// + selectByPk.getTrackDate());
	//
	// System.out.println("Insert:");
	// TrackProductBean update = new TrackProductBean();
	// update.setMemberId(1002);
	// update.setProductId(2003);
	// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	// try {
	// update.setTrackDate(sdf.parse("2001-11-11"));
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// ppdao.insert(update);
	// System.out.println(update.getTrackDate());
	//
	// ppdao.deleteByMemberId(1001);
	// ppdao.deleteByProductId(2002);
	// ppdao.delete(1002, 2003);
	//
	// }

	private static final String SELECT_BY_PK = "SELECT * from TrackProduct where MemberId=? and ProductId=?";

	@Override
	public TrackProductBean select(int memberId, int productId) {
		TrackProductBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {
			stmt.setInt(1, memberId);
			stmt.setInt(2, productId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new TrackProductBean();
				result.setMemberId(rset.getInt("memberId"));
				result.setProductId(rset.getInt("productId"));
				result.setTrackDate(rset.getDate("trackDate"));
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

	private static final String SELECT_BY_MEMBERID = "select * from TrackProduct where memberId=? order by trackDate desc";

	@Override
	public List<TrackProductBean> selectByMemberId(int memberId) {
		List<TrackProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MEMBERID);) {
			stmt.setInt(1, memberId);
			ResultSet rset = stmt.executeQuery();
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

	private static final String SELECT_BY_PRODUCTID = "select * from TrackProduct where ProductID=?";

	@Override
	public List<TrackProductBean> selectByProductId(int productId) {
		List<TrackProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PRODUCTID);) {
			stmt.setInt(1, productId);
			ResultSet rset = stmt.executeQuery();
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

	private static final String SELECT_ALL = "select * from TrackProduct";

	@Override
	public List<TrackProductBean> select() {
		List<TrackProductBean> result = null;
		try (Connection conn = dataSource.getConnection();
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
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
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

	private static final String UPDATE = "UPDATE TrackProduct SET TrackDate=? WHERE MemberId=? AND ProductId=?";

	@Override
	public TrackProductBean update(TrackProductBean bean) {
		TrackProductBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			java.sql.Date date = new java.sql.Date(bean.getTrackDate().getTime());
			stmt.setDate(1, date);
			stmt.setInt(2, bean.getMemberId());
			stmt.setInt(3, bean.getProductId());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getMemberId(), bean.getProductId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_MEMBERID = "delete from TrackProduct where MemberID=?";

	@Override
	public boolean deleteByMemberId(int memberId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_MEMBERID);) {
			stmt.setInt(1, memberId);
			int i = stmt.executeUpdate();
			if (i >= 1) {
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
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PRODUCTID);) {
			stmt.setInt(1, productId);
			int i = stmt.executeUpdate();
			if (i >= 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String DELETE_BY_PK = "delete from TrackProduct where MemberID=? and ProductID=?";

	@Override
	public boolean delete(int memberId, int productId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PK);) {
			stmt.setInt(1, memberId);
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
