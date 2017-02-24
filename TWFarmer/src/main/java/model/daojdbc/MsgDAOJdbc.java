package model.daojdbc;

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

import model.bean.MsgBean;
import model.dao.MsgDAO;

public class MsgDAOJdbc implements MsgDAO {
	private DataSource dataSource;

	public MsgDAOJdbc() {

	}
	
	public MsgDAOJdbc(DataSource dataSource) {
		this.dataSource = dataSource;
	}


	private static final String INSERT = "insert into Msg (MsgWriterID, MsgReaderID, MsgTitle, MsgContent, MsgTime, MsgStatus, WriterDelete, ReaderDelete) values (?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public MsgBean insert(MsgBean msgBean) {
		MsgBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (msgBean != null) {

				stmt.setInt(1, msgBean.getMsgWriterId());
				stmt.setInt(2, msgBean.getMsgReaderId());
				stmt.setString(3, msgBean.getMsgTitle());
				stmt.setString(4, msgBean.getMsgContent());

				java.util.Date msgTime = msgBean.getMsgTime();
				if (msgTime != null) {
					long time = msgTime.getTime();
					stmt.setTimestamp(5, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(5, null);
				}

				stmt.setInt(6, msgBean.getMsgStatus());
				stmt.setInt(7, msgBean.getWriterDelete());
				stmt.setInt(8, msgBean.getReaderDelete());

				int i = stmt.executeUpdate();
				if (i == 1) {
					result = msgBean;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "update Msg set MsgWriterID=?, MsgReaderID=?, MsgTitle=?, MsgContent=?, MsgTime=?, MsgStatus=?, WriterDelete=?, ReaderDelete=? where MsgID=?";

	@Override
	public MsgBean update(MsgBean msgBean) {
		MsgBean result = null;

		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setInt(1, msgBean.getMsgWriterId());
			stmt.setInt(2, msgBean.getMsgReaderId());
			stmt.setString(3, msgBean.getMsgTitle());
			stmt.setString(4, msgBean.getMsgContent());

			java.util.Date msgTime = msgBean.getMsgTime();
			if (msgTime != null) {
				long time = msgTime.getTime();
				stmt.setTimestamp(5, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(5, null);
			}

			stmt.setInt(6, msgBean.getMsgStatus());
			stmt.setInt(7, msgBean.getWriterDelete());
			stmt.setInt(8, msgBean.getReaderDelete());

			stmt.setInt(9, msgBean.getMsgId());

			int i = stmt.executeUpdate();
			if (i == 1) {
				result = msgBean;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from Msg where MsgID=?";

	@Override
	public boolean delete(int msgId) {
		try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, msgId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_ID = "select * from Msg where MsgID=?";

	@Override
	public MsgBean select(int msgId) {
		MsgBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, msgId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MsgBean();
				result.setMsgId(rset.getInt("msgId"));
				result.setMsgWriterId(rset.getInt("msgWriterId"));
				result.setMsgReaderId(rset.getInt("msgReaderId"));
				result.setMsgTitle(rset.getString("msgTitle"));
				result.setMsgContent(rset.getString("msgContent"));
				result.setMsgTime(rset.getTimestamp("msgTime"));
				result.setMsgStatus(rset.getInt("msgStatus"));
				result.setWriterDelete(rset.getInt("WriterDelete"));
				result.setReaderDelete(rset.getInt("ReaderDelete"));
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

	private static final String SELECT_BY_READER_ID = "SELECT * FROM Msg m FULL OUTER JOIN Friend f ON m.MsgReaderID=f.MemberId AND m.MsgWriterID=f.FriendId WHERE (f.FriendStatus=0 OR f.FriendStatus is null) AND MsgReaderID=? and readerDelete=0 ORDER BY msgTime DESC";

	@Override
	public List<MsgBean> selectByReaderId(int msgReaderId) {
		List<MsgBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_READER_ID);) {
			stmt.setInt(1, msgReaderId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<MsgBean>();
			while (rset.next()) {
				MsgBean msgBean = new MsgBean();
				msgBean.setMsgId(rset.getInt("msgId"));
				msgBean.setMsgWriterId(rset.getInt("msgWriterId"));
				msgBean.setMsgReaderId(rset.getInt("msgReaderId"));
				msgBean.setMsgTitle(rset.getString("msgTitle"));
				msgBean.setMsgContent(rset.getString("msgContent"));
				msgBean.setMsgTime(rset.getTimestamp("msgTime"));
				msgBean.setMsgStatus(rset.getInt("msgStatus"));
				msgBean.setWriterDelete(rset.getInt("WriterDelete"));
				msgBean.setReaderDelete(rset.getInt("ReaderDelete"));

				result.add(msgBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	private static final String SELECT_ALL = "select * from Msg";

	@Override
	public List<MsgBean> select() {
		List<MsgBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<MsgBean>();
			while (rset.next()) {
				MsgBean msgBean = new MsgBean();
				msgBean.setMsgId(rset.getInt("msgId"));
				msgBean.setMsgWriterId(rset.getInt("msgWriterId"));
				msgBean.setMsgReaderId(rset.getInt("msgReaderId"));
				msgBean.setMsgTitle(rset.getString("msgTitle"));
				msgBean.setMsgContent(rset.getString("msgContent"));
				msgBean.setMsgTime(rset.getTimestamp("msgTime"));
				msgBean.setMsgStatus(rset.getInt("msgStatus"));
				msgBean.setWriterDelete(rset.getInt("WriterDelete"));
				msgBean.setReaderDelete(rset.getInt("ReaderDelete"));

				result.add(msgBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String SELECT_BY_WRITERID = "select * from Msg where msgWriterId=? and writerDelete=0 order by msgTime desc";
	
	@Override
	public List<MsgBean> selectByWriterId(int writerId) {
		List<MsgBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_WRITERID);
				) {
			stmt.setInt(1, writerId);
			ResultSet rset = stmt.executeQuery();
			result = new ArrayList<MsgBean>();
			while (rset.next()) {
				MsgBean msgBean = new MsgBean();
				msgBean.setMsgId(rset.getInt("msgId"));
				msgBean.setMsgWriterId(rset.getInt("msgWriterId"));
				msgBean.setMsgReaderId(rset.getInt("msgReaderId"));
				msgBean.setMsgTitle(rset.getString("msgTitle"));
				msgBean.setMsgContent(rset.getString("msgContent"));
				msgBean.setMsgTime(rset.getTimestamp("msgTime"));
				msgBean.setMsgStatus(rset.getInt("msgStatus"));
				msgBean.setWriterDelete(rset.getInt("WriterDelete"));
				msgBean.setReaderDelete(rset.getInt("ReaderDelete"));
				
				result.add(msgBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
