package model.daojdbc;

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

import model.bean.MsgBoardBean;
import model.bean.QnABean;
import model.dao.MsgBoardDAO;
import model.dao.QnADAO;

public class MsgBoardDAOJdbc implements MsgBoardDAO {
	private DataSource dataSource;

	public MsgBoardDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public MsgBoardDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	private static final String INSERT = "insert into MsgBoard (MsgBoardID, WriterID, JpId, Content, MsgTime) values (?, ?, ?, ?, ?)";

	@Override
	public MsgBoardBean insert(MsgBoardBean msgBoardBean) {
		MsgBoardBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (msgBoardBean != null) {

				stmt.setInt(1, msgBoardBean.getMsgBoardID());
				stmt.setInt(2, msgBoardBean.getWriterID());
				stmt.setInt(3, msgBoardBean.getJpId());
				stmt.setString(4, msgBoardBean.getContent());
				java.util.Date Date = msgBoardBean.getMsgTime();
				if (Date != null) {
					long time = Date.getTime();
					stmt.setTimestamp(5, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(5, null);
				}

				int i = stmt.executeUpdate();
				if (i == 1) {
					result = msgBoardBean;
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String SELECT_BY_JPID = "select * from MsgBoard where JPID=?";

	@Override
	public List<MsgBoardBean> selectByJpId(int jpId) {
		List<MsgBoardBean> result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_JPID);) {

			stmt.setInt(1, jpId);
			rset = stmt.executeQuery();
			result = new ArrayList<MsgBoardBean>();
			while (rset.next()) {
				MsgBoardBean bean = new MsgBoardBean();
				bean.setMsgBoardID(rset.getInt("MsgBoardID"));
				bean.setWriterID(rset.getInt("WriterID"));
				bean.setJpId(rset.getInt("JpId"));
				bean.setContent(rset.getString("Content"));
				bean.setMsgTime(rset.getTimestamp("MsgTime"));

				result.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
