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
import model.FriendBean;
import model.FriendDAO;
import model.MsgBean;
import model.TrackProductBean;

public class FriendDAOJdbc implements FriendDAO {
	private DataSource dataSource;

	public FriendDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		FriendDAO dao = new FriendDAOJdbc();
		List<FriendBean> beans = dao.select();
		System.out.println("bean=" + beans);

	}

	
	private static final String SELECT_ALL = "select * from Friend";

	@Override
	public List<FriendBean> select() {
		List<FriendBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<FriendBean>();
			while (rset.next()) {
				FriendBean friendBean = new FriendBean();
				friendBean.setMemberId(rset.getInt("memberId"));
				friendBean.setFriendId(rset.getInt("friendId"));
				friendBean.setFriendStatus(rset.getInt("friendStatus"));
				result.add(friendBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_PK = "SELECT * from Friend where MemberId=? and FriendId=?";

	@Override
	public FriendBean select(int memberId, int friendId) {
		FriendBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_PK);) {
			stmt.setInt(1, memberId);
			stmt.setInt(2, friendId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new FriendBean();
				result.setMemberId(rset.getInt("memberId"));
				result.setFriendId(rset.getInt("friendId"));
				result.setFriendStatus(rset.getInt("friendStatus"));
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
	
	private static final String SELECT_BY_MemberID = "select * from Friend where MemberID=?";

	@Override
	public List<FriendBean> selectByMemberId(int memberId) {
		List<FriendBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MemberID);) {
			stmt.setInt(1, memberId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<FriendBean>();
			while (rset.next()) {
				FriendBean friendBean = new FriendBean();
				friendBean.setMemberId(rset.getInt("memberId"));
				friendBean.setFriendId(rset.getInt("friendId"));
				friendBean.setFriendStatus(rset.getInt("friendStatus"));
					
				result.add(friendBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_FriendID = "select * from Friend where FriendID=?";

	@Override
	public List<FriendBean> selectByFriendId(int friendId) {
		List<FriendBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_FriendID);) {
			stmt.setInt(1, friendId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<FriendBean>();
			while (rset.next()) {
				FriendBean friendBean = new FriendBean();
				friendBean.setMemberId(rset.getInt("memberId"));
				friendBean.setFriendId(rset.getInt("friendId"));
				friendBean.setFriendStatus(rset.getInt("friendStatus"));		
				result.add(friendBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
		
	private static final String INSERT = "insert into Friend (MemberID, FriendID, FriendStatus) values (?, ?, ?)";

	@Override
	public FriendBean insert(FriendBean friendBean) {
		FriendBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(INSERT);) {
			if (friendBean != null) {
				stmt.setInt(1, friendBean.getMemberId());
				stmt.setInt(2, friendBean.getFriendId());
				stmt.setInt(3, friendBean.getFriendStatus());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = friendBean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "UPDATE Friend SET FriendStatus=? WHERE MemberId=? AND FriendId=?";

	@Override
	public FriendBean update(FriendBean bean) {
		FriendBean result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setInt(1, bean.getMemberId());
			stmt.setInt(2, bean.getFriendId());
			stmt.setInt(3, bean.getFriendStatus());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(bean.getMemberId(), bean.getFriendId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE_BY_MEMBERID = "delete from Friend where FriendID=?";

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
	
	private static final String DELETE_BY_FRIENDID = "delete from Friend where FriendID=?";

	@Override
	public boolean deleteByFriendId(int friendId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_FRIENDID);) {
			stmt.setInt(1, friendId);
			int i = stmt.executeUpdate();
			if (i >= 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	private static final String DELETE_BY_PK = "delete from Friend where MemberID=? and FriendID=?";
	@Override
	public boolean delete(int memberId, int friendId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE_BY_PK);) {
			stmt.setInt(1, memberId);
			stmt.setInt(2, friendId);
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
