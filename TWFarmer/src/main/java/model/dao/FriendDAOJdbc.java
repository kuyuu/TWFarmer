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

	private static final String SELECT_WHITE_BY_MEMBERID = "select * from Friend where memberId=? and FriendStatus=0";

	@Override
	public List<FriendBean> selectWhiteByMemberId(int memberId) {
		List<FriendBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_WHITE_BY_MEMBERID);) {
			stmt.setInt(1, memberId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<FriendBean>();
			while (rset.next()) {
				FriendBean bean = new FriendBean();
				bean.setMemberId(rset.getInt("MemberID"));
				bean.setFriendId(rset.getInt("FriendId"));
				bean.setFriendStatus(rset.getInt("FriendStatus"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String SELECT_BLACK_BY_MEMBERID = "select * from Friend where memberId=? and FriendStatus=1";

	@Override
	public List<FriendBean> selectBlackByMemberId(int memberId) {
		List<FriendBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BLACK_BY_MEMBERID);) {
			stmt.setInt(1, memberId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<FriendBean>();
			while (rset.next()) {
				FriendBean bean = new FriendBean();
				bean.setMemberId(rset.getInt("MemberID"));
				bean.setFriendId(rset.getInt("FriendId"));
				bean.setFriendStatus(rset.getInt("FriendStatus"));
				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String INSERT = "insert into Friend (MemberID, FriendId, FriendStatus) values (?, ?, ?)";

	@Override
	public FriendBean insert(FriendBean friendBean) {
		FriendBean result = null;
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(INSERT);) {
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

}
