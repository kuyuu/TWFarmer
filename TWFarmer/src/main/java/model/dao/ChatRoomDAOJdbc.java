package model.dao;

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

import model.ChatRoomBean;
import model.ChatRoomDAO;


public class ChatRoomDAOJdbc implements ChatRoomDAO {
	private DataSource dataSource;
	public ChatRoomDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ChatRoomDAO dao = new ChatRoomDAOJdbc();

		// 新增
//		ChatRoomBean chatRoomBean1 = new ChatRoomBean();
//
//		chatRoomBean1.setWriterId(1001);
//		chatRoomBean1.setReaderId(1004);
//		chatRoomBean1.setChatMsgContent("請問橘子一斤多少錢？");
//		chatRoomBean1.setChatMsgTime(java.sql.Timestamp.valueOf("2016-12-26 08:15:50"));
//		
//		ChatRoomBean q = dao.insert(chatRoomBean1);
//		System.out.println(q);
//
		// 修改
//		ChatRoomBean chatRoomBean2 = new ChatRoomBean();
//
//		chatRoomBean2.setChatMsgId(5201);
//		chatRoomBean2.setWriterId(1001);
//		chatRoomBean2.setReaderId(1004);
//		chatRoomBean2.setChatMsgContent("請問橘子一斤多少錢？PPP");
//		chatRoomBean2.setChatMsgTime(java.sql.Timestamp.valueOf("2016-12-26 08:15:50"));
//		
//		ChatRoomBean q = dao.update(chatRoomBean2);
//		System.out.println(q);

		// 刪除
		dao.delete(5201);
//
		// 查詢單筆
//		 ChatRoomBean chatRoomBean3 = dao.select(5201);
//		 System.out.print(chatRoomBean3.getChatMsgId() + ",");
//		 System.out.print(chatRoomBean3.getWriterId() + ",");
//		 System.out.print(chatRoomBean3.getReaderId() + ",");
//		 System.out.print(chatRoomBean3.getChatMsgContent() + ",");
//		 System.out.println(chatRoomBean3.getChatMsgTime() );
		

		// 查詢全部
//		List<ChatRoomBean> beans = dao.select();
//		System.out.println("bean=" + beans);
	}

	private static final String INSERT = "insert into ChatRoom (WriterID, ReaderID, ChatMsgContent, ChatMsgTime) values (?, ?, ?, ?)";

	@Override
	public ChatRoomBean insert(ChatRoomBean chatRoomBean) {
		ChatRoomBean result = null;
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);
			if (chatRoomBean != null) {

				stmt.setInt(1, chatRoomBean.getWriterId());

				stmt.setInt(2, chatRoomBean.getReaderId());

				stmt.setString(3, chatRoomBean.getChatMsgContent());

				java.util.Date chatMsgTime = chatRoomBean.getChatMsgTime();
				if (chatMsgTime != null) {
					long time = chatMsgTime.getTime();
					stmt.setTimestamp(4, new java.sql.Timestamp(time));
				} else {
					stmt.setTimestamp(4, null);
				}

				int i = stmt.executeUpdate();
				if (i == 1) {
					result = chatRoomBean;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	private static final String UPDATE = "update ChatRoom set WriterID=?, ReaderID=?, ChatMsgContent=?, ChatMsgTime=? where ChatMsgID=?";

	@Override
	public ChatRoomBean update(ChatRoomBean chatRoomBean) {
		ChatRoomBean result = null;

		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			
			stmt.setInt(1, chatRoomBean.getWriterId());

			stmt.setInt(2, chatRoomBean.getReaderId());

			stmt.setString(3, chatRoomBean.getChatMsgContent());

			java.util.Date chatMsgTime = chatRoomBean.getChatMsgTime();
			if (chatMsgTime != null) {
				long time = chatMsgTime.getTime();
				stmt.setTimestamp(4, new java.sql.Timestamp(time));
			} else {
				stmt.setTimestamp(4, null);
			}

			stmt.setInt(5, chatRoomBean.getChatMsgId());
			
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = chatRoomBean;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from ChatRoom where ChatMsgID=?";

	@Override
	public boolean delete(int chatMsgId) {
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			stmt.setInt(1, chatMsgId);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private static final String SELECT_BY_ID = "select * from ChatRoom where ChatMsgId=?";

	@Override
	public ChatRoomBean select(int chatMsgId) {
		ChatRoomBean result = null;
		ResultSet rset = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {

			stmt.setInt(1, chatMsgId);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new ChatRoomBean();
				result.setChatMsgId(rset.getInt("chatMsgId"));
				result.setWriterId(rset.getInt("writerId"));
				result.setReaderId(rset.getInt("readerId"));
				result.setChatMsgContent(rset.getString("chatMsgContent"));
				result.setChatMsgTime(rset.getTimestamp("chatMsgTime"));
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

	private static final String SELECT_ALL = "select * from ChatRoom";

	@Override
	public List<ChatRoomBean> select() {
		List<ChatRoomBean> result = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
				ResultSet rset = stmt.executeQuery();) {

			result = new ArrayList<ChatRoomBean>();
			while (rset.next()) {
				ChatRoomBean chatRoomBean = new ChatRoomBean();
				chatRoomBean.setChatMsgId(rset.getInt("chatMsgId"));
				chatRoomBean.setWriterId(rset.getInt("writerId"));
				chatRoomBean.setReaderId(rset.getInt("readerId"));
				chatRoomBean.setChatMsgContent(rset.getString("chatMsgContent"));
				chatRoomBean.setChatMsgTime(rset.getTimestamp("chatMsgTime"));

				result.add(chatRoomBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
